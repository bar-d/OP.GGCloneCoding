//
//  TierView.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/09.
//

import UIKit

final class TierView: UIView {
    
    // MARK: Properties
    
    private let tierIconImageView = ImageViewBuilder()
        .setupConstraintsAutomatic(false)
        .setupImage(image: Design.tierIconImageViewImage)
        .build()
    
    private let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .leading
        
        return stackView
    }()
    
    private let queueTypeLabel = LabelBuilder()
        .setupConstraintsAutomatic(false)
        .setupLabelText(text: " 개인/2인 랭크 ", color: Design.queueTypeLabelColor)
        .setupLayer(cornerRadius: 4)
        .setupLayerBackgroundColor(Design.queueTypeLabelBackgroundColor)
        .build()
    
    private let tierLabel = LabelBuilder()
        .setupConstraintsAutomatic(false)
        .setupLabelText(text: "Gold 2", color: .label)
        .build()
    
    private let pointLabel = LabelBuilder()
        .setupConstraintsAutomatic(false)
        .setupLabelText(text: "22 LP", color: .lightGray)
        .build()
    
    private let winRateLabel = LabelBuilder()
        .setupConstraintsAutomatic(false)
        .setupLabelText(text: "25승 32패 (40%)", color: .lightGray)
        .build()
    
    private let indicatorButton = ButtonBuilder()
        .setupConstraintsAutomatic(false)
        .setupImage(image: Design.indicatorButtonImage)
        .setupColor(tint: .lightGray)
        .build()
    
    // MARK: - Initilaizers
    
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
        [queueTypeLabel, tierLabel, pointLabel, winRateLabel]
            .forEach { labelStackView.addArrangedSubview($0) }
        [tierIconImageView, labelStackView, indicatorButton]
            .forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        setupTierIconImageViewConstraints()
        setupLabelStackViewConstraints()
        setupIndicatorButtonConstraints()
    }
    
    private func setupTierIconImageViewConstraints() {
        NSLayoutConstraint.activate([
            tierIconImageView.heightAnchor.constraint(
                equalTo: heightAnchor, multiplier: 1/2
            ),
            tierIconImageView.widthAnchor.constraint(
                equalTo: tierIconImageView.heightAnchor
            ),
            tierIconImageView.leadingAnchor.constraint(
                equalTo: leadingAnchor, constant: 20
            ),
            tierIconImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func setupLabelStackViewConstraints() {
        NSLayoutConstraint.activate([
            labelStackView.leadingAnchor.constraint(
                equalTo: tierIconImageView.trailingAnchor, constant: 20
            ),
            labelStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            labelStackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/2)
        ])
    }
    
    private func setupIndicatorButtonConstraints() {
        NSLayoutConstraint.activate([
            indicatorButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            indicatorButton.trailingAnchor.constraint(
                equalTo: trailingAnchor, constant: -20
            )
        ])
    }
}

// MARK: - Namespace

private enum Design {
    static let tierIconImageViewImage = UIImage(named: "OP.GGIcon")
    static let queueTypeLabelColor = UIColor(named: "LoadingView")
    static let queueTypeLabelBackgroundColor = UIColor(named: "ButtonFontColor")
    static let indicatorButtonImage = UIImage(systemName: "chevron.right")
}
