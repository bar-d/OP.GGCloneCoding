//
//  SummonerInformationLeftView.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/09.
//

import UIKit

final class SummonerInformationLeftView: UIView {
    
    // MARK: Properties
    
    private let gameResultView = GameResultView()
    
    private let totalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        
        return stackView
    }()
    
    private let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 4
        
        return stackView
    }()
    
    private let championImageView = ImageViewBuilder()
        .setupConstraintsAutomatic(false)
        .setupBackgroundColor(Design.imageBackgroundColor)
        .setupLayer(cornerRadius: 10)
        .build()
    
    private let spellAndRuneView = SpellAndRuneStackView()
    
    private let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.distribution = .equalSpacing
        
        return stackView
    }()
    
    private let kdaLabel = LabelBuilder()
        .setupConstraintsAutomatic(false)
        .setupLabelText(text: "9 / 8 / 36")
        .setupLabelTextAttributes(alignment: .left, font: .body)
        .build()
    
    private let killPercentLabel = LabelBuilder()
        .setupConstraintsAutomatic(false)
        .setupLabelText(text: Design.killPercentLabelText, color: .lightGray)
        .setupLabelTextAttributes(alignment: .left, font: .footnote)
        .build()
    
    private let itemListView = ItemStackView()
    
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
    }
    
    private func setupConstraintsAutomatic(_ bool: Bool) {
        translatesAutoresizingMaskIntoConstraints = bool
    }
    
    private func setupSubviews() {
        [horizontalStackView, itemListView]
            .forEach { totalStackView.addArrangedSubview($0) }
        [championImageView, spellAndRuneView, labelStackView]
            .forEach { horizontalStackView.addArrangedSubview($0) }
        
        [kdaLabel, killPercentLabel]
            .forEach { labelStackView.addArrangedSubview($0) }
        [gameResultView, championImageView, spellAndRuneView, labelStackView,
         itemListView]
            .forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        setupGameResulViewConstraints()
        setupChampionImageViewConstraints()
        setupSpellAndRuneViewConstraints()
        setupLabelStackViewConstraints()
        setupItemListViewConstraints()
    }
    
    private func setupGameResulViewConstraints() {
        NSLayoutConstraint.activate([
            gameResultView.topAnchor.constraint(equalTo: topAnchor),
            gameResultView.bottomAnchor.constraint(equalTo: bottomAnchor),
            gameResultView.leadingAnchor.constraint(equalTo: leadingAnchor),
            gameResultView.widthAnchor.constraint(
                equalTo: gameResultView.heightAnchor,
                multiplier: 1/3
            )
        ])
    }
    
    //
    private func setupChampionImageViewConstraints() {
        NSLayoutConstraint.activate([
            championImageView.heightAnchor.constraint(
                equalTo: heightAnchor,
                multiplier: 2/5
            ),
            championImageView.widthAnchor.constraint(
                equalTo: championImageView.heightAnchor
            ),
            championImageView.leadingAnchor.constraint(
                equalTo: gameResultView.trailingAnchor,
                constant: 20
            ),
            championImageView.bottomAnchor.constraint(
                equalTo: itemListView.topAnchor,
                constant: -8
            )
        ])
    }
    
    private func setupSpellAndRuneViewConstraints() {
        NSLayoutConstraint.activate([
            spellAndRuneView.heightAnchor.constraint(
                equalTo: championImageView.heightAnchor
            ),
            spellAndRuneView.widthAnchor.constraint(
                equalTo: spellAndRuneView.heightAnchor
            ),
            spellAndRuneView.leadingAnchor.constraint(
                equalTo: championImageView.trailingAnchor,
                constant: 8
            ),
            spellAndRuneView.topAnchor.constraint(
                equalTo: championImageView.topAnchor
            )
        ])
    }
    
    private func setupLabelStackViewConstraints() {
        NSLayoutConstraint.activate([
            labelStackView.topAnchor.constraint(equalTo: spellAndRuneView.topAnchor),
            labelStackView.leadingAnchor.constraint(
                equalTo: spellAndRuneView.trailingAnchor,
                constant: 20
            ),
            labelStackView.bottomAnchor.constraint(equalTo: spellAndRuneView.bottomAnchor)
        ])
    }
    
    private func setupItemListViewConstraints() {
        NSLayoutConstraint.activate([
            itemListView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            itemListView.leadingAnchor.constraint(
                equalTo: gameResultView.trailingAnchor,
                constant: 20
            ),
            itemListView.heightAnchor.constraint(
                equalTo: spellAndRuneView.heightAnchor,
                multiplier: 1/2
            )
        ])
    }
}

// MARK: - Namespace

private enum Design {
    static let imageBackgroundColor = UIColor(named: "LanguageColor")
    static let killPercentLabelText = "킬 관여 55%"
}
