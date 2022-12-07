//
//  SummonerInformationStickyHeaderView.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/28.
//

import UIKit

final class SummonerInformationStickyHeaderView: UIView {
    
    // MARK: Properties
    
    private let stickyImageView = ImageViewBuilder()
        .setupConstraintsAutomatic(false)
        .setupImage(image: UIImage(named: "a"))
        .setupBackgroundColor(.gray)
        .setupClipstoBounds(true)
        .setupContentMode(.scaleAspectFill)
        .build()
    
    private let iconImageView = ImageViewBuilder()
        .setupConstraintsAutomatic(false)
        .setupImage(image: Design.iconImageViewImage)
        .setupBackgroundColor(.gray)
        .setupLayer(cornerRadius: 20)
        .setupLayer(cornerRadius: 28)
        .build()
    
    private let levelLabel = LabelBuilder()
        .setupConstraintsAutomatic(false)
        .setupLabelText(text: Design.levelLabelText ,color: .label)
        .setupLabelTextAttributes(alignment: .center)
        .setupLayer(cornerRadius: 10)
        .setupLayerBackgroundColor(.lightGray)
        .build()
    
    private let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        
        return stackView
    }()
    
    private let summonerNameLabel = LabelBuilder()
        .setupConstraintsAutomatic(false)
        .setupLabelText(text: "바드의협곡여행", color: .white)
        .setupLabelTextAttributes(alignment: .left, font: .title3)
        .build()
    
    /// 추후 숫자만 파란색으로 변경
    /// 랭크 전적 기록 가져오면 fetch하도록 변경해야 될까
    private let rankingLabel = LabelBuilder()
        .setupConstraintsAutomatic(false)
        .setupLabelText(text: Design.rankingLabelText, color: .lightGray)
        .setupLabelTextAttributes(font: .footnote)
        .build()
    
    private let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        
        return stackView
    }()
    
    private let updateButton = ButtonBuilder()
        .setupConstraintsAutomatic(false)
        .setupTitle(name: Design.updateButtonTitle, font: .caption1, color: .white)
        .setupColor(background: Design.updateButtonColor)
        .setupLayer(cornerRadius: 8)
        .build()
    
    private let inGameButton = ButtonBuilder()
        .setupConstraintsAutomatic(false)
        .setupTitle(name: Design.ingameButtonTitle, font: .caption1, color: .white)
        .setupColor(background: Design.ingameButtonColor)
        .setupLayer(cornerRadius: 8)
        .build()
    
    private var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private var containerViewHeightConstraint = NSLayoutConstraint()
    private var imageViewHeightConstraint = NSLayoutConstraint ()
    private var imageViewBottomConstraint = NSLayoutConstraint ()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init (frame: frame)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    // MARK: - Methods
    
    func scroliviewDidScroll(_ scrollView: UIScrollView, headerView: UIView) {
        setupImageViewConstraints(with: scrollView)
        
        let headerConstant = scrollView.contentOffset.y
        let stickyHeaderViewHeight = frame.height
        let headerViewHeight = headerView.frame.height
        
        headerView.alpha = headerConstant / (stickyHeaderViewHeight - headerViewHeight)
    }
    
    func setupImage(_ image: UIImage?) {
        stickyImageView.image = image
    }
    
    private func commonInit() {
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews () {
        [summonerNameLabel, rankingLabel]
            .forEach { labelStackView.addArrangedSubview($0) }
        [updateButton, inGameButton]
            .forEach { buttonStackView.addArrangedSubview($0) }
        [stickyImageView]
            .forEach { containerView.addSubview($0) }
        [containerView, iconImageView, levelLabel, labelStackView, buttonStackView]
            .forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        setupViewConstraints()
        setupContainerViewConstraints()
        setupImageViewConstraints()
        setupIconImageViewCosntraints()
        setupLevelLabelConstraints()
        setupLabelStackViewConstraints()
        setupButtonStackViewConstraints()
    }
    
    private func setupViewConstraints() {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalTo: containerView.widthAnchor),
            centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            heightAnchor.constraint(equalTo: containerView.heightAnchor),
        ])
    }
    
    private func setupContainerViewConstraints() {
        containerViewHeightConstraint = containerView.heightAnchor.constraint(
            equalTo: heightAnchor
        )
        NSLayoutConstraint.activate([
            containerViewHeightConstraint,
            containerView.widthAnchor.constraint(equalTo:stickyImageView.widthAnchor)
        ])
    }
    
    private func setupImageViewConstraints() {
        imageViewBottomConstraint = stickyImageView.bottomAnchor.constraint(
            equalTo: containerView.bottomAnchor
        )
        imageViewHeightConstraint = stickyImageView.heightAnchor.constraint(
            equalTo: containerView.heightAnchor
        )
        NSLayoutConstraint.activate([
            imageViewBottomConstraint,
            imageViewHeightConstraint,
            stickyImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
        ])
    }
    
    private func setupIconImageViewCosntraints() {
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/4),
            iconImageView.widthAnchor.constraint(equalTo: iconImageView.heightAnchor)
        ])
    }
    
    private func setupLevelLabelConstraints() {
        NSLayoutConstraint.activate([
            levelLabel.centerYAnchor.constraint(
                equalTo: iconImageView.bottomAnchor,
                constant: -4
            ),
            levelLabel.centerXAnchor.constraint(equalTo: iconImageView.centerXAnchor),
            levelLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 30)
        ])
    }
    
    private func setupLabelStackViewConstraints() {
        NSLayoutConstraint.activate([
            labelStackView.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor),
            labelStackView.leadingAnchor.constraint(
                equalTo: iconImageView.trailingAnchor,
                constant: 20
            )
        ])
    }
    
    private func setupButtonStackViewConstraints() {
        NSLayoutConstraint.activate([
            buttonStackView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 20
            ),
            buttonStackView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -20
            ),
            buttonStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            buttonStackView.heightAnchor.constraint(
                equalTo: summonerNameLabel.heightAnchor,
                multiplier: 2
            )
        ])
    }
    
    private func setupImageViewConstraints(with scrollView: UIScrollView) {
        let offsetY = -(scrollView.contentOffset.y + scrollView.contentInset.top)
        containerView.clipsToBounds = offsetY <= 0
        containerViewHeightConstraint.constant = scrollView.contentInset.top
        
        imageViewBottomConstraint.constant = offsetY >= 0 ? 0 : -offsetY / 2
        imageViewHeightConstraint.constant = max(
            offsetY + scrollView.contentInset.top,
            scrollView.contentInset.top
        )
    }
}

// MARK: - Namespace

private enum Design {
    static let iconImageViewImage = UIImage(named: "ChampionIcon")
    static let levelLabelText = "1"
    static let rankingLabelText = "래더 랭킹 -"
    static let updateButtonTitle = "전적 갱신"
    static let updateButtonColor = UIColor(named:"ButtonFontColor")
    static let ingameButtonTitle = "인게임"
    static let ingameButtonColor = UIColor(named:"LanguageColor")
}
