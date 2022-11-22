//
//  FavoriteChampionCell.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/24.
//

import UIKit

final class FavoriteChampionCell: UITableViewCell {
    
    // MARK:  Properties
    
    private let titleLabel = LabelBuilder()
        .setupMainCellTitleLabel(text: Design.titleLabelText)
        .build()
    
    private let descriptionLabel = LabelBuilder()
        .setupMainCellDescriptionLabel(text: Design.descriptionLabelText)
        .build()
    
    private let summonerSearchButton = ButtonBuilder()
        .setupMainCellButton(text: Design.summonerSearchButtonTitle)
        .build()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    // MARK: - Methods
    
    private func commonInit() {
        setupContentViewUserInteractionEnabled(false)
        setupSubviews()
        setupConstraints()
        setupBackgroundColor(Design.cellBackgroundColor)
        setupSelectionStyle(.none)
    }
    
    private func setupContentViewUserInteractionEnabled(_ bool: Bool) {
            contentView.isUserInteractionEnabled = bool
        }
    
    private func setupSubviews() {
        [titleLabel, descriptionLabel, summonerSearchButton]
            .forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        setupTitleLabelConstraints()
        setupDescriptionLabelConstraints()
        setupSummonerSearchButtonConstraints()
    }
    
    private func setupTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.bottomAnchor.constraint(
                equalTo: descriptionLabel.topAnchor,
                constant: -20
            ),
            titleLabel.heightAnchor.constraint(equalToConstant: 100),
            titleLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -50)
        ])
    }
    
    private func setupDescriptionLabelConstraints() {
        NSLayoutConstraint.activate([
            descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -140),
            descriptionLabel.bottomAnchor.constraint(
                equalTo: summonerSearchButton.topAnchor,
                constant: -20
            ),
            descriptionLabel.heightAnchor.constraint(
                equalTo: summonerSearchButton.heightAnchor,
                multiplier: 2
            )
        ])
    }
    
    private func setupSummonerSearchButtonConstraints() {
        NSLayoutConstraint.activate([
            summonerSearchButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            summonerSearchButton.widthAnchor.constraint(
                equalTo: widthAnchor,
                constant: -40
            ),
            summonerSearchButton.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -20
            )
        ])
    }
    
    private func setupBackgroundColor(_ color: UIColor?) {
        backgroundColor = color
    }
    
    private func setupSelectionStyle(_ style: UITableViewCell.SelectionStyle) {
        selectionStyle = style
    }
}

// MARK: - Namespace

private enum Design {
    static let titleLabelText = "즐겨찾기한 챔피언"
    static let descriptionLabelText = "⭐️ 즐겨찾기한 챔피언이 없습니다.\n즐겨찾는 챔피언을 등록해주세요!"
    static let summonerSearchButtonTitle = "챔피언 살펴보기"
    static let cellBackgroundColor = UIColor(named: "PrimitiveColor")
}
