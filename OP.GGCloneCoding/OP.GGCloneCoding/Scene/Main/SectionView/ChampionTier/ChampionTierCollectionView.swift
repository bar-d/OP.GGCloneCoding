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
        registerCell()
        setupBackgroundColor(Design.primitiveColor)
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
            register(cellType: PositionTabBarCollectionViewCell.self)
        case .page:
            register(cellType: ChampionTierCollectionViewCell.self)
        }
    }

    private func setupBackgroundColor(_ color: UIColor?) {
        backgroundColor = color
    }
}

// MARK: - Namespace

private enum Design {
    static let primitiveColor = UIColor(named: "PrimitiveColor")
}
