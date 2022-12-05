//
//  UnselectedSummonerView.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/09.
//

import UIKit

final class UnselectedSummonerView: UIView {
    
    // MARK: Properties
    
    private weak var emptySummonerViewDelegate: UnselectedSummonerViewDelegate?
    
    private let emptySummonerView = EmptySummonerView()
    
    private let descriptionLabel = LabelBuilder()
        .setupMainCellDescriptionLabel(text: Design.descriptionLabelText)
        .build()
    
    private let summonerRegisterButton = ButtonBuilder()
        .setupMainCellButton(text: Design.summonerRegisterButtonTitle)
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

    override func layoutSubviews() {
        super.layoutSubviews()

        emptySummonerView.addDashedBorder(cornerRadius: 10)
    }
    
    // MARK: - Methods
    
    func setupUnselectedSummonerViewDelegate(_ delegate: UnselectedSummonerViewDelegate) {
        emptySummonerViewDelegate = delegate
    }
    
    private func commonInit() {
        setupConstraintsAutomatic(false)
        setupSubviews()
        setupConstraints()
        setupBackgroundColor(Design.cellBackgroundColor)
        setupRegisterButton()
    }
    
    private func setupConstraintsAutomatic(_ bool: Bool) {
        translatesAutoresizingMaskIntoConstraints = bool
    }

    private func setupSubviews() {
        [emptySummonerView, descriptionLabel, summonerRegisterButton]
            .forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        setupEmptySummonerViewConstraints()
        setupDescriptionLabelConstraints()
        setupSummonerRegisterButtonConstraints()
    }
    
    private func setupEmptySummonerViewConstraints() {
        NSLayoutConstraint.activate([
            emptySummonerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            emptySummonerView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            emptySummonerView.bottomAnchor.constraint(
                equalTo: descriptionLabel.topAnchor,
                constant: -20
            ),
            emptySummonerView.heightAnchor.constraint(equalToConstant: 100),
            emptySummonerView.widthAnchor.constraint(equalTo: widthAnchor, constant: -50)
        ])
    }
    
    private func setupDescriptionLabelConstraints() {
        NSLayoutConstraint.activate([
            descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -140),
            descriptionLabel.bottomAnchor.constraint(
                equalTo: summonerRegisterButton.topAnchor,
                constant: -20
            ),
            descriptionLabel.heightAnchor.constraint(
                equalTo: summonerRegisterButton.heightAnchor,
                multiplier: 2
            )
        ])
    }
    
    private func setupSummonerRegisterButtonConstraints() {
        NSLayoutConstraint.activate([
            summonerRegisterButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            summonerRegisterButton.widthAnchor.constraint(
                equalTo: widthAnchor,
                constant: -40
            ),
            summonerRegisterButton.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -20
            )
        ])
    }
    
    private func setupBackgroundColor(_ color: UIColor?) {
        backgroundColor = color
    }
    
    private func setupRegisterButton() {
        summonerRegisterButton.addTarget(
            self,
            action: #selector(searchButtonDidTap),
            for: .touchUpInside
        )
    }
    
    @objc private func searchButtonDidTap() {
        emptySummonerViewDelegate?.searchButtonDidTap()
    }
}

// MARK: - Namespace

private enum Design {
    static let descriptionLabelText = "소환사를 검색해서 등록해주세요!\n나의 전적을 분석해 도움을 줍니다."
    static let summonerRegisterButtonTitle = "소환사 등록하기"
    static let cellBackgroundColor = UIColor(named: "PrimitiveColor")
}
