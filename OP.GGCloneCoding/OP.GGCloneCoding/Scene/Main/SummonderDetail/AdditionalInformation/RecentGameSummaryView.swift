//
//  RecentGameSummaryView.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/10.
//

import SwiftUI

final class RecentGameSummaryView: UIView {
    
    // MARK: Properties
    
    private let titleLabel = LabelBuilder()
        .setupConstraintsAutomatic(false)
        .setupLabelText(text: "최근 20경기\n요약 정보", color: .label)
        .setupLabelTextAttributes(numberOfLines: 2)
        .build()
    
    private let kdaRateLabel = LabelBuilder()
        .setupConstraintsAutomatic(false)
        .setupLabelText(text: " 2.87:1 ", color: .systemBackground)
        .setupLayer(cornerRadius: 4)
        .setupLayerBackgroundColor(UIColor(named: "LanguageColor"))
        .build()
    
    private let winRateLabel = LabelBuilder()
        .setupConstraintsAutomatic(false)
        .setupLabelText(text: "승률 45%", color: .label)
        .build()
    
    private let kdaLabel = LabelBuilder()
        .setupConstraintsAutomatic(false)
        .setupLabelText(text: "KDA 8.6 / 6.5 / 18.8", color: .label)
        .build()
    
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
        setupSubviews()
        setupConstraints()
        setupLayer()
    }
    
    private func setupConstraintsAutomatic(_ bool: Bool) {
        translatesAutoresizingMaskIntoConstraints = bool
    }
    
    private func setupSubviews() {
        [titleLabel, kdaRateLabel, winRateLabel, kdaLabel]
            .forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        setupRecentGameSummaryViewConstraints()
        setupLabelLeadingAnchorConstriants()
        setupLabelTopAnchorConstraints()
    }
    
    private func setupRecentGameSummaryViewConstraints() {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalTo: heightAnchor, multiplier: 4/3)
        ])
    }
    
    private func setupLabelLeadingAnchorConstriants() {
        [titleLabel, kdaRateLabel, winRateLabel, kdaLabel]
            .forEach {
                $0.leadingAnchor.constraint(
                    equalTo: leadingAnchor,
                    constant: 12
                ).isActive = true
            }
    }
    
    private func setupLabelTopAnchorConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            kdaRateLabel.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: 12
            ),
            winRateLabel.topAnchor.constraint(
                equalTo: kdaRateLabel.bottomAnchor,
                constant: 8
            ),
            kdaLabel.topAnchor.constraint(equalTo: winRateLabel.bottomAnchor, constant: 8)
        ])
    }
    
    private func setupLayer() {
        layer.cornerRadius = 10
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 2
    }
}

// MARK: - Preview

struct RecentGameSummaryView_Preview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let view = RecentGameSummaryView()
            view.translatesAutoresizingMaskIntoConstraints = true
            
            return view
        }
        .previewLayout(.fixed(width: 300, height: 250))
    }
}
