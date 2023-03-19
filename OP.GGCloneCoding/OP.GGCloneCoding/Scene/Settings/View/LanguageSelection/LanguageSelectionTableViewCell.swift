//
//  LanguageSelectionTableViewCell.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/03.
//

import UIKit

final class LanguageSelectionTableViewCell: UITableViewCell {
    
    typealias tableViewCellDelegate = LanguageSelectionTableViewCellDelegate
    
    // MARK: Properties
    
    private weak var languageSelectionTableViewCellDelegate: tableViewCellDelegate?
    
    private let languageLabel = LabelBuilder()
        .setupConstraintsAutomatic(false)
        .build()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    // MARK: - Methods
    
    func setupLanguageLabelText(_ text: String) {
        languageLabel.text = text
    }
    
    private func commonInit() {
        setupUserInteractionEnabled(false)
        setupSubviews()
        setupConstraints()
    }
    
    private func setupUserInteractionEnabled(_ bool: Bool) {
        contentView.isUserInteractionEnabled = bool
    }
    
    private func setupSubviews() {
        addSubview(languageLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            languageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            languageLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    /// 추후 구현 필요
    private func setupTarget() {
        
    }
}
