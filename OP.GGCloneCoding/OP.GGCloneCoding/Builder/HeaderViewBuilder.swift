//
//  HeaderViewBuilder.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/24.
//

import SwiftUI

final class HeaderViewBuilder {
    
    // MARK: Properties

    private var headerView = HeaderView()

    // MARK: - Initizliers

    init() { }

    // MARK: - Methods

    func build() -> HeaderView {
        return headerView
    }

    func setupTitleLabel(with text: String) -> HeaderViewBuilder {
        headerView.setupTitleLabel(with: text)
        
        return self
    }
    
    func setupTitleLabelAlpha(with alpha: CGFloat) -> HeaderViewBuilder {
        headerView.changeTitleLabelAlpha(with: alpha)
        
        return self
    }
    
    func setupImage(with image: UIImage?, for section: NavigationBarButton) -> HeaderViewBuilder {
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
            .setupTitleLabel(with: "챔피언 분석")
        
        return builder
    }
    
    func setupCommunityHeaderView() -> HeaderViewBuilder {
        let builder = self
            .setupTitleLabel(with: "전체")
        
        return builder
    }
    
    func setupSettingHeaderView() -> HeaderViewBuilder {
        let builder = self
            .setupTitleLabel(with: "설정")
        
        return builder
    }
}

// MARK: - Preview

struct ButtonBuilder_Preview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let view = HeaderView()
            view.translatesAutoresizingMaskIntoConstraints = true
            view.changeTitleLabelAlpha(with: 1)
            
            return view
        }
        .previewLayout(.fixed(width: 400, height: 100))
    }
}
