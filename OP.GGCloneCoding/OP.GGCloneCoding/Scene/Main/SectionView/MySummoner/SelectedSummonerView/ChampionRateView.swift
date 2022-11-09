//
//  ChampionRateView.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/09.
//

import UIKit

final class ChampionRateView: UIView {
    
    // MARK: Properties
    
    private let championImageView = ImageViewBuilder()
        .setupConstraintsAutomatic(false)
        .setupImage(image: UIImage(named: "OP.GGIcon"))
        .setupLayer(cornerRadius: 10)
        .build()
    
    private let winRateLabel = LabelBuilder()
        .setupConstraintsAutomatic(false)
        .setupLabelText(text: "38%", color: .label)
        .setupLabelTextAttributes(alignment: .left)
        .build()
    
    private let KDALabel = LabelBuilder()
        .setupConstraintsAutomatic(false)
        .setupLabelText(text: "5.20:1")
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
        [championImageView, winRateLabel, KDALabel]
            .forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        setupChampionImageViewConstraints()
        setupWiinRateLabelConstraints()
        setupKDALabelConstraints()
    }
    
    private func setupChampionImageViewConstraints() {
        NSLayoutConstraint.activate([
            championImageView.topAnchor.constraint(equalTo: topAnchor),
            championImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            championImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            championImageView.heightAnchor.constraint(equalTo: winRateLabel.heightAnchor, multiplier: 2),
            championImageView.widthAnchor.constraint(equalTo: championImageView.heightAnchor)
        ])
    }
    
    private func setupWiinRateLabelConstraints() {
        NSLayoutConstraint.activate([
            winRateLabel.leadingAnchor.constraint(equalTo: championImageView.trailingAnchor, constant: 4),
            winRateLabel.bottomAnchor.constraint(equalTo: KDALabel.topAnchor)
        ])
    }
    
    private func setupKDALabelConstraints() {
        NSLayoutConstraint.activate([
            KDALabel.bottomAnchor.constraint(equalTo: championImageView.bottomAnchor, constant: -4),
            KDALabel.leadingAnchor.constraint(equalTo: championImageView.trailingAnchor, constant: 4)
        ])
    }
}
