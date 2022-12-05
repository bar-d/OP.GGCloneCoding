//
//  GameResultView.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/08.
//

import UIKit

final class GameResultView: UIView {
    
    // MARK: Properties
    
    private let gameResultLabel = LabelBuilder()
        .setupConstraintsAutomatic(false)
        .setupLabelText(text: "승", color: .systemBackground)
        .build()
    
    private let separatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        
        return view
    }()
    
    private let gameDurationLabel = LabelBuilder()
        .setupConstraintsAutomatic(false)
        .setupLabelText(text: "21:01", color: .systemBackground)
        .setupLabelTextAttributes(font: .footnote)
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
        [gameResultLabel, separatorView, gameDurationLabel]
            .forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        setupGameResultLabelConstraints()
        setupSeparatorViewConstraints()
        setupGameDurationLabelConstraints()
    }
    
    private func setupGameResultLabelConstraints() {
        NSLayoutConstraint.activate([
            gameResultLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            gameResultLabel.bottomAnchor.constraint(
                equalTo: separatorView.topAnchor,
                constant: -8
            )
        ])
    }
    
    private func setupSeparatorViewConstraints() {
        NSLayoutConstraint.activate([
            separatorView.centerYAnchor.constraint(equalTo: centerYAnchor),
            separatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
            separatorView.widthAnchor.constraint(
                equalTo: gameResultLabel.widthAnchor,
                multiplier: 3/2
            ),
            separatorView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    private func setupGameDurationLabelConstraints() {
        NSLayoutConstraint.activate([
            gameDurationLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            gameDurationLabel.topAnchor.constraint(
                equalTo: separatorView.bottomAnchor,
                constant: 8
            )
        ])
    }
    
    private func setupBackgroundColor() {
        if gameResultLabel.text == "승" {
            backgroundColor = UIColor(named: "WinColor")
        } else {
            backgroundColor = UIColor(named: "LoseColor")
        }
    }
}
