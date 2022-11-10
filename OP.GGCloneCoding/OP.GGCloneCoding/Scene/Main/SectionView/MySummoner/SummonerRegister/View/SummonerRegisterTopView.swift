//
//  SummonerRegisterTopView.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/01.
//

import UIKit



final class SummonerRegisterTopView: UIView {
    
    // MARK: Properties
    
    private weak var summonerRegisterTopViewDelegate: SummonerRegisterTopViewDelegate?
    
    private let cancelButton = ButtonBuilder()
        .setupConstraintsAutomatic(false)
        .setupImage(image: Design.xMarkImage)
        .build()
    
    private let languageLabel = LabelBuilder()
        .setupConstraintsAutomatic(false)
        .setupLabelText(text: "KR", color: .gray)
        .setupLabelTextAttributes(alignment: .right)
        .build()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
        cancelButton.addTarget(self, action: #selector(cancelButtonDidTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    // MARK: -  Methods
    
    func setupSummonerRegisterTopViewDelegate(_ delegate: SummonerRegisterTopViewDelegate) {
        summonerRegisterTopViewDelegate = delegate
    }
    
    private func commonInit() {
        setupConstraintsAutomatic(false)
        setupSubviews()
        setupConstraints()
    }
    
    private func setupConstraintsAutomatic(_ bool: Bool) {
        translatesAutoresizingMaskIntoConstraints = bool
    }
    
    private func setupSubviews() {
        [cancelButton, languageLabel]
            .forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        setupCancelButtonConstraints()
        setupLanguageLabelConstraints()
    }
    
    private func setupCancelButtonConstraints() {
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            cancelButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
        ])
    }
    
    private func setupLanguageLabelConstraints() {
        NSLayoutConstraint.activate([
            languageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            languageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    @objc private func cancelButtonDidTapped() {
        summonerRegisterTopViewDelegate?.cancelButtonDidTapped()
    }
}

// MARK: - Namespace

private enum Design {
    static let xMarkImage = UIImage(systemName: "xmark")
}
