//
//  ItemStackView.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/09.
//

import UIKit

final class ItemStackView: UIStackView {
    
    // MARK: Properties
    
    private let firstItemImageView = ImageViewBuilder()
        .setupConstraintsAutomatic(false)
        .setupBackgroundColor(Design.languageColor)
        .setupLayer(cornerRadius: 8)
        .build()
    
    private let secondItemImageView = ImageViewBuilder()
        .setupConstraintsAutomatic(false)
        .setupBackgroundColor(Design.languageColor)
        .setupLayer(cornerRadius: 8)
        .build()
    
    private let thirdItemImageView = ImageViewBuilder()
        .setupConstraintsAutomatic(false)
        .setupBackgroundColor(Design.languageColor)
        .setupLayer(cornerRadius: 8)
        .build()
    
    private let fourthItemImageView = ImageViewBuilder()
        .setupConstraintsAutomatic(false)
        .setupBackgroundColor(Design.languageColor)
        .setupLayer(cornerRadius: 8)
        .build()
    
    private let fifthItemImageView = ImageViewBuilder()
        .setupConstraintsAutomatic(false)
        .setupBackgroundColor(Design.languageColor)
        .setupLayer(cornerRadius: 8)
        .build()
    
    private let sixthItemImageView = ImageViewBuilder()
        .setupConstraintsAutomatic(false)
        .setupBackgroundColor(Design.languageColor)
        .setupLayer(cornerRadius: 8)
        .build()
    
    private let accessoryItemImageView = ImageViewBuilder()
        .setupConstraintsAutomatic(false)
        .setupBackgroundColor(Design.languageColor)
        .setupLayer(cornerRadius: 8)
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
    
    // MARK: - Methods
    // 추후 네트워킹을 통해 데이터를 가져왔을 때 각자의 아이템에 이미지를 뿌려줄 수 있는 메서드 구현 필요
    
    private func commonInit() {
        setupConstraintsAutomatic(false)
        setupSubviews()
        setupConstraints()
        setupAxis(.horizontal)
        setupSpacing(2)
        setupDistribution(.fillProportionally)
    }
    
    private func setupConstraintsAutomatic(_ bool: Bool) {
        translatesAutoresizingMaskIntoConstraints = bool
    }
    
    private func setupSubviews() {
        [firstItemImageView, secondItemImageView, thirdItemImageView,
         fourthItemImageView, fifthItemImageView, sixthItemImageView,
         accessoryItemImageView]
            .forEach { addArrangedSubview($0) }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            firstItemImageView.heightAnchor.constraint(equalTo: heightAnchor),
            firstItemImageView.widthAnchor.constraint(
                equalTo: firstItemImageView.heightAnchor
            )
        ])
        [secondItemImageView, thirdItemImageView, fourthItemImageView,
         fifthItemImageView, sixthItemImageView, accessoryItemImageView]
            .forEach {
                $0.heightAnchor.constraint(
                    equalTo: firstItemImageView.heightAnchor
                ).isActive = true
                $0.widthAnchor.constraint(
                    equalTo: firstItemImageView.widthAnchor
                ).isActive = true
            }
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
}

// MARK: - Namespace

private enum Design {
    static let languageColor = UIColor(named: "LanguageColor")
}
