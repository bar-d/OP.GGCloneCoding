//
//  OtherGamesCell.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/24.
//

import UIKit

final class OtherGamesCell: UITableViewCell {

    // MARK: Properties

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Design.titleLabelText
        label.font = .preferredFont(forTextStyle: .title3)
        label.textColor = .label

        return label
    }()

    private let anotherGamesScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        return scrollView
    }()

    private let anotherGamesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.spacing = 10

        return stackView
    }()

    private let valorantImageView = ImageViewBuilder()
        .setupAnotherGameImageView(image: Design.valorantImage)
        .build()

    private let battlegroundsImageView = ImageViewBuilder()
        .setupAnotherGameImageView(image: Design.battleGroundsImage)
        .build()

    private let eternalReturnImageView = ImageViewBuilder()
        .setupAnotherGameImageView(image: Design.eternalReturnImage)
        .build()

    private let overwatchImageView = ImageViewBuilder()
        .setupAnotherGameImageView(image: Design.overWatchImage)
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
        setupSubviews()
        setupConstraints()
        setupContentInset(top: 0, left: 20, bottom: 0, right: 20)
        setupContentViewUserInteractionEnabled(false)
        setupSelectionStyle(.none)
    }

    private func setupSubviews() {
        [titleLabel, anotherGamesScrollView]
            .forEach { addSubview($0) }
        [anotherGamesStackView]
            .forEach { anotherGamesScrollView.addSubview($0) }
        [valorantImageView, battlegroundsImageView, eternalReturnImageView, overwatchImageView]
            .forEach { anotherGamesStackView.addArrangedSubview($0) }
    }

    private func setupConstraints() {
        setupFirstPatchNoteImageViewConstraints()
        setupTitleLabelConstraints()
        setupPatchNoteScrollViewConstraints()
        setupPatchNoteStackViewConstraints()
    }

    private func setupFirstPatchNoteImageViewConstraints() {
        [valorantImageView, battlegroundsImageView, eternalReturnImageView, overwatchImageView]
            .forEach {
                $0.heightAnchor.constraint(equalTo: titleLabel.heightAnchor, multiplier: 7).isActive = true
                $0.widthAnchor.constraint(equalTo: $0.heightAnchor, multiplier: 3/2).isActive = true
            }
    }

    private func setupTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 20)

        ])
    }

    private func setupPatchNoteScrollViewConstraints() {
        NSLayoutConstraint.activate([
            anotherGamesScrollView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            anotherGamesScrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            anotherGamesScrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            anotherGamesScrollView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    private func setupPatchNoteStackViewConstraints() {
        NSLayoutConstraint.activate([
            anotherGamesStackView.topAnchor.constraint(equalTo: anotherGamesScrollView.topAnchor),
            anotherGamesStackView.bottomAnchor.constraint(equalTo: anotherGamesScrollView.bottomAnchor, constant: -20),
            anotherGamesStackView.leadingAnchor.constraint(equalTo: anotherGamesScrollView.leadingAnchor),
            anotherGamesStackView.trailingAnchor.constraint(equalTo: anotherGamesScrollView.trailingAnchor),
            anotherGamesStackView.heightAnchor.constraint(equalTo: anotherGamesScrollView.heightAnchor, constant: -20)
        ])
    }

    private func setupContentInset(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) {
        anotherGamesScrollView.contentInset = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }

    private func setupContentViewUserInteractionEnabled(_ bool: Bool) {
        contentView.isUserInteractionEnabled = bool
    }

    private func setupSelectionStyle(_ style: UITableViewCell.SelectionStyle) {
        selectionStyle = style
    }
}

// MARK: - Namespace

private enum Design {
    static let titleLabelText = "다른 게임 전적 보기"
    static let valorantImage = UIImage(named: "ValorantImage")
    static let battleGroundsImage = UIImage(named: "BattleGroundsImage")
    static let eternalReturnImage = UIImage(named: "EternalReturnImage")
    static let overWatchImage = UIImage(named: "OverWatchImage")
}
