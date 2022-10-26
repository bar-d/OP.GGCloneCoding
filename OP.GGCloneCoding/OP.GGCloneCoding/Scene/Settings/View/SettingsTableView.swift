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
        setupDelegate()
        setupDataSource()
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
    
    private func setupDelegate() {
        delegate = self
    }
    
    private func setupDataSource() {
        dataSource = self
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
    
    private func setupCell(by section: SettingSection?, index: IndexPath) -> CellCustomizable {
        let cell: CellCustomizable
        
        switch section {
        case .pushNotification:
            cell = PushNotificationCell()
        case .version:
            cell = SettingsCell(font: Design.bodyFont, color: Design.languageColor)
        default:
            cell = SettingsCell()
        }
        cell.setupContent(with: index)
        
        return cell
    }
}

// MARK: - Extension

extension SettingsTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = SettingSection(rawValue: section) else { return 0 }
        
        switch section {
        case .pushNotification:
            return 1
        default:
            return section.array.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = SettingSection(rawValue: indexPath.section)
        let cell = setupCell(by: section, index: indexPath)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return SettingSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 {
            return 190
        } else {
            return 60
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section != 1 {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}

// MARK: - Namespace

private enum Design {
    static let primitiveColor = UIColor(named: "PrimitiveColor")
    static let languageColor = UIColor(named: "LanguageColor")
    static let tableViewEdgeInsets = UIEdgeInsets(top: -40, left: 0, bottom: 0, right: 0)
    static let bodyFont = UIFont.preferredFont(forTextStyle: .body)
}
