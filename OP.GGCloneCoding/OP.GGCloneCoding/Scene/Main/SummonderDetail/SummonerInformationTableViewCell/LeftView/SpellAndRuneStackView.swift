//
//  SpellAndRuneStackView.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/08.
//

import SwiftUI

final class SpellAndRuneStackView: UIStackView {
    
    // MARK: Properties
    
    private let totalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private let spellStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private let firstSpellImageView = ImageViewBuilder()
        .setupConstraintsAutomatic(false)
        .setupBackgroundColor(Design.imageBackgroundColor)
        .setupLayer(cornerRadius: 8)
        .build()
    
    private let secondSpellImageView = ImageViewBuilder()
        .setupConstraintsAutomatic(false)
        .setupBackgroundColor(Design.imageBackgroundColor)
        .setupLayer(cornerRadius: 8)
        .build()
    
    private let runeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private let mainRuneImageView = ImageViewBuilder()
        .setupConstraintsAutomatic(false)
        .setupBackgroundColor(Design.imageBackgroundColor)
        .setupLayer(cornerRadius: 20)
        .build()
    
    private let supportRuneImageView = ImageViewBuilder()
        .setupConstraintsAutomatic(false)
        .setupBackgroundColor(Design.imageBackgroundColor)
        .setupLayer(cornerRadius: 20)
        .build()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    // MARK: - View Life Cycle
    
    override func layoutSubviews() {
        setupRuneImageCircle()
    }
    
    // MARK: - Methods
    
    private func commonInit() {
        setupConstraintsAutomatic(false)
        setupSubviews()
        setupAxis(.horizontal)
        setupSpacing(4)
        setupDistribution(.fillEqually)
    }
    
    private func setupConstraintsAutomatic(_ bool: Bool) {
        translatesAutoresizingMaskIntoConstraints = bool
    }
    
    private func setupSubviews() {
        [spellStackView, runeStackView]
            .forEach { addArrangedSubview($0) }
        [firstSpellImageView, secondSpellImageView]
            .forEach { spellStackView.addArrangedSubview($0) }
        [mainRuneImageView, supportRuneImageView]
            .forEach { runeStackView.addArrangedSubview($0) }
    }
    
    private func setupAxis(_ myAxis: NSLayoutConstraint.Axis) {
        axis = myAxis
    }
    
    private func setupSpacing(_ space: CGFloat) {
        spacing = space
    }
    
    private func setupDistribution(_ myDistribution: Distribution) {
        distribution = myDistribution
    }
    
    private func setupRuneImageCircle() {
        mainRuneImageView.layer.cornerRadius = firstSpellImageView.frame.width / 2
        supportRuneImageView.layer.cornerRadius = firstSpellImageView.frame.width / 2
    }
}

// MARK: - Namespace

private enum Design {
    static let imageBackgroundColor = UIColor(named: "LanguageColor")
}

// MARK: - Preview

struct SpellAndRuneView_Preview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let view = SpellAndRuneStackView()
            view.translatesAutoresizingMaskIntoConstraints = true
            
            return view
        }
        .previewLayout(.fixed(width: 300, height: 300))
    }
}
