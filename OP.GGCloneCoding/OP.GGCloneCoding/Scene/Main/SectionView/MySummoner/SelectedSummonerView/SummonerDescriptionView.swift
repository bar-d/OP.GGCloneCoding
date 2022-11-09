//
//  SummonerDescriptionView.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/09.
//

import UIKit

final class SummonerDescriptionView: UIView {
    
    // MARK: Properties
    
    private let iconImageView = ImageViewBuilder()
        .setupConstraintsAutomatic(false)
        .setupImage(image: UIImage(named: "OP.GGIcon"))
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
        .setupLabelText(text: "GOLD 2")
        .setupLabelTextAttributes(font: .footnote)
        .build()
    
    private let tierIconImageView = ImageViewBuilder()
        .setupConstraintsAutomatic(false)
        .setupImage(image: UIImage(named: "OP.GGIcon"))
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
        .setupImage(image: UIImage(systemName: "xmark"), scale: .large)
        .setupColor(tint: .label)
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
            iconImageView.heightAnchor.constraint(equalTo: tierLabel.heightAnchor, multiplier: 4),
            iconImageView.widthAnchor.constraint(equalTo: iconImageView.heightAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func setupLevelLabelConstraints() {
        NSLayoutConstraint.activate([
            levelLabel.centerYAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: -4),
            levelLabel.centerXAnchor.constraint(equalTo: iconImageView.centerXAnchor)
        ])
    }
    
    private func setupSummonerIDLabelConstraints() {
        NSLayoutConstraint.activate([
            summonerIDLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
            summonerIDLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -8)
        ])
    }
    
    private func setupTierStackViewConstraints() {
        NSLayoutConstraint.activate([
            tierStackView.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
            tierStackView.topAnchor.constraint(equalTo: summonerIDLabel.bottomAnchor, constant: 4)
        ])
    }
    
    private func setupCancelButtonConstraints() {
        NSLayoutConstraint.activate([
            cancelButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            cancelButton.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
