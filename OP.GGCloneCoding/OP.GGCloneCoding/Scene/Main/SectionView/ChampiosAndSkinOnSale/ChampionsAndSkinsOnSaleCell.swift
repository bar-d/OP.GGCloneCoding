//
//  ChampionsAndSkinsOnSaleCell.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/24.
//

import UIKit

final class ChampionsAndSkinsOnSaleCell: UITableViewCell {

    // MARK: Properties

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.font = .preferredFont(forTextStyle: .title3)
        label.numberOfLines = 2

        return label
    }()

    private let mainImageView = MainSkinOnSaleView()

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false

        return scrollView
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.spacing = 5

        return stackView
    }()

    private let firstSubImageView = ChampionsAndSkinsOnSaleView()
    private let secondSubImageView = ChampionsAndSkinsOnSaleView()
    private let thirdSubImageView = ChampionsAndSkinsOnSaleView()
    private let fourthSubImageView = ChampionsAndSkinsOnSaleView()
    private let fifthSubImageView = ChampionsAndSkinsOnSaleView()

    private let moreButton = ButtonBuilder()
        .setupMoreButton()
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

    private func setupTitleLabel() {
        titleLabel.text = Design.titlelabelText
    }

    private func commonInit() {
        setupSubviews()
        setupConstraints()
        setupUserInterationEnabled(false)
        setupSelectionStyle(.none)
        setupTitleLabel()
        setupContentInset(top: 0, left: 20, bottom: 0, right: 20)
    }

    private func setupSubviews() {
        [titleLabel, mainImageView, scrollView, moreButton]
            .forEach { addSubview($0) }
        [stackView]
            .forEach { scrollView.addSubview($0) }
        [firstSubImageView, secondSubImageView, thirdSubImageView, fourthSubImageView, fifthSubImageView]
            .forEach { stackView.addArrangedSubview($0) }
    }

    private func setupConstraints() {
        setupTitleLabelConstraints()
        setupMainImageViewConstraints()
        setupScrollViewConstraints()
        setupStackViewConstraints()
        setupSubImageViewConstraints()
        setupMoreButtonConstraints()
    }

    private func setupTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 1/3)
        ])
    }

    private func setupMainImageViewConstraints() {
        NSLayoutConstraint.activate([
            mainImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            mainImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            mainImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            mainImageView.heightAnchor.constraint(equalTo: titleLabel.widthAnchor, multiplier: 1/2)
        ])
    }

    private func setupScrollViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 12),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.heightAnchor.constraint(equalTo: mainImageView.widthAnchor, multiplier: 2/3)
        ])
    }

    private func setupStackViewConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }

    private func setupSubImageViewConstraints() {
        [firstSubImageView, secondSubImageView, thirdSubImageView, fourthSubImageView, fifthSubImageView]
            .forEach {
                $0.widthAnchor.constraint(equalTo: mainImageView.widthAnchor, multiplier: 1/3).isActive = true
            }
    }

    private func setupMoreButtonConstraints() {
        NSLayoutConstraint.activate([
            moreButton.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 12),
            moreButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            moreButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            moreButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }

    private func setupUserInterationEnabled(_ bool: Bool) {
        contentView.isUserInteractionEnabled = bool
    }

    private func setupSelectionStyle(_ style: UITableViewCell.SelectionStyle) {
        selectionStyle = .none
    }

    private func setupContentInset(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) {
        scrollView.contentInset = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }
}

// MARK: - Namespace

private enum Design {
    static let titlelabelText = "놓치지 마세요!\n지금 할인중인 스킨 & 챔피언"
    static let languageColor = UIColor(named: "LanguageColor")
    static let secondaryColor = UIColor(named: "SecondaryColor")
}
