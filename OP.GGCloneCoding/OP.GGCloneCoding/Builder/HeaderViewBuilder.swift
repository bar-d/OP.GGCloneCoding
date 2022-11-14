//
//  HeaderViewBuilder.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/24.
//

import UIKit

final class HeaderViewBuilder {
    
    // MARK: Properties
    
    private var headerView = HeaderView()
    
    // MARK: - Initizliers
    
    init() { }
    
    // MARK: - Methods
    
    func build() -> HeaderView {
        return headerView
    }
    
    func setupConstraintsAutomatic(_ bool: Bool) -> HeaderViewBuilder {
        headerView.translatesAutoresizingMaskIntoConstraints = bool
        
        return self
    }
    
    func setupTitleLabel(with text: String) -> HeaderViewBuilder {
        headerView.setupTitleLabel(with: text)
        
        return self
    }
    
    func setupTitleLabelAlpha(with alpha: CGFloat) -> HeaderViewBuilder {
        headerView.changeTitleLabelAlpha(with: alpha)
        
        return self
    }
    
    func setupImage(
        with image: UIImage?,
        for section: HeaderViewButton
    ) -> HeaderViewBuilder {
        switch section {
        case .firstLeftButton:
            headerView.setupFirstLeftButtonImage(with: image)
        case .secondLeftButton:
            headerView.setupSecondLeftButtonImage(with: image)
        case .firstRightButton:
            headerView.setupFirstRightButtonImage(with: image)
        case .secondRightButton:
            headerView.setupSecondRightButtonImage(with: image)
        }
        
        return self
    }
}

// MARK: - Extension

extension HeaderViewBuilder {
    func setupChampionHeaderView() -> HeaderViewBuilder {
        let builder = self
            .setupConstraintsAutomatic(false)
            .setupTitleLabel(with: "챔피언 분석")
        
        return builder
    }
    
    func setupCommunityHeaderView() -> HeaderViewBuilder {
        let builder = self
            .setupConstraintsAutomatic(false)
            .setupTitleLabel(with: "전체")
        
        return builder
    }
    
    func setupSettingHeaderView() -> HeaderViewBuilder {
        let builder = self
            .setupConstraintsAutomatic(false)
            .setupTitleLabel(with: "설정")
        
        return builder
    }
}
