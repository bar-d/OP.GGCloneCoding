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
    
    private let championTierImageView = ImageViewBuilder()
        .setupConstraintsAutomatic(false)
        .setupImage(image: UIImage(named: "OPTier"))
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
    
    func setupChampionImage(with image: UIImage?) {
        championImageView.image = image
    }
    
    func setupTierIcon(with image: UIImage?) {
        championTierImageView.image = image
    }
    
    private func commonInit() {
        setupConstraintsAutomatic(false)
        setupSubviews()
        setupConstraints()
    }
    
    private func setupConstraintsAutomatic(_ bool: Bool) {
        translatesAutoresizingMaskIntoConstraints = bool
    }
    
    private func setupSubviews() {
        [championImageView, championTierImageView]
            .forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        setupChampionImageViewConstraints()
        setupRankingImageViewConstraints()
    }
    
    private func setupChampionImageViewConstraints() {
        NSLayoutConstraint.activate([
            championImageView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            championImageView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -4
            ),
            championImageView.widthAnchor.constraint(
                equalTo: championImageView.heightAnchor
            ),
            championImageView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func setupRankingImageViewConstraints() {
        NSLayoutConstraint.activate([
            championTierImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            championTierImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            championTierImageView.widthAnchor.constraint(
                equalTo: championImageView.widthAnchor,
                multiplier: 1/3
            ),
            championTierImageView.heightAnchor.constraint(
                equalTo: championTierImageView.widthAnchor,
                multiplier: 3/2
            ),
            heightAnchor.constraint(equalTo: widthAnchor)
        ])
    }
}
