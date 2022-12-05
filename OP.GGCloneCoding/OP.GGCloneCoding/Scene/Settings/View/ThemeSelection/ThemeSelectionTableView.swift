//
//  ThemeSelectionTableView.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/04.
//

import UIKit

final class ThemeSelectionTableView: UITableView {
    
    // MARK: Properties
    
    private let languageSelection = ["시스템 설정 사용", "라이트 모드", "다크 모드"]
    
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
        registerCell()
    }
    
    private func setupConstraintsAutomatic(_ bool: Bool) {
        translatesAutoresizingMaskIntoConstraints = bool
    }
    
    private func registerCell() {
        register(LanguageSelectionTableViewCell.self,
                 forCellReuseIdentifier: LanguageSelectionTableViewCell.identifier)
    }
}
