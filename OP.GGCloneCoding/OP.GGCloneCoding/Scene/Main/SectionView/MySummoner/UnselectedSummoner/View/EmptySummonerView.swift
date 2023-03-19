//
//  EmptySummonerView.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/24.
//

import UIKit

final class EmptySummonerView: UIView {

    // MARK: Properties

    private let imageView = ImageViewBuilder()
        .setupEmptySummonerImageView()
        .build()

    private let descriptionLabel = LabelBuilder()
        .setupEmptySummonerDescriptionLabel()
        .build()

    private let questionMarkLabel = LabelBuilder()
        .setupQuestionMarkLabel()
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
        setupBackgroundColor()
    }

    private func setupConstraintsAutomatic(_ bool: Bool) {
        translatesAutoresizingMaskIntoConstraints = bool
    }

    private func setupSubviews() {
        [imageView, descriptionLabel, questionMarkLabel]
            .forEach { addSubview($0) }
    }

    private func setupConstraints() {
        setupImageViewConstraints()
        setupDescriptionLabelConstraints()
        setupQuestionMarkLabelConstraints()
    }

    private func setupImageViewConstraints() {
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
    }

    private func setupDescriptionLabelConstraints() {
        NSLayoutConstraint.activate([
            descriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            descriptionLabel.leadingAnchor.constraint(
                equalTo: imageView.trailingAnchor, constant: 15
            ),
            descriptionLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -20
            )
        ])
    }

    private func setupQuestionMarkLabelConstraints() {
        NSLayoutConstraint.activate([
            questionMarkLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            questionMarkLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor)
        ])
    }

    private func setupBackgroundColor() {
        backgroundColor = Design.backgroundColor
    }
}

// MARK: - Namespace

private enum Design {
    static let backgroundColor = UIColor(named: "SecondaryColor")
}
