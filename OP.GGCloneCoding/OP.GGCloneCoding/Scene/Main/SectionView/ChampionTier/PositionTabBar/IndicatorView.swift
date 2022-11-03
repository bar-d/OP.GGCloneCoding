//
//  IndicatorView.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/01.
//

import UIKit

final class IndicatorView: UIView {
    
    // MARK: Properties
    
    private let highlightedIndicatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .label
        
        return view
    }()
    
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
        addSubview(highlightedIndicatorView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            highlightedIndicatorView.topAnchor.constraint(equalTo: topAnchor),
            highlightedIndicatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
            highlightedIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
            highlightedIndicatorView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/3)
        ])
    }
}
