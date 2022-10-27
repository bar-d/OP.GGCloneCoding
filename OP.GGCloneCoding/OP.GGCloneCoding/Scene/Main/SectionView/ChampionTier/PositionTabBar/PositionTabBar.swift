//
//  PositionTabBar.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/27.
//

import UIKit

class PositionTabBar: UIView {
    
    // MARK: Properties
    
    var customMenuBarDelegate: PositionTabBarDelegate?
    var positionTabBarCollectionView = ChampionTierCollectionView(section: .tapBar)
    
    var indicatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        
        return view
    }()
    
    var indicatorViewLeadingConstraint = NSLayoutConstraint()
    var indicatorViewWidthConstraint = NSLayoutConstraint()
    private let postion = ["탑", "정글", "미드", "바텀", "서폿"]
    
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
        setupDelegate()
        setupDataSource()
        setupSubviews()
        setupConstraints()
        selectInitialItem()
    }
    
    private func setupConstraintsAutomatic(_ bool: Bool) {
        translatesAutoresizingMaskIntoConstraints = bool
    }
    
    private func setupSubviews() {
        [positionTabBarCollectionView, indicatorView]
            .forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        setupCustomTabBarCollectionViewConstraints()
        setupIndicatorViewConstraints()
    }
    
    private func setupCustomTabBarCollectionViewConstraints() {
        NSLayoutConstraint.activate([
            positionTabBarCollectionView.topAnchor.constraint(equalTo: self.topAnchor),
            positionTabBarCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            positionTabBarCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            positionTabBarCollectionView.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
    
    private func setupIndicatorViewConstraints() {
        indicatorViewWidthConstraint = indicatorView.widthAnchor.constraint(equalToConstant: self.frame.width / 5)
        indicatorViewLeadingConstraint = indicatorView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        
        NSLayoutConstraint.activate([
            indicatorViewWidthConstraint,
            indicatorViewLeadingConstraint,
            indicatorView.heightAnchor.constraint(equalToConstant: 5),
            indicatorView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func setupDelegate() {
        positionTabBarCollectionView.delegate = self
    }
    
    private func setupDataSource() {
        positionTabBarCollectionView.dataSource = self
    }
    
    private func selectInitialItem() {
        let indexPath = IndexPath(item: 0, section: 0)
        positionTabBarCollectionView.selectItem(at: indexPath,
                                                animated: false,
                                                scrollPosition: .init())
    }
}

// MARK: - Extension

extension PositionTabBar: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell: PositionTabBarCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.setupTitle(with: postion[indexPath.row])
        
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        
        return postion.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        
        return CGSize(width: self.frame.width / 5, height: 55)
    }
    
    func collectionView(
        _ collectionView: UICollectionView
        , didSelectItemAt indexPath: IndexPath
    ) {
        customMenuBarDelegate?.customMenuBar(scrollTo: indexPath.row)
    }
}

extension PositionTabBar: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(
        _ collectionView: UICollectionView
        , layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        
        return 0
    }
}
