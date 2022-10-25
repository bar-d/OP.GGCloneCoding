//
//  MainTopView.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/17.
//

import UIKit

final class MainTopView: UIView {

    // MARK: Properties

    private let logoImageView = ImageViewBuilder()
        .setupLoadImageView()
        .build()

    private let languageButton = ButtonBuilder()
        .setupLanguageButton()
        .build()

    private let sortButton = ButtonBuilder()
        .setupSortButton()
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
        translatesAutoresizingMaskIntoConstraints = false
        setupSubviews()
        setupConstraints()
    }

    private func setupSubviews() {
        [logoImageView, languageButton, sortButton]
            .forEach { addSubview($0) }
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            logoImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            logoImageView.trailingAnchor.constraint(equalTo: languageButton.leadingAnchor, constant: -20),

            languageButton.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            languageButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            languageButton.trailingAnchor.constraint(equalTo: sortButton.leadingAnchor, constant: -20),

            sortButton.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            sortButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            sortButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
}

// MARK: - Namespace

private enum Design {
    static let logoImage = UIImage(named: "OP.GGMainLogo")
}
