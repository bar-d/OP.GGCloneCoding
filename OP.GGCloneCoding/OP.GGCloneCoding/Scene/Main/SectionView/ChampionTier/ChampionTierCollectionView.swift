//
//  ChampionTierCollectionView.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/27.
//

import UIKit

final class ChampionTierCollectionView: UICollectionView {
    
    // MARK: Enumeration
    
    enum Section {
        case tapBar
        case page
    }
    
    // MARK: - Properties

    private let section: Section

    // MARK: - Initializers
    
    init(section: Section) {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        self.section = section
        super.init(frame: .zero, collectionViewLayout: collectionViewLayout)

       commonInit()
    }

    required init?(coder: NSCoder) {
        self.section = .page
        super.init(coder: coder)
        
        commonInit()
    }
    
    // MARK: - Methods
    
    private func commonInit() {
        setupConstraintsAutomatic(false)
        setupScrollIndicator(horizontal: false, vertical: false)
        setupPagingEnable(true)
        setupScrollEnable()
        registerCell()
    }
    
    private func setupConstraintsAutomatic(_ bool: Bool) {
        translatesAutoresizingMaskIntoConstraints = bool
    }
    
    private func setupScrollIndicator(horizontal: Bool, vertical: Bool) {
        showsHorizontalScrollIndicator = horizontal
        showsVerticalScrollIndicator = vertical
    }
    
    private func setupPagingEnable(_ bool: Bool) {
        isPagingEnabled = bool
    }

    private func registerCell() {
        switch section {
        case .tapBar:
            register(PositionTabBarCollectionViewCell.self,
                     forCellWithReuseIdentifier: PositionTabBarCollectionViewCell.identifier)
        case .page:
            register(ChampionTierCollectionViewCell.self,
                     forCellWithReuseIdentifier: ChampionTierCollectionViewCell.identifier)
        }
    }
    
    private func setupScrollEnable() {
        switch section {
        case .tapBar:
            isScrollEnabled = false
        case .page:
            isScrollEnabled = true
        }
    }
}

