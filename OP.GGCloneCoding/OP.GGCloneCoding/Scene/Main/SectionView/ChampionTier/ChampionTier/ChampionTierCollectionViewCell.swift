//
//  ChampionTierCollectionViewCell.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/27.
//

import UIKit

final class ChampionTierCollectionViewCell: UICollectionViewCell {
    
    // MARK: Properties
    
    private let titleLabel = LabelBuilder()
        .setupConstraintsAutomatic(false)
        .build()
    
    private let championTierimageView = ImageViewBuilder()
        .setupBackgroundColor(.blue)
        .build()
    
    private let chapionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        
        return stackView
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
        backgroundColor = .gray
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    // MARK: - Methods
    
    func setupTitle(with text: String) {
        titleLabel.text = text
    }
    
    private func commonInit() {
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        addSubview(titleLabel)
        addSubview(championTierimageView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
