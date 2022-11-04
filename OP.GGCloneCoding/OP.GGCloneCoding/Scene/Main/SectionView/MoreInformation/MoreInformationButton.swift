//
//  MoreInformationButton.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/26.
//

import UIKit

final class MoreInformationButton: UIButton {

    // MARK: Enumeration

    enum MoreInformationSection {
        case ranking
        case proMatches
    }

    // MARK: - Properties

    private let section: MoreInformationSection

    private let iconImageView = ImageViewBuilder()
        .setupConstraintsAutomatic(false)
        .build()

    private let buttonTitleLabel = LabelBuilder()
        .setupButtonTitleLabel()
        .build()

    private let indicatorImageView = ImageViewBuilder()
        .setupIndicatorImageView(tintColor: Design.indicatorTintColor)
        .build()

    // MARK: - Initializers

    init(with section: MoreInformationSection) {
        self.section = section
        super.init(frame: .zero)

        commonInit()
    }

    required init?(coder: NSCoder) {
        section = .ranking
        super.init(coder: coder)

        commonInit()
    }

    // MARK: - Methods

    private func commonInit() {
        setupConstraintsAutomatic(false)
        setupSubviews()
        setupConstraints()
        setupIconImage(with: section)
        setupButtonTitle(with: section)
        setupLayerAttributes()
    }

    private func setupConstraintsAutomatic(_ bool: Bool) {
        translatesAutoresizingMaskIntoConstraints = bool
    }

    private func setupSubviews() {
        [iconImageView, buttonTitleLabel, indicatorImageView]
            .forEach { addSubview($0) }
    }

    private func setupConstraints() {
        setupIconImageViewConstraints()
        setupButtonTitleLabelConstraints()
        setupIndicatorImageViewConstraints()
    }

    private func setupIconImageViewConstraints() {
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            iconImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            iconImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/20),
            iconImageView.heightAnchor.constraint(equalTo: iconImageView.widthAnchor)
        ])
    }

    private func setupButtonTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            buttonTitleLabel.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor),
            buttonTitleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 12)
        ])
    }

    private func setupIndicatorImageViewConstraints() {
        NSLayoutConstraint.activate([
            indicatorImageView.topAnchor.constraint(equalTo: iconImageView.topAnchor),
            indicatorImageView.bottomAnchor.constraint(equalTo: iconImageView.bottomAnchor),
            indicatorImageView.leadingAnchor.constraint(equalTo: buttonTitleLabel.trailingAnchor, constant: 12),
            indicatorImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            indicatorImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/20)
        ])
    }

    private func setupIconImage(with section: MoreInformationSection) {
        switch section {
        case .ranking:
            iconImageView.image = Design.rankingImage

        case .proMatches:
            iconImageView.image = Design.proMatchesImage

        }
    }

    private func setupButtonTitle(with section: MoreInformationSection) {
        switch section {
        case .ranking:
            buttonTitleLabel.text = Design.rankingTitle
        case .proMatches:
            buttonTitleLabel.text = Design.proMatchesTitle
        }
    }

    private func setupLayerAttributes() {
        layer.cornerRadius = 5
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemGray4.cgColor
    }
}

// MARK: - Namespace

private enum Design {
    static let rankingTitle = "랭킹"
    static let proMatchesTitle = "프로 관전"
    static let indicatorTintColor = UIColor(named: "LanguageColor")
    static let indicatorImage = UIImage(systemName: "chevron.right")
    static let rankingImage = UIImage(named: "RankingIcon")?.withTintColor(.label)
    static let proMatchesImage = UIImage(named: "ProMatchesIcon")?.withTintColor(.label)
}
