//
//  MainSkinOnSaleView.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/24.
//

import UIKit

final class MainSkinOnSaleView: UIView {

    // MARK: Properties

    private let imageView = ImageViewBuilder()
        .setupConstraintsAutomatic(false)
        .setupImage(image: Design.logoImage)
        .build()

    private let typeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemOrange
        label.font = .preferredFont(forTextStyle: .caption2)

        return label
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .caption2)

        return label
    }()

    private let deadLineLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        label.font = .preferredFont(forTextStyle: .caption2)

        return label
    }()

    private let originalPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        label.font = .preferredFont(forTextStyle: .caption1)

        return label
    }()

    private let discountRateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .caption1)
        label.backgroundColor = .red
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.textAlignment = .center

        return label
    }()

    private let discountedPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .title3)

        return label
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
        setupBackgroundColor()
    }

    private func setupConstraintsAutomatic(_ bool: Bool) {
        translatesAutoresizingMaskIntoConstraints = bool
    }

    private func setupSubviews() {
        [imageView, typeLabel, nameLabel, deadLineLabel, originalPriceLabel, discountRateLabel, discountedPriceLabel]
            .forEach { addSubview($0) }
    }

    private func setupConstraints() {
        setupImageViewConstraints()
        setupTypeLabelConstraints()
        setupNameLabelConstraints()
        setupDeadLineLabelConstraints()
        setupOriginalPriceLabelConstraints()
        setupDiscountRateLabelConstraints()
        setupDiscountedPriceLabelConstraints()
    }

    private func setupImageViewConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    private func setupTypeLabelConstraints() {
        NSLayoutConstraint.activate([
            typeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            typeLabel.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -2)
        ])
    }

    private func setupNameLabelConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            nameLabel.bottomAnchor.constraint(equalTo: deadLineLabel.topAnchor, constant: -2)
        ])
    }

    private func setupDeadLineLabelConstraints() {
        NSLayoutConstraint.activate([
            deadLineLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            deadLineLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }

    private func setupOriginalPriceLabelConstraints() {
        NSLayoutConstraint.activate([
            originalPriceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            originalPriceLabel.bottomAnchor.constraint(equalTo: discountedPriceLabel.topAnchor)
        ])
    }

    private func setupDiscountRateLabelConstraints() {
        NSLayoutConstraint.activate([
            discountRateLabel.trailingAnchor.constraint(equalTo: discountedPriceLabel.leadingAnchor, constant: -10),
            discountRateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            discountRateLabel.heightAnchor.constraint(equalTo: discountedPriceLabel.heightAnchor, multiplier: 0.8),
            discountRateLabel.widthAnchor.constraint(equalTo: discountRateLabel.heightAnchor, multiplier: 1.6)
        ])
    }

    private func setupDiscountedPriceLabelConstraints() {
        NSLayoutConstraint.activate([
            discountedPriceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            discountedPriceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
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

    private func setupBackgroundColor() {
        discountRateLabel.backgroundColor = Design.discountRateBackgroundColor
    }
}

// MARK: - Namespace

private enum Design {
    static let logoImage = UIImage(named: "OP.GGLaunchLogo")
    static let typeLabel = "Skin"
    static let nameLabel = "중간보스 브랜드"
    static let deadLineLabel = "~10.24"
    static let originalPriceLabel = "1350RP".strikeThrough(value: NSUnderlineStyle.single.rawValue)
    static let discountRateLabel = "60%"
    static let discountedPriceLabel = "540RP"
    static let discountRateBackgroundColor = UIColor(named: "LoseColor")
}

