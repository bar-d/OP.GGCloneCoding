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
        for section: HeaderViewButtonType,
        tint: UIColor? = .none
    ) -> HeaderViewBuilder {
        switch section {
        case .firstLeftButton:
            headerView.setupFirstLeftButtonImage(with: image, tint: tint)
        case .secondLeftButton:
            headerView.setupSecondLeftButtonImage(with: image, tint: tint)
        case .firstRightButton:
            headerView.setupFirstRightButtonImage(with: image, tint: tint)
        case .secondRightButton:
            headerView.setupSecondRightButtonImage(with: image, tint: tint)
        }
        
        return self
    }
    
    func setupBackgroundColor(color: UIColor?) -> HeaderViewBuilder {
        headerView.backgroundColor = color
        
        return self
    }
    
    func activateTopBottomConstraints() -> HeaderViewBuilder {
        headerView.setupViewConstraints()
        
        return self
    }
    
    func activateTitleLabelConstraints() -> HeaderViewBuilder {
        headerView.setupTitleLabelConstraints()
        
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
            .activateTitleLabelConstraints()
        
        return builder
    }
}
