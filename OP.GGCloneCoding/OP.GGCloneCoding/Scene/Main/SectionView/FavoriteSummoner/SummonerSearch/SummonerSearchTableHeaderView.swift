//
//  SummonerSearchTableHeaderView.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/01.
//

import UIKit

final class SummonerSearchTableHeaderView: UIView {
    
    // MARK: Properties
    
    private let recentSearchLabel = LabelBuilder()
        .setupConstraintsAutomatic(false)
        .setupLabelText(text: Design.recentSearchLabelText, color: .label)
        .setupLabelTextAttributes(alignment: .left)
        .build()
    
    private let deleteAllButton = ButtonBuilder()
        .setupConstraintsAutomatic(false)
        .setupTitle(name: Design.deleteAllButtonTitle, font: .footnote, color: .lightGray)
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
    }
    
    private func setupConstraintsAutomatic(_ bool: Bool) {
        translatesAutoresizingMaskIntoConstraints = bool
    }
    
    private func setupSubviews() {
        [recentSearchLabel, deleteAllButton]
            .forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        setupRecentSearchLabelConstraints()
        setupDeleteAllButtonContraints()
    }
    
    private func setupRecentSearchLabelConstraints() {
        NSLayoutConstraint.activate([
            recentSearchLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 20
            ),
            recentSearchLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func setupDeleteAllButtonContraints() {
        NSLayoutConstraint.activate([
            deleteAllButton.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -20
            ),
            deleteAllButton.heightAnchor.constraint(
                equalTo: recentSearchLabel.heightAnchor
            ),
            deleteAllButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

private enum Design {
    static let recentSearchLabelText = "최근 검색"
    static let deleteAllButtonTitle = "전체 삭제"
}
