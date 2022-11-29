//
//  SummonerInformationTableView.swift
//  OP.GGCloneCoding
//
//  Created by bard on 2022/11/08.
//

import UIKit

final class SummonerInformationTableView: UITableView {
    
    // MARK: Initializers
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: .grouped)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    // MARK: - Mehtods
    
    func setupDelegate(_ delegate: UITableViewDelegate) {
        self.delegate = delegate
    }
    
    func setupDataSource(_ dataSource: UITableViewDataSource) {
        self.dataSource = dataSource
    }
    
    private func commonInit() {
        setupScrollIndicator()
        setupCell()
        setupSectionHeaderAndFooterHeight(header: 0, footer: 2)
    }
    
    private func setupConstraintsAutomatic(_ bool: Bool) {
        translatesAutoresizingMaskIntoConstraints = bool
    }
    
    private func setupScrollEnabled(_ bool: Bool) {
        isScrollEnabled = bool
    }
    
    private func setupScrollIndicator(vertical: Bool = false, horizontal: Bool = false) {
        showsVerticalScrollIndicator = vertical
        showsHorizontalScrollIndicator = horizontal
    }
    
    private func setupCell() {
        register(SummonerInformationTableViewCell.self,
                 forCellReuseIdentifier: SummonerInformationTableViewCell.identifier)
    }
    
    private func setupSectionHeaderAndFooterHeight(header: CGFloat, footer: CGFloat) {
        sectionHeaderHeight = header
        sectionFooterHeight = footer
    }
}
