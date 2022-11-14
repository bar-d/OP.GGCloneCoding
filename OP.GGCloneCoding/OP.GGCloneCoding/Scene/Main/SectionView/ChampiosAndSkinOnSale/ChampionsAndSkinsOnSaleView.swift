//
//  ChampionsAndSkinsOnSaleView.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/25.
//

import UIKit

final class ChampionsAndSkinsOnSaleView: UIView {
    
    // MARK: Properties
    
    private let imageView = ImageViewBuilder()
        .setupConstraintsAutomatic(false)
        .setupImage(image: Design.logoImage)
        .setupContentMode(.scaleToFill)
        .setupLayer(cornerRadius: 10)
        .build()
    
    private let typeLabel = LabelBuilder()
        .setupSkinOnSaleLabel(textColor: .systemOrange)
        .build()
    
    private let nameLabel = LabelBuilder()
        .setupSkinOnSaleLabel(textColor: .label)
        .build()
    
    private let deadLineLabel = LabelBuilder()
        .setupSkinOnSaleLabel(textColor: .systemGray)
        .build()
    
    private let originalPriceLabel = LabelBuilder()
        .setupSkinOnSaleLabel(textColor: .systemGray)
        .build()
    
    private let discountRateLabel = LabelBuilder()
        .setupSaleDiscountRateLabel()
        .build()
    
    private let discountedPriceLabel = LabelBuilder()
        .setupSkinOnSaleLabel(textColor: .white, font: .body)
        .setupPriority(compression: .defaultHigh, axis: .horizontal)
        .build()
    
    private let verticalSeparator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Design.verticalSeparatorColor
        
        return view
    }()
    
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
        setupLabel()
    }
    
    private func setupConstraintsAutomatic(_ bool: Bool) {
        translatesAutoresizingMaskIntoConstraints = bool
    }
    
    private func setupSubviews() {
        [imageView, typeLabel, nameLabel, discountRateLabel,
         discountedPriceLabel, originalPriceLabel, verticalSeparator, deadLineLabel]
            .forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        setupImageViewConstraints()
        setupTypeLabelConstraints()
        setupNameLabelConstraints()
        setupDiscountRateLabelConstraints()
        setupDiscountedPriceLabelConstraints()
        setupOriginalPriceLabelConstraints()
        setupVerticalSeparatorConstraints()
        setupDeadLineLabelConstraints()
    }
    
    private func setupImageViewConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6)
        ])
    }
    
    private func setupTypeLabelConstraints() {
        NSLayoutConstraint.activate([
            typeLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            typeLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            typeLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            typeLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.09)
        ])
    }
    
    private func setupNameLabelConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            nameLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.09)
        ])
    }
    
    private func setupDiscountRateLabelConstraints() {
        NSLayoutConstraint.activate([
            discountRateLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            discountRateLabel.widthAnchor.constraint(
                equalTo: discountedPriceLabel.widthAnchor,
                multiplier: 0.4
            ),
            discountRateLabel.centerYAnchor.constraint(
                equalTo: discountedPriceLabel.centerYAnchor
            )
        ])
    }
    
    private func setupDiscountedPriceLabelConstraints() {
        NSLayoutConstraint.activate([
            discountedPriceLabel.topAnchor.constraint(
                equalTo: discountRateLabel.topAnchor
            ),
            discountedPriceLabel.leadingAnchor.constraint(
                equalTo: discountRateLabel.trailingAnchor,
                constant: 3
            ),
            discountedPriceLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            discountedPriceLabel.bottomAnchor.constraint(
                equalTo: discountRateLabel.bottomAnchor
            )
        ])
    }
    
    private func setupOriginalPriceLabelConstraints() {
        NSLayoutConstraint.activate([
            originalPriceLabel.topAnchor.constraint(
                equalTo: discountRateLabel.bottomAnchor
            ),
            originalPriceLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            originalPriceLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            originalPriceLabel.widthAnchor.constraint(
                equalTo: deadLineLabel.widthAnchor,
                multiplier: 0.6
            ),
            originalPriceLabel.heightAnchor.constraint(
                equalTo: heightAnchor,
                multiplier: 0.09
            )
        ])
    }
    
    private func setupVerticalSeparatorConstraints() {
        NSLayoutConstraint.activate([
            verticalSeparator.topAnchor.constraint(equalTo: originalPriceLabel.topAnchor),
            verticalSeparator.leadingAnchor.constraint(
                equalTo: originalPriceLabel.trailingAnchor,
                constant: 3
            ),
            verticalSeparator.widthAnchor.constraint(equalToConstant: 1),
            verticalSeparator.bottomAnchor.constraint(
                equalTo: originalPriceLabel.bottomAnchor
            )
        ])
    }
    
    private func setupDeadLineLabelConstraints() {
        NSLayoutConstraint.activate([
            deadLineLabel.topAnchor.constraint(equalTo: originalPriceLabel.topAnchor),
            deadLineLabel.leadingAnchor.constraint(
                equalTo: verticalSeparator.trailingAnchor,
                constant: 3
            ),
            deadLineLabel.bottomAnchor.constraint(
                equalTo: originalPriceLabel.bottomAnchor
            )
        ])
    }
    
    private func setupLabel() {
        typeLabel.text = Design.typeLabel
        nameLabel.text = Design.nameLabel
        deadLineLabel.text = Design.deadLineLabel
        originalPriceLabel.attributedText = Design.originalPriceLabel
        discountRateLabel.text = Design.discountRateLabel
        discountedPriceLabel.text = Design.discountedPriceLabel
    }
}

// MARK: - Namespace

private enum Design {
    static let logoImage = UIImage(named: "OP.GGLaunchLogo")
    static let typeLabel = "Skin"
    static let nameLabel = "중간보스 브랜드"
    static let deadLineLabel = "~10.24"
    static let originalPriceLabel = "1350RP".strikeThrough(
        value: NSUnderlineStyle.single.rawValue
    )
    static let discountRateLabel = "60%"
    static let discountedPriceLabel = "540RP"
    static let verticalSeparatorColor = UIColor(named: "SecondaryColor")
}
