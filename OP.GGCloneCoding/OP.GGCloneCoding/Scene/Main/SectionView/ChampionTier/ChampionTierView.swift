//
//  ChampionTierView.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/28.
//

import UIKit

final class ChampionTierView: UIView {
    
    // MARK: Properties
    
    private let championImageView = ChampionImageView()
    
    private let equalImage = ImageViewBuilder()
        .setupConstraintsAutomatic(false)
        .setupImage(image: UIImage(systemName: "equal"))
        .setupImageTintColor(.gray)
        .build()
    
    private let percentLabel = LabelBuilder()
        .setupConstraintsAutomatic(false)
        .setupLabelText(text: "53.54%", color: .label)
        .setupLabelTextAttributes(font: .footnote)
        .build()
    
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
        [championImageView, equalImage, percentLabel]
            .forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        setupChampionViewConstraints()
        setupEqualImageConstraints()
        setupPercentLabelConstraints()
    }
    
    private func setupChampionViewConstraints() {
        NSLayoutConstraint.activate([
            championImageView.topAnchor.constraint(equalTo: topAnchor),
            championImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            championImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func setupEqualImageConstraints() {
        NSLayoutConstraint.activate([
            equalImage.topAnchor.constraint(
                equalTo: championImageView.bottomAnchor,
                constant: 4
            ),
            equalImage.widthAnchor.constraint(equalTo: percentLabel.heightAnchor),
            equalImage.heightAnchor.constraint(equalTo: equalImage.widthAnchor),
            equalImage.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func setupPercentLabelConstraints() {
        NSLayoutConstraint.activate([
            percentLabel.topAnchor.constraint(
                equalTo: equalImage.bottomAnchor,
                constant: 4
            ),
            percentLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
