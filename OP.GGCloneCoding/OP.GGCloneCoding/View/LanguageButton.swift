//
//  LanguageButton.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/18.
//

import UIKit

final class LanguageButton: UIButton {

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
        setupAttribute()
    }
    
    private func setupConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupColor() {
        tintColor = Design.languageColor
        backgroundColor = Design.secondaryColor
    }

    private func setupImage() {
        setImage(Design.chevronDonwImage, for: .normal)
    }

    private func setupTitle() {
        setTitle("KR", for: .normal)
        titleLabel?.font = .preferredFont(forTextStyle: .headline)
        setTitleColor(Design.languageColor, for: .normal)
    }

    private func setupInset() {
        titleEdgeInsets = Design.languageButtonTitleInset
        contentEdgeInsets = Design.languageButtonContentInset
        insetsLayoutMarginsFromSafeArea = false
    }

    private func setupPriority() {
        setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }

    private func setupLayer() {
        layer.cornerRadius = Design.laguageButtonCornerRadius
    }

    private func setupAttribute() {
        semanticContentAttribute = .forceRightToLeft
    }
}

// MARK: - Namespace

private enum Design {
    static let laguageButtonCornerRadius: CGFloat = 4

    static let chevronDonwImage = UIImage(systemName: "chevron.down")

    static let secondaryColor = UIColor(named: "SecondaryColor")
    static let languageColor = UIColor(named: "LanguageColor")

    static let languageButtonTitleInset = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
    static let languageButtonContentInset = UIEdgeInsets(top: 4, left: 24, bottom: 4, right: 8)
}
