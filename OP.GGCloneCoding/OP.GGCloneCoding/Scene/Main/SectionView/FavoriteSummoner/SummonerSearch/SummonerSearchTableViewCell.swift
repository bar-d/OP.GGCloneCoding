//
//  SummonerSearchTableViewCell.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/01.
//

import UIKit

final class SummonerSearchTableViewCell: UITableViewCell {
    
    // MARK: Properties
   
    private let iconImageView = ImageViewBuilder()
        .setupConstraintsAutomatic(false)
        .setupImage(image: Design.OPGGiconImage)
        .setupLayer(cornerRadius: 16)
        .setupContentMode(.scaleAspectFit)
        .build()
    
    private let summonerIDLabel = LabelBuilder()
        .setupConstraintsAutomatic(false)
        .setupLabelText(color: .label)
        .setupLabelTextAttributes(alignment: .left)
        .setupPriority(hugging: .defaultHigh, axis: .vertical)
        .build()
    
    private let tierImageView = ImageViewBuilder()
        .setupConstraintsAutomatic(false)
        .setupContentMode(.scaleAspectFit)
        .build()
    
    private let tierLabel = LabelBuilder()
        .setupConstraintsAutomatic(false)
        .setupLabelTextAttributes(alignment: .left, font: .footnote)
        .build()
    
    private let starButton = ButtonBuilder()
        .setupConstraintsAutomatic(false)
        .setupImage(image: Design.starIconImage, scale: .large)
        .setupColor(tint: .lightGray)
        .build()
    
    private let cancelButton = ButtonBuilder()
        .setupConstraintsAutomatic(false)
        .setupImage(image: Design.cancelButtonImage, scale: .large)
        .setupColor(tint: .lightGray)
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
    }
    
    private func setupContentViewUserInteractionEnabled(_ bool: Bool) {
        contentView.isUserInteractionEnabled = bool
    }
    
    private func setupSubviews() {
        [iconImageView, summonerIDLabel, tierImageView,
         tierLabel, starButton, cancelButton]
            .forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        setupIconImageViewConstraints()
        setupSummonerIDLabelConstraints()
        setupTierImageViewConstraints()
        setupTierLabelConstraints()
        setupStarButtonConstraints()
        setupCancelButtonConstraints()
        setupSummonerIDLabelText("소환사 아이디")
        setupTierImage(UIImage(named: "OP.GGIcon"))
        setupTierLabelText("Unranked")
    }
    
    private func setupIconImageViewConstraints() {
        NSLayoutConstraint.activate([
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            iconImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/2),
            iconImageView.widthAnchor.constraint(equalTo: iconImageView.heightAnchor)
        ])
    }
    
    private func setupSummonerIDLabelConstraints() {
        NSLayoutConstraint.activate([
            summonerIDLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -10),
            summonerIDLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
            
        ])
    }
    
    private func setupTierImageViewConstraints() {
        NSLayoutConstraint.activate([
            tierImageView.topAnchor.constraint(equalTo: summonerIDLabel.bottomAnchor, constant: 4),
            tierImageView.leadingAnchor.constraint(equalTo: summonerIDLabel.leadingAnchor),
            tierImageView.heightAnchor.constraint(equalTo: tierLabel.heightAnchor),
            tierImageView.widthAnchor.constraint(equalTo: tierImageView.heightAnchor)
        ])
    }
    
    private func setupTierLabelConstraints() {
        NSLayoutConstraint.activate([
            tierLabel.topAnchor.constraint(equalTo: tierImageView.topAnchor),
            tierLabel.leadingAnchor.constraint(equalTo: tierImageView.trailingAnchor, constant: 4),
            tierLabel.bottomAnchor.constraint(equalTo: tierImageView.bottomAnchor)
        ])
    }
    
    private func setupStarButtonConstraints() {
        NSLayoutConstraint.activate([
            starButton.centerYAnchor.constraint(equalTo: cancelButton.centerYAnchor),
            starButton.trailingAnchor.constraint(equalTo: cancelButton.leadingAnchor, constant: -8),
            starButton.heightAnchor.constraint(equalTo: cancelButton.heightAnchor),
            starButton.widthAnchor.constraint(equalTo: cancelButton.widthAnchor)
        ])
    }
    
    private func setupCancelButtonConstraints() {
        NSLayoutConstraint.activate([
            cancelButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            cancelButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/3),
            cancelButton.widthAnchor.constraint(equalTo: cancelButton.heightAnchor),
            cancelButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    private func setupSummonerIDLabelText(_ text: String) {
        summonerIDLabel.text = text
    }
    
    private func setupTierImage(_ image: UIImage?) {
        tierImageView.image = image
    }
    
    private func setupTierLabelText(_ text: String) {
        tierLabel.text = text
    }
}

// MARK: - Namespace

private enum Design {
    static let OPGGiconImage = UIImage(named: "OP.GGIcon")
    static let starIconImage = UIImage(systemName: "star")
    static let cancelButtonImage = UIImage(systemName: "xmark")
}
