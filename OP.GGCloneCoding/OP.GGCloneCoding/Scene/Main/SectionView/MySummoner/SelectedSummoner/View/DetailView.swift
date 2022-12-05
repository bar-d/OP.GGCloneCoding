//
//  DetailView.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/09.
//

import UIKit

final class DetailView: UIView {

    // MARK: Properties

    private lazy var summonerDetailViewModel = SummonerDetailViewModel(output: .init(
        setupChampionIconImage: setupChampionIconImage(with:),
        setupChampionLabels: setupChampionLabels(with:),
        showErrorAlert: showErrorAlert(from:))
    )

    private weak var summonerDetailViewDelegate: SummonerDetailViewDelegate?

    private let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 4

        return stackView
    }()

    private let winRateLabel = LabelBuilder()
        .setupConstraintsAutomatic(false)
        .setupLabelText(text: "9승 11패 45%", color: .label)
        .setupLabelTextAttributes(font: .headline)
        .build()

    private let KDALabel = LabelBuilder()
        .setupConstraintsAutomatic(false)
        .setupLabelText(text: Design.KDALabelText, color: .label)
        .setupLabelTextAttributes(font: .headline)
        .build()

    private let KDARateLabel = LabelBuilder()
        .setupConstraintsAutomatic(false)
        .setupLabelText(text: "2.74:1", color: .lightGray)
        .setupLabelTextAttributes(font: .headline)
        .build()

    private let championStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually

        return stackView
    }()

    private let firstChampionRateView = ChampionRateView()
    private let secondChampionRateView = ChampionRateView()
    private let thirdChampionRateView = ChampionRateView()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)

        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        commonInit()
    }

    // MARK: - Methods

    func setupSummonerDetailViewDelegate(_ delegate: SummonerDetailViewDelegate) {
        summonerDetailViewDelegate = delegate
    }

    private func commonInit() {
        setupConstraintsAutomatic(false)
        setupSubviews()
        setupConstraints()
        setupBackgroundColor(Design.backgroundColor)
        setupCornerRadius(10)
        setupContents()
    }

    private func setupConstraintsAutomatic(_ bool: Bool) {
        translatesAutoresizingMaskIntoConstraints = bool
    }

    private func setupSubviews() {
        [labelStackView, championStackView]
            .forEach { addSubview($0) }
        [winRateLabel, KDALabel, KDARateLabel]
            .forEach { labelStackView.addArrangedSubview($0) }
        [firstChampionRateView, secondChampionRateView, thirdChampionRateView]
            .forEach { championStackView.addArrangedSubview($0) }
    }

    private func setupConstraints() {
        setupLabelStackViewConstraints()
        setupChampionStackViewConstraints()
    }

    private func setupLabelStackViewConstraints() {
        NSLayoutConstraint.activate([
            labelStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            labelStackView.bottomAnchor.constraint(
                equalTo: championStackView.topAnchor,
                constant: -12
            )
        ])
    }

    private func setupChampionStackViewConstraints() {
        NSLayoutConstraint.activate([
            championStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            championStackView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -4
            ),
            championStackView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 8
            ),
            championStackView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -8
            ),
            heightAnchor.constraint(
                equalTo: championStackView.heightAnchor,
                multiplier: 2
            )
        ])
    }

    private func setupBackgroundColor(_ color: UIColor?) {
        backgroundColor = color
    }

    private func setupCornerRadius(_ radius: CGFloat) {
        layer.cornerRadius = radius
    }

    private func setupContents() {
        let summonerMatchArray = getSummonerMatch()
        let myMatch = filterMySummonerMatch()
        if summonerMatchArray.count == 0 {
            return
        }

        let kda = myMatch.reduce(0) { partialResult, participant in
            return partialResult + participant.kda / Double(myMatch.count)
        }

        KDARateLabel.text = "\(String(format: "%.2f", kda)):1"

        let win = myMatch.filter({ $0.win == true }).count
        let lose = myMatch.count - win
        
        winRateLabel.text = "\(win)승 \(lose)패 \(100 * win / myMatch.count)%"
    }
    
    private func getSummonerMatch() -> [SummonerMatch] {
        guard let unarchivedSummonerMatchData = UserDefaults.standard.object(
            forKey: "MySummonerMatchInformation"
        ) as? Data,
              let summonerMatchArray = try? JSONDecoder().decode(
                [SummonerMatch].self,
                from: unarchivedSummonerMatchData
              ) else {
            return []
        }
        
        return summonerMatchArray
    }
    
    private func filterMySummonerMatch() -> [SummonerMatch.Participant] {
        let summonerMatchArray = getSummonerMatch()
        
        guard let unarchivedSummonerData = UserDefaults.standard.object(
            forKey: "MySummonerInformation"
        ) as? Data,
              let summoner = try? JSONDecoder().decode(
                Summoner.self,
                from: unarchivedSummonerData
              ) else {
            return []
        }
        
        let myMatch = summonerMatchArray.map { (match) -> SummonerMatch.Participant in
            let myMatchList = match.participants.filter { participant in
                
                /// myMatchList에 아무것도 없을 때 어떻게 처리할 것인지 해결 필요
                return participant.summonerName == summoner.name
            }
            
            return myMatchList[0]
        }
        return myMatch
    }

    private func setupChampionIconImage(with championIcon: [UIImage]) {
        let imageViewArray = [firstChampionRateView, secondChampionRateView,
                              thirdChampionRateView]

        for i in 0..<championIcon.count {
            imageViewArray[i].setupImage(with: championIcon[i])
        }

        for i in 0..<(3 - championIcon.count) {
            imageViewArray[2 - i].setupImage(with: nil)
        }
    }

    private func setupChampionLabels(with labels: [(Int, Double)]) {
        let imageViewArray = [firstChampionRateView, secondChampionRateView,
                              thirdChampionRateView]

        for i in 0..<labels.count {
            imageViewArray[i].setupLabels(
                winRate: "\(String(labels[i].0))%",
                kda: "\(String(format: "%.2f", labels[i].1)):1"
            )
        }

        for i in 0..<(3 - labels.count) {
            imageViewArray[2 - i].setupLabels(winRate: nil, kda: nil)
        }
    }

    private func showErrorAlert(from alert: UIAlertController) {
        summonerDetailViewDelegate?.showAlert(from: alert)
    }
}

extension DetailView: ChampionIconFetcher {
    func fetchChampionInformation(with versionID: String) {
        summonerDetailViewModel.input.fetchChampionInformation(versionID)
    }
}

// MARK: - Namespace

private enum Design {
    static let KDALabelText = "KDA"
    static let backgroundColor = UIColor(named: "SecondaryColor")
}
