//
//  LanguageSelectionTableView.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/03.
//

import UIKit

final class LanguageSelectionTableView: UITableView {
    
    // MARK: Properties
    
    private let languageSelection = ["🇰🇷 한국어", "🇺🇸 English", "🇯🇵 日本語"]
    
    // MARK: - Initializers
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    // MARK: - Methods
    
    private func commonInit() {
        setupConstraintsAutomatic(false)
        setupDelegate()
        registerCell()
    }
    
    private func setupConstraintsAutomatic(_ bool: Bool) {
        translatesAutoresizingMaskIntoConstraints = bool
    }
    
    private func registerCell() {
        register(LanguageSelectionTableViewCell.self,
                 forCellReuseIdentifier: LanguageSelectionTableViewCell.identifier)
    }
    
    private func setupDelegate() {
        delegate = self
        dataSource = self
    }
}

// MARK: - Extension

extension LanguageSelectionTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = LanguageSelectionTableViewCell()
        cell.setupLanguageLabelText(languageSelection[indexPath.row])
        
        return cell
    }
}
