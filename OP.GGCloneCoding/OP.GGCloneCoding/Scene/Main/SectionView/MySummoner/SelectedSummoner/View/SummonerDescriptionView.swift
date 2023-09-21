//
//  SummonerDescriptionView.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/09.
//

import UIKit

final class SummonerDescriptionView: UIView {
    
    // MARK: Properties
    
    private lazy var dataDragonVersionViewModel = DataDragonVersionViewModel(
        output: .init(
            fetchProfileIconImage: fetchProfileIconImage,
            fetchChampionIconImage: fetchChampionIconImage,
            showErrorAlert: showErrorAlert(from:)
        )
    )
    
    private lazy var dataDragonProfileIconViewModel = DataDragonProfileIconViewModel(
        output: .init(
            setupContents: setupContents(with:),
            setupContentsWithSummoner: setupContents(with:),
            showErrorAlert: showErrorAlert(from:)
        )
    )
    
    private weak var summonerDescriptionViewDelegate: SummonerDescriptionViewDelegate?
    private weak var championIconFetcher: ChampionIconFetcher?
    
    private let iconImageView = ImageViewBuilder()
        .setupConstraintsAutomatic(false)
        .setupImage(image: UIImage(named: "OP.GGIcon"))
        .setupContentMode(.scaleAspectFit)
        .setupLayer(cornerRadius: 28)
        .build()
    
    private let levelLabel = LabelBuilder()
        .setupConstraintsAutomatic(false)
        .setupLabelText(text: " 100 " ,color: .label)
        .setupLayer(cornerRadius: 10)
        .setupLayerBackgroundColor(.lightGray)
        .build()
    
    private let summonerIDLabel = LabelBuilder()
        .setupConstraintsAutomatic(false)
        .setupLabelText(text: "바드의협곡여행")
        .setupLabelTextAttributes(font: .title3)
        .build()
    
    private let tierStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 4
        
        return stackView
    }()
    
    private let tierLabel = LabelBuilder()
        .setupConstraintsAutomatic(false)
        .setupLabelText(text: Design.tierLabelText)
        .setupLabelTextAttributes(font: .footnote)
        .build()
    
    private let tierIconImageView = ImageViewBuilder()
        .setupConstraintsAutomatic(false)
        .setupImage(image: UIImage(named: "Unranked")?.resize(width: 20))
        .build()
    
    private let separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        view.widthAnchor.constraint(equalToConstant: 1).isActive = true
        
        return view
    }()
    
    private let tierPointLabel = LabelBuilder()
        .setupConstraintsAutomatic(false)
        .setupLabelText(text: "23 LP")
        .setupLabelTextAttributes(font: .footnote)
        .build()
    
    private let cancelButton = ButtonBuilder()
        .setupConstraintsAutomatic(false)
        .setupImage(image: Design.cancelButtonImage, scale: .large)
        .setupColor(tint: .label, background: .clear)
        .build()
    
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
    
    func setupSummonerDescriptionViewDelegate(
        _ delegate: SummonerDescriptionViewDelegate
    ) {
        summonerDescriptionViewDelegate = delegate
    }
    
    func setupChampionIconFetcherDelegate(_ delegate: ChampionIconFetcher) {
        championIconFetcher = delegate
    }
    
    private func commonInit() {
        setupConstraintsAutomatic(false)
        setupSubviews()
        setupConstraints()
        fetchGameVersionIfSummonerSelected()
        setupCancelButton()
    }
    
    private func setupConstraintsAutomatic(_ bool: Bool) {
        translatesAutoresizingMaskIntoConstraints = bool
    }
    
    private func setupSubviews() {
        [iconImageView, levelLabel, summonerIDLabel, tierStackView, cancelButton]
            .forEach { addSubview($0) }
        [tierLabel, tierIconImageView, separatorView, tierPointLabel]
            .forEach { tierStackView.addArrangedSubview($0) }
    }
    
    private func setupConstraints() {
        setupIconImageViewConstraints()
        setupLevelLabelConstraints()
        setupSummonerIDLabelConstraints()
        setupTierStackViewConstraints()
        setupCancelButtonConstraints()
    }
    
    private func setupIconImageViewConstraints() {
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            iconImageView.heightAnchor.constraint(
                equalTo: tierLabel.heightAnchor,
                multiplier: 4
            ),
            iconImageView.widthAnchor.constraint(equalTo: iconImageView.heightAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func setupLevelLabelConstraints() {
        NSLayoutConstraint.activate([
            levelLabel.centerYAnchor.constraint(
                equalTo: iconImageView.bottomAnchor,
                constant: -4
            ),
            levelLabel.centerXAnchor.constraint(equalTo: iconImageView.centerXAnchor)
        ])
    }
    
    private func setupSummonerIDLabelConstraints() {
        NSLayoutConstraint.activate([
            summonerIDLabel.leadingAnchor.constraint(
                equalTo: iconImageView.trailingAnchor,
                constant: 8
            ),
            summonerIDLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -8)
        ])
    }
    
    private func setupTierStackViewConstraints() {
        NSLayoutConstraint.activate([
            tierStackView.leadingAnchor.constraint(
                equalTo: iconImageView.trailingAnchor,
                constant: 8
            ),
            tierStackView.topAnchor.constraint(
                equalTo: summonerIDLabel.bottomAnchor,
                constant: 4
            )
        ])
    }
    
    private func setupCancelButtonConstraints() {
        NSLayoutConstraint.activate([
            cancelButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            cancelButton.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func fetchGameVersionIfSummonerSelected() {
        guard UserDefaults.standard.object(
            forKey: Design.userDefaultsKey
        ) is Data else {
            return
        }
        
        dataDragonVersionViewModel.input.fetchGameVersion()
    }
    
    private func fetchProfileIconImage(with versionID: String) {
        dataDragonProfileIconViewModel.input.fetchProfileIconImage(versionID)
    }
    
    private func fetchChampionIconImage(with versionID: String) {
        championIconFetcher?.fetchChampionInformation(with: versionID)
    }
    
    private func showErrorAlert(from alert: UIAlertController) {
        summonerDescriptionViewDelegate?.showAlert(from: alert)
    }
    
    private func setupContents(with summoner: Summoner) {
        levelLabel.text = String(" \(summoner.summonerLevel) ")
        summonerIDLabel.text = summoner.name
    }
    
    /// viewModel에서 필터링해서 가져오기
    /// 추후 함수 적용 필요
    private func setupContents(with summonerSoloRank: SummonerRank) {
        tierLabel.text = "\(summonerSoloRank.tier) \(summonerSoloRank.rank)"
        // summonerRank 이미지화
        
        tierIconImageView.image = UIImage(
            named: summonerSoloRank.tier.firstLetterUppercased()
        )?.resize(width: tierStackView.frame.size.height)
        
        tierPointLabel.text = "\(summonerSoloRank.leaguePoints) LP"
    }
    
    private func setupContents(with profileIcon: UIImage) {
        iconImageView.image = profileIcon.resize(width: iconImageView.frame.size.width)
        
        /// queueType enum으로 만들기
        /// 비동기가 늦어지면 해당 정보를 네트워킹 하기전에 가져오는 것인가
        guard let unarchivedSummonerRankData = UserDefaults.standard.object(
            forKey: "MySummonerRankInformation"
        ) as? Data,
              let summonerRankArray = try? JSONDecoder().decode(
                [SummonerRank].self,
                from: unarchivedSummonerRankData
              ),
              let summonerSoloRank = summonerRankArray.filter(
                { $0.queueType == "RANKED_SOLO_5x5" }
              ).first else {
            return
        }
        
        tierLabel.text = "\(summonerSoloRank.tier) \(summonerSoloRank.rank)"
        // summonerRank 이미지화
        
        tierIconImageView.image = UIImage(
            named: summonerSoloRank.tier.firstLetterUppercased()
        )?.resize(width: tierStackView.frame.size.height)
        
        tierPointLabel.text = "\(summonerSoloRank.leaguePoints) LP"
    }
    
    private func setupCancelButton() {
        cancelButton.addTarget(
            self,
            action: #selector(cancelButtonDidTap),
            for: .touchUpInside
        )
    }
    
    @objc private func cancelButtonDidTap() {
        summonerDescriptionViewDelegate?.cancelButtonDidTap()
    }
}

// MARK: - Namespace

private enum Design {
    static let tierLabelText = "Unranked"
    static let cancelButtonImage = UIImage(systemName:"xmark")
    static let userDefaultsKey = "MySummonerInformation"
}
