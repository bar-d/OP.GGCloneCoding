//
//  ThemeSelectionTableViewCell.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/04.
//

import UIKit

final class ThemeSelectionTableViewCell: UITableViewCell {
    
    // MARK: Properites
    
    private let themeLabel = LabelBuilder()
        .setupConstraintsAutomatic(false)
        .setupLabelText(text: "Theme")
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
    
    func setupThemeLabelText(_ text: String) {
        themeLabel.text = text
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
        addSubview(themeLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            themeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            themeLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    /// 추후 구현 필요
    private func setupTarget() {
        
    }
}
