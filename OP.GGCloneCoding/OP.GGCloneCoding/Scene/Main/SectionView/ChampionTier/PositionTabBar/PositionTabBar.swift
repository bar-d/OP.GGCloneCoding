//
//  PositionTabBar.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/27.
//

import UIKit

final class PositionTabBar: UIView {
    
    // MARK: Properties
    
    private weak var positionTabBarDelegate: PositionTabBarDelegate?
    private let positionTabBarCollectionView = ChampionTierCollectionView(
        section: .tapBar
    )
    
    private let indicatorView = IndicatorView()
    
    private var indicatorViewLeadingConstraint = NSLayoutConstraint()
    private var indicatorViewWidthConstraint = NSLayoutConstraint()
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

    func setupPostionTabBarDelegate(_ delegate: PositionTabBarDelegate) {
        positionTabBarDelegate = delegate
    }

    func selectTabBarItem(at index: IndexPath, animated: Bool = true) {
        positionTabBarCollectionView.selectItem(
            at: index,
            animated: true,
            scrollPosition: .init()
        )
    }

    func updateIndicatorViewWidthConstraints(width: CGFloat) {
        indicatorViewWidthConstraint.constant = width
    }
    
    func updateIndicatorViewLeadingConstraints(leading: CGFloat) {
        indicatorViewLeadingConstraint.constant = leading
    }

    func calculateIndicatorViewWidthConstraint() -> NSLayoutConstraint {
        return indicatorViewWidthConstraint
    }

    private func commonInit() {
        setupConstraintsAutomatic(false)
        setupDelegate()
        setupDataSource()
        setupSubviews()
        setupConstraints()
        selectInitialItem()
        setupBackgroundColor(.lightGray)
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
            positionTabBarCollectionView.topAnchor.constraint(equalTo: topAnchor),
            positionTabBarCollectionView.leadingAnchor.constraint(
                equalTo: leadingAnchor
            ),
            positionTabBarCollectionView.trailingAnchor.constraint(
                equalTo: trailingAnchor
            ),
            positionTabBarCollectionView.heightAnchor.constraint(equalToConstant: 58)
        ])
    }
    
    private func setupIndicatorViewConstraints() {
        indicatorViewWidthConstraint = indicatorView.widthAnchor.constraint(
            equalToConstant: frame.width / 5
        )
        indicatorViewLeadingConstraint = indicatorView.leadingAnchor.constraint(
            equalTo: leadingAnchor
        )
        
        NSLayoutConstraint.activate([
            indicatorViewWidthConstraint,
            indicatorViewLeadingConstraint,
            indicatorView.heightAnchor.constraint(equalToConstant: 2),
            indicatorView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupDelegate() {
        positionTabBarCollectionView.delegate = self
    }
    
    private func setupDataSource() {
        positionTabBarCollectionView.dataSource = self
    }
    
    private func selectInitialItem() {
        let indexPath = IndexPath(item: .zero, section: .zero)
        positionTabBarCollectionView.selectItem(
            at: indexPath,
            animated: false,
            scrollPosition: .init()
        )
    }
    
    private func setupBackgroundColor(_ color: UIColor) {
        backgroundColor = color
    }
}

// MARK: - Extension

extension PositionTabBar: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell: PositionTabBarCollectionViewCell = collectionView.dequeueReusableCell(
            for: indexPath
        )
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
        
        return CGSize(width: frame.width / 5, height: 55)
    }
    
    func collectionView(
        _ collectionView: UICollectionView
        , didSelectItemAt indexPath: IndexPath
    ) {
        positionTabBarDelegate?.scrollTabBar(to: indexPath)
    }
}

extension PositionTabBar: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView
        , layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        
        return .zero
    }
}
