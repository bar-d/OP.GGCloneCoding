//
//  FavoriteSummonersCell.swift
//  OP.GGCloneCoding
//
//  Created by λ°λ, μκΏ on 2022/10/24.
//

import UIKit

final class FavoriteSummonersCell: UITableViewCell {
    
    // MARK:  Properties
    
    weak var favoriteSummonersCellDelegate: FavoriteSummonersCellDelegate?
    
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
    
    func setupFavoriteSummonersCellDelegate(_ delegate: FavoriteSummonersCellDelegate) {
        favoriteSummonersCellDelegate = delegate
    }
    
    private func commonInit() {
        setupContentViewUserInteractionEnabled(false)
        setupSubviews()
        setupConstraints()
        setupBackgroundColor(Design.cellBackgroundColor)
        setupSelectionStyle(.none)
        setupSummonerSearchButton()
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
        setupDescriptioinLabel()
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
    
    private func setupDescriptioinLabel() {
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
    
    private func setupSummonerSearchButton() {
        summonerSearchButton.addTarget(
            self,
            action: #selector(summonerSearchButtonDidTap),
            for: .touchUpInside
        )
    }
    
    @objc private func summonerSearchButtonDidTap() {
        favoriteSummonersCellDelegate?.summonerSearchButtonDidTap()
    }
}

// MARK: - Namespace

private enum Design {
    static let titleLabelText = "μ¦κ²¨μ°ΎκΈ°ν μνμ¬"
    static let descriptionLabelText = "β­οΈ μ¦κ²¨μ°ΎκΈ°ν μνμ¬κ° μμ΅λλ€.\nμνμ¬λ₯Ό κ²μν ν λ±λ‘ν΄μ£ΌμΈμ!"
    static let descriptionLabelTextColor = UIColor(named: "IconColor")
    static let summonerSearchButtonTitle = "μνμ¬ κ²μνκΈ°"
    static let cellBackgroundColor = UIColor(named: "PrimitiveColor")
}
