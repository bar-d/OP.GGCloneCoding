//
//  ChampionTierTableViewCell.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/27.
//

import UIKit

final class ChampionTierTableViewCell: UITableViewCell, PositionTabBarDelegate {
    
    // MARK: Properties
    
    private let titleLabel = LabelBuilder()
        .setupMainCellTitleLabel(text: Design.titleLabelText)
        .build()

    private let positionTapBar = PositionTabBar()
    private let championTierCollectionView = ChampionTierCollectionView(section: .page)

    private let moreButton = ButtonBuilder()
        .setupMoreButton()
        .build()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }

    // MARK: - View Life Cycle

    override func layoutSubviews() {
        super.layoutSubviews()

        setupPositionTabBarConstraints()
    }
    
    // MARK: - Methods
    
    func scrollTabBar(to index: IndexPath) {
        championTierCollectionView.scrollToItem(
            at: index,
            at: .centeredHorizontally,
            animated: true
        )
    }
    
    private func commonInit() {
        setupContentViewUserInteraction(false)
        setupSubviews()
        setupConstraints()
        setupDelegate()
        setupDataSource()
    }
    
    private func setupContentViewUserInteraction(_ bool: Bool) {
        contentView.isUserInteractionEnabled = bool
    }
    
    private func setupSubviews() {
        [titleLabel, positionTapBar, championTierCollectionView, moreButton]
            .forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        setupTitleLabelConstraints()
        setupPositionTabBarConstraints()
        setupChampionTierCollectionViewConstraints()
        setupMoreButtonConstraints()
    }
    
    private func setupTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func setupPositionTabBarConstraints() {
        positionTapBar.updateIndicatorViewWidthConstraints(width: frame.width / 5)
        NSLayoutConstraint.activate([
            positionTapBar.calculateIndicatorViewWidthConstraint(),
            positionTapBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            positionTapBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            positionTapBar.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            positionTapBar.heightAnchor.constraint(equalTo: titleLabel.heightAnchor, multiplier: 2)
        ])
    }
    
    private func setupChampionTierCollectionViewConstraints() {
        NSLayoutConstraint.activate([
            championTierCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            championTierCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            championTierCollectionView.topAnchor.constraint(equalTo: positionTapBar.bottomAnchor),
            championTierCollectionView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func setupMoreButtonConstraints() {
        NSLayoutConstraint.activate([
            moreButton.topAnchor.constraint(
                equalTo: championTierCollectionView.bottomAnchor,
                constant: 8
            ),
            moreButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            moreButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            moreButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    private func setupDelegate() {
        championTierCollectionView.delegate = self
        positionTapBar.setupPostionTabBarDelegate(self)
    }
    
    private func setupDataSource() {
        championTierCollectionView.dataSource = self
    }
}

// MARK: - Extension

extension ChampionTierTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell: ChampionTierCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.setupTitle(with: "\(indexPath.row + 1)번째 뷰")
        
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        
        return 5
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        positionTapBar.updateIndicatorViewLeadingConstraints(leading: scrollView.contentOffset.x / 5)
    }
    
    func scrollViewWillEndDragging(
        _ scrollView: UIScrollView,
        withVelocity velocity: CGPoint,
        targetContentOffset: UnsafeMutablePointer<CGPoint>
    ) {
        let indexPathItem = Int(targetContentOffset.pointee.x / frame.width)
        let indexPath = IndexPath(item: indexPathItem, section: .zero)

        positionTapBar.selectTabBarItem(at: indexPath)
    }
}

extension ChampionTierTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        
        return CGSize(
            width: championTierCollectionView.frame.width,
            height: championTierCollectionView.frame.height
        )
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        
        return 0
    }
}

// MARK: - Namespace

private enum Design {
    static let titleLabelText = "챔피언 티어"
}
