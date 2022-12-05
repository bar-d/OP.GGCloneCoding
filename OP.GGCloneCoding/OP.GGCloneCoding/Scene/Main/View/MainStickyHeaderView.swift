//
//  MainStickyHeaderView.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/24.
//

import UIKit

final class MainStickyHeaderView: UIView {
    
    // MARK: Properties
    
    private let button = ButtonBuilder()
        .setupMainStickyHeaderViewSearchButton()
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
        setupBackgroundColor()
    }
    
    private func setupConstraintsAutomatic(_ bool: Bool) {
        translatesAutoresizingMaskIntoConstraints = bool
    }
    
    private func setupSubviews() {
        [button].forEach { addSubview($0) }
        addSubview(button)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    private func setupBackgroundColor() {
        backgroundColor = Design.backgroundColor
    }
}

// MARK: - Namespace

private enum Design {
    static let backgroundColor = UIColor(named: "SecondaryColor")
}
