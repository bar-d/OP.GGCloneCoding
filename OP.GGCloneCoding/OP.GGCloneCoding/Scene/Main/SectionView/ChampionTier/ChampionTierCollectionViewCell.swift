//
//  ChampionTierCollectionViewCell.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/27.
//

import UIKit

final class ChampionTierCollectionViewCell: UICollectionViewCell {
    
    // MARK: Properties
    
    private let firstChampionTierView = ChampionTierView()
    private let secondChampionTierView = ChampionTierView()
    private let thirdChampionTierView = ChampionTierView()
    private let fourthChampionTierView = ChampionTierView()
    private let fifthChampionTierView = ChampionTierView()
    
    private let championStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
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
    
    func setupChampionImages(
        first: UIImage?,
        second: UIImage?,
        third: UIImage?,
        fourth: UIImage?,
        fifth: UIImage?
    ) {
        firstChampionTierView.setupImage(with: first)
        secondChampionTierView.setupImage(with: second)
        thirdChampionTierView.setupImage(with: third)
        fourthChampionTierView.setupImage(with: fourth)
        fifthChampionTierView.setupImage(with: fifth)
    }
    
    private func commonInit() {
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        [championStackView]
            .forEach { addSubview($0) }
        [firstChampionTierView, secondChampionTierView, thirdChampionTierView,
        fourthChampionTierView, fifthChampionTierView]
            .forEach { championStackView.addArrangedSubview($0) }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            championStackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            championStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            championStackView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 16
            ),
            championStackView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -16
            )
        ])
    }
}
