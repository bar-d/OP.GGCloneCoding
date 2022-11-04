//
//  ChampionImageView.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/28.
//

import UIKit

final class ChampionImageView: UIView {
    
    // MARK: Properties
    
    private let championImageView = ImageViewBuilder()
        .setupConstraintsAutomatic(false)
        .setupContentMode(.scaleAspectFill)
        .setupImage(image: UIImage(named: "OP.GGLaunchLogo"))
        .setupLayer(cornerRadius: 20)
        .build()
    
    private let rankingImageView = ImageViewBuilder()
        .setupConstraintsAutomatic(false)
        .setupImage(image: UIImage(named: "OP.GGLaunchLogo"))
        .build()
    
    // MARK: - Initialzers
    
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
        [championImageView, rankingImageView]
            .forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        setupChampionImageViewConstraints()
        setupRankingImageViewConstraints()
    }
    
    private func setupChampionImageViewConstraints() {
        NSLayoutConstraint.activate([
            championImageView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            championImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            championImageView.widthAnchor.constraint(equalTo: championImageView.heightAnchor),
            championImageView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func setupRankingImageViewConstraints() {
        NSLayoutConstraint.activate([
            rankingImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            rankingImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            rankingImageView.widthAnchor.constraint(equalTo: championImageView.widthAnchor, multiplier: 1/3),
            rankingImageView.heightAnchor.constraint(equalTo: rankingImageView.widthAnchor, multiplier: 3/2),
            heightAnchor.constraint(equalTo: widthAnchor)
        ])
    }
}
