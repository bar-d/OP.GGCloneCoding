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
        setupContentViewUserInteractionEnabled(false)
        setupSubviews()
        setupConstraints()
        setupDelegate()
        setupDataSource()
        setupBackgroundColor(Design.primitiveColor)
    }
    
    private func setupContentViewUserInteractionEnabled(_ bool: Bool) {
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
            positionTapBar.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: 8
            ),
            positionTapBar.heightAnchor.constraint(
                equalTo: titleLabel.heightAnchor,
                multiplier: 2
            )
        ])
    }
    
    private func setupChampionTierCollectionViewConstraints() {
        NSLayoutConstraint.activate([
            championTierCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            championTierCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            championTierCollectionView.topAnchor.constraint(
                equalTo: positionTapBar.bottomAnchor
            ),
            championTierCollectionView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func setupMoreButtonConstraints() {
        NSLayoutConstraint.activate([
            moreButton.topAnchor.constraint(
                equalTo: championTierCollectionView.bottomAnchor,
                constant: 8
            ),
            moreButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
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

    private func setupBackgroundColor(_ color: UIColor?) {
        backgroundColor = color
    }
}

// MARK: - Extension

extension ChampionTierTableViewCell: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        positionTapBar.updateIndicatorViewLeadingConstraints(
            leading: scrollView.contentOffset.x / 5
        )
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

extension ChampionTierTableViewCell: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell: ChampionTierCollectionViewCell = collectionView.dequeueReusableCell(
            for: indexPath
        )
        
        switch indexPath.row {
        case 0:
            cell.setupChampionImages(
                first: UIImage(named: "Teemo"),
                second: UIImage(named: "Janna"),
                third: UIImage(named: "Soraka"),
                fourth: UIImage(named: "Zilean"),
                fifth: UIImage(named: "Vayne")
            )
        case 1:
            cell.setupChampionImages(
                first: UIImage(named: "Blitzcrank"),
                second: UIImage(named: "Ezreal"),
                third: UIImage(named: "Shen"),
                fourth: UIImage(named: "Aphelios"),
                fifth: UIImage(named: "Braum")
            )
        case 2:
            cell.setupChampionImages(
                first: UIImage(named: "Riven"),
                second: UIImage(named: "Nidalee"),
                third: UIImage(named: "Khazix"),
                fourth: UIImage(named: "Karma"),
                fifth: UIImage(named: "Evelynn")
            )
        case 3:
            cell.setupChampionImages(
                first: UIImage(named: "Heimerdinger"),
                second: UIImage(named: "Bard"),
                third: UIImage(named: "Renata"),
                fourth: UIImage(named: "Gangplank"),
                fifth: UIImage(named: "Graves")
            )
        case 4:
            cell.setupChampionImages(
                first: UIImage(named: "Belveth"),
                second: UIImage(named: "Nasus"),
                third: UIImage(named: "Camille"),
                fourth: UIImage(named: "Shaco"),
                fifth: UIImage(named: "Volibear")
            )
        default:
            cell.setupChampionImages(
                first: UIImage(named: "Heimerdinger"),
                second: UIImage(named: "Bard"),
                third: UIImage(named: "Renata"),
                fourth: UIImage(named: "Gangplank"),
                fifth: UIImage(named: "Graves")
            )
        }
        
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        
        return 5
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
    static let primitiveColor = UIColor(named: "PrimitiveColor")
}
