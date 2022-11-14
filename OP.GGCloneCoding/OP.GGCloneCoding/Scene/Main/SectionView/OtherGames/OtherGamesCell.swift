//
//  OtherGamesCell.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/24.
//

import UIKit
import SafariServices

final class OtherGamesCell: UITableViewCell {

    // MARK: Properties

    private weak var otherGamesDelegate: OtherGamesDelegate?

    private let titleLabel = LabelBuilder()
        .setupMainCellTitleLabel(text: Design.titleLabelText)
        .build()

    private let otherGamesScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false

        return scrollView
    }()

    private let otherGamesStackView: UIStackView = {
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
        .setupAnotherGameImageView(image: Design.battlegroundsImage)
        .build()

    private let eternalReturnImageView = ImageViewBuilder()
        .setupAnotherGameImageView(image: Design.eternalReturnImage)
        .build()

    private let overwatchImageView = ImageViewBuilder()
        .setupAnotherGameImageView(image: Design.overwatchImage)
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

    func setupOtherGamesCellDelegate(_ delegate: OtherGamesDelegate) {
        otherGamesDelegate = delegate
    }

    private func commonInit() {
        setupContentViewUserInteractionEnabled(false)
        setupSubviews()
        setupConstraints()
        setupContentInset(top: 0, left: 20, bottom: 0, right: 20)
        setupSelectionStyle(.none)
        setupTapGestureRecognizer()
    }
    
    private func setupContentViewUserInteractionEnabled(_ bool: Bool) {
        contentView.isUserInteractionEnabled = bool
    }

    private func setupSubviews() {
        [titleLabel, otherGamesScrollView]
            .forEach { addSubview($0) }
        [otherGamesStackView]
            .forEach { otherGamesScrollView.addSubview($0) }
        [valorantImageView, battlegroundsImageView,
         eternalReturnImageView, overwatchImageView]
            .forEach { otherGamesStackView.addArrangedSubview($0) }
    }

    private func setupConstraints() {
        setupFirstPatchNoteImageViewConstraints()
        setupTitleLabelConstraints()
        setupPatchNoteScrollViewConstraints()
        setupPatchNoteStackViewConstraints()
    }

    private func setupFirstPatchNoteImageViewConstraints() {
        [valorantImageView, battlegroundsImageView,
         eternalReturnImageView, overwatchImageView]
            .forEach {
                $0.heightAnchor.constraint(
                    equalTo: titleLabel.heightAnchor,
                    multiplier: 7
                ).isActive = true
                $0.widthAnchor.constraint(
                    equalTo: $0.heightAnchor,
                    multiplier: 3/2
                ).isActive = true
            }
    }

    private func setupTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }

    private func setupPatchNoteScrollViewConstraints() {
        NSLayoutConstraint.activate([
            otherGamesScrollView.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: 4
            ),
            otherGamesScrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            otherGamesScrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            otherGamesScrollView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    private func setupPatchNoteStackViewConstraints() {
        NSLayoutConstraint.activate([
            otherGamesStackView.topAnchor.constraint(
                equalTo: otherGamesScrollView.topAnchor
            ),
            otherGamesStackView.bottomAnchor.constraint(
                equalTo: otherGamesScrollView.bottomAnchor,
                constant: -20
            ),
            otherGamesStackView.leadingAnchor.constraint(
                equalTo: otherGamesScrollView.leadingAnchor
            ),
            otherGamesStackView.trailingAnchor.constraint(
                equalTo: otherGamesScrollView.trailingAnchor
            ),
            otherGamesStackView.heightAnchor.constraint(
                equalTo: otherGamesScrollView.heightAnchor,
                constant: -20
            )
        ])
    }

    private func setupContentInset(
        top: CGFloat,
        left: CGFloat,
        bottom: CGFloat,
        right: CGFloat
    ) {
        otherGamesScrollView.contentInset = UIEdgeInsets(
            top: top,
            left: left,
            bottom: bottom,
            right: right
        )
    }

    private func setupSelectionStyle(_ style: UITableViewCell.SelectionStyle) {
        selectionStyle = style
    }

    private func setupTapGestureRecognizer() {
        [
            (valorantImageView, #selector(goToValorant)),
            (battlegroundsImageView, #selector(goToBattlegrounds)),
            (eternalReturnImageView, #selector(goToEternalReturn)),
            (overwatchImageView, #selector(goToOverwatch))
        ]
            .forEach { setupTapGestureRecognizer(in: $0.0, action: $0.1) }
    }

    private func setupTapGestureRecognizer(in imageView: UIImageView, action: Selector) {
        let tapGesture = UITapGestureRecognizer(target: self, action: action)
        imageView.addGestureRecognizer(tapGesture)
        imageView.isUserInteractionEnabled = true
    }

    @objc private func goToValorant() {
        otherGamesDelegate?.valorantImageDidTapped()
    }

    @objc private func goToBattlegrounds() {
        otherGamesDelegate?.battlegroundsImageDidTapped()
    }

    @objc private func goToEternalReturn() {
        otherGamesDelegate?.eternalReturnImageDidTapped()
    }

    @objc private func goToOverwatch() {
        otherGamesDelegate?.overwatchDidTapped()
    }
}

// MARK: - Namespace

private enum Design {
    static let titleLabelText = "다른 게임 전적 보기"
    static let valorantImage = UIImage(named: "ValorantImage")
    static let battlegroundsImage = UIImage(named: "BattlegroundsImage")
    static let eternalReturnImage = UIImage(named: "EternalReturnImage")
    static let overwatchImage = UIImage(named: "OverwatchImage")
}
