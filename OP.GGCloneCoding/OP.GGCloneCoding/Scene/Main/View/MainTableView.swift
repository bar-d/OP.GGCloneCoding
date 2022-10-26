//
//  MainTableView.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/25.
//

import UIKit

final class MainTableView: UITableView {
    
    // MARK: Properties
    
    let mainList: [MainSection] = [
        .mySummoner, .favoriteSummoner,
        .patchNote, .championTier,
        .favoriteChampions, .todayTMI,
        .saleSkinsAndChampion, .additionalInformation,
        .anotherGame
    ]
    
    // MARK: - Initializers
    
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
        setupScrollable(true)
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
    
    private func setupCell(by section: MainSection, index: IndexPath) -> UITableViewCell {
        
        return section.cell
    }
}

// MARK: - Extension

extension MainTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = mainList[indexPath.section]
        let cell = setupCell(by: section, index: indexPath)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return mainList.count
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

// MARK: - Namespace

private enum Design {
    static let primitiveColor = UIColor(named: "PrimitiveColor")
    static let languageColor = UIColor(named: "LanguageColor")
    static let tableViewEdgeInsets = UIEdgeInsets(top: -40, left: 0, bottom: 0, right: 0)
    static let bodyFont = UIFont.preferredFont(forTextStyle: .body)
}
