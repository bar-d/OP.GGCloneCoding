//
//  MoreInformationCell.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/26.
//

import UIKit

final class MoreInformationCell: UITableViewCell {

    // MARK: Properties

    private let titleLabel = LabelBuilder()
        .setupMainCellTitleLabel(text: Design.titleLabelText, color: .label)
        .build()

    private let rankingButton = MoreInformationButton(with: .ranking)
    private let proMatchesButton = MoreInformationButton(with: .proMatches)

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
        [titleLabel, rankingButton, proMatchesButton]
            .forEach { addSubview($0) }
    }

    private func setupConstraints() {
        setupTitleLabelConstraints()
        setupRankingButtonConstraints()
        setupProMatchesButtonConstraints()
        setupSelectionStyle(.none)
    }

    private func setupTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }

    private func setupRankingButtonConstraints() {
        NSLayoutConstraint.activate([
            rankingButton.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: 8
            ),
            rankingButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            rankingButton.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            rankingButton.heightAnchor.constraint(equalTo: proMatchesButton.heightAnchor)
        ])
    }

    private func setupProMatchesButtonConstraints() {
        NSLayoutConstraint.activate([
            proMatchesButton.topAnchor.constraint(
                equalTo: rankingButton.bottomAnchor,
                constant: 8
            ),
            proMatchesButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            proMatchesButton.trailingAnchor.constraint(
                equalTo: titleLabel.trailingAnchor
            ),
            proMatchesButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50)
        ])
    }

    private func setupSelectionStyle(_ style: UITableViewCell.SelectionStyle) {
        selectionStyle = style
    }
}

// MARK: - Namespace

private enum Design {
    static let titleLabelText = "더 많은 정보 구경하기"
}
