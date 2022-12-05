//
//  SettingsTableView.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/20.
//

import UIKit

final class SettingsTableView: UITableView {
    
    // MARK: Initializer
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: .grouped)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    // MARK: - Methods
    
    private func commonInit() {
        setupConstraintsAutomatic(false)
        setupScrollable(false)
        setupSectionHeight(header: 4, footer: 4)
        setupContentInset(Design.tableViewEdgeInsets)
        setupBackgroundColor()
        setupScrollIndicatorVisible(false)
    }
    
    private func setupConstraintsAutomatic(_ bool: Bool) {
        translatesAutoresizingMaskIntoConstraints = bool
    }
    
    private func setupScrollable(_ bool: Bool) {
        isScrollEnabled = bool
    }
    
    private func setupSectionHeight(header: CGFloat, footer: CGFloat) {
        sectionHeaderHeight = header
        sectionFooterHeight = footer
    }
    
    private func setupContentInset(_ insets: UIEdgeInsets) {
        contentInset = insets
    }
    
    private func setupBackgroundColor() {
        backgroundColor = Design.primitiveColor
    }
    
    private func setupScrollIndicatorVisible(_ bool: Bool) {
        showsVerticalScrollIndicator = bool
    }
}

// MARK: - Namespace

private enum Design {
    static let primitiveColor = UIColor(named: "PrimitiveColor")
    static let tableViewEdgeInsets = UIEdgeInsets(top: -40, left: 0, bottom: 0, right: 0)
}
