//
//  RecentGameInformationView.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/10.
//

import UIKit

final class RecentGameInformationView: UIView {
    
    // MARK: Properties
    
    private let titleLabel = LabelBuilder()
        .setupConstraintsAutomatic(false)
        .setupLabelText(text: Design.titleLabelText)
        .setupLabelTextAttributes(numberOfLines: 2)
        .build()
    
    private let championImageView = ImageViewBuilder()
        .setupConstraintsAutomatic(false)
        .setupImage(image: Design.championImageViewImage)
        .setupLayer(cornerRadius: 20)
        .build()
    
    private let mostNumberLabel = LabelBuilder()
        .setupConstraintsAutomatic(false)
        .setupLabelText(text: Design.mostNumberLabelText)
        .setupLabelTextAttributes(font: .title3)
        .build()
    
    private let indicatorButton = ButtonBuilder()
        .setupConstraintsAutomatic(false)
        .setupImage(image: Design.indicatorButtonImage, scale: .large)
        .setupColor(tint: Design.indicatorButtonTintColor)
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
    
    private func commonInit() {
        setupConstraintsAutomatic(false)
        setupSubviews()
        setupConstraints()
        setupLayer()
    }
    
    private func setupConstraintsAutomatic(_ bool: Bool) {
        translatesAutoresizingMaskIntoConstraints = bool
    }
    
    private func setupSubviews() {
        [titleLabel, championImageView, mostNumberLabel, indicatorButton]
            .forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        setupRecentGameInformationViewConstraints()
        setupTitleLabelConstraints()
        setupChampionImageViewConstraints()
        setupMostNumberLabelConstraints()
        setupIndicatorButtonConstraints()
    }
    
    private func setupRecentGameInformationViewConstraints() {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalTo: heightAnchor, multiplier: 4/3)
        ])
    }
    
    private func setupTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8)
        ])
    }
    
    private func setupChampionImageViewConstraints() {
        NSLayoutConstraint.activate([
            championImageView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -8
            ),
            championImageView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 8
            ),
            championImageView.heightAnchor.constraint(
                equalTo: heightAnchor,
                multiplier: 1/3
            ),
            championImageView.widthAnchor.constraint(
                equalTo: championImageView.heightAnchor
            )
        ])
    }
    
    private func setupMostNumberLabelConstraints() {
        NSLayoutConstraint.activate([
            mostNumberLabel.centerYAnchor.constraint(
                equalTo: championImageView.centerYAnchor
            ),
            mostNumberLabel.leadingAnchor.constraint(
                equalTo: championImageView.trailingAnchor,
                constant: 8
            )
        ])
    }
    
    private func setupIndicatorButtonConstraints() {
        NSLayoutConstraint.activate([
            indicatorButton.centerYAnchor.constraint(
                equalTo: championImageView.centerYAnchor
            ),
            indicatorButton.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -8
            )
        ])
    }
    
    private func setupLayer() {
        layer.cornerRadius = 10
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 2
    }
}

// MARK: - Namespace

private enum Design {
    static let titleLabelText = "최근 20경기\n가장 많은 Kill"
    static let championImageViewImage = UIImage(named: "OP.GGIcon")
    static let mostNumberLabelText = "18"
    static let indicatorButtonImage = UIImage(systemName: "chevron.right")
    static let indicatorButtonTintColor = UIColor(named: "LanguageColor")
}
