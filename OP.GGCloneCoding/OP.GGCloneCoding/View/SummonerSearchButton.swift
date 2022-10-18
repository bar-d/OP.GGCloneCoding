//
//  SummonerSearchButton.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/18.
//

import UIKit

final class SummonerSearchButton: UIButton {

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
        setupConstraints()
        setupColor()
        setupImage()
        setupTitle()
        setupInset()
        setupPriority()
        setupLayer()
        setupAlignment()
    }
    
    private func setupConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupColor() {
        tintColor = Design.languageColor
    }

    private func setupImage() {
        setImage(Design.searchImage, for: .normal)
        setPreferredSymbolConfiguration(.init(textStyle: .title3, scale: .default), forImageIn: .normal)
    }

    private func setupTitle() {
        setTitle(Design.title, for: .normal)
        titleLabel?.font = .preferredFont(forTextStyle: .footnote)
        setTitleColor(Design.languageColor, for: .normal)
    }

    private func setupInset() {
        titleEdgeInsets = Design.summonerSearchButtonTitleInset
        contentEdgeInsets = Design.summonerSearchButtonContentInset
        insetsLayoutMarginsFromSafeArea = false
    }

    private func setupPriority() {
        setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }

    private func setupLayer() {
        layer.cornerRadius = Design.laguageButtonCornerRadius
        layer.borderWidth = 1.0
        layer.borderColor = Design.languageColor?.cgColor.copy(alpha: 0.5)
    }
    
    private func setupAlignment() {
        contentHorizontalAlignment = .left
    }
}

// MARK: - Namespace

private enum Design {
    static let laguageButtonCornerRadius: CGFloat = 4

    static let searchImage = UIImage(systemName: "magnifyingglass")
    static let title = "소환사 검색"
    
    static let secondaryColor = UIColor(named: "SecondaryColor")
    static let languageColor = UIColor(named: "LanguageColor")

    static let summonerSearchButtonTitleInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
    static let summonerSearchButtonContentInset = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 0)
}
