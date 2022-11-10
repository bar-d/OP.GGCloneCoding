//
//  DetailView.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/09.
//

import UIKit

final class DetailView: UIView {
    
    // MARK: Properties
    
    private let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 4
        
        return stackView
    }()
    
    private let winRateLabel = LabelBuilder()
        .setupConstraintsAutomatic(false)
        .setupLabelText(text: "9승 11패 45%", color: .label)
        .setupLabelTextAttributes(font: .headline)
        .build()
    
    private let KDALabel = LabelBuilder()
        .setupConstraintsAutomatic(false)
        .setupLabelText(text: "KDA", color: .label)
        .setupLabelTextAttributes(font: .headline)
        .build()
    
    private let KDARateLabel = LabelBuilder()
        .setupConstraintsAutomatic(false)
        .setupLabelText(text: "2.74:1", color: .lightGray)
        .setupLabelTextAttributes(font: .headline)
        .build()
    
    private let championStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private let firstChampionRateView = ChampionRateView()
    private let secondChampionRateView = ChampionRateView()
    private let thirdChampionRateView = ChampionRateView()
    
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
        setupBackgroundColor(UIColor(named: "SecondaryColor"))
        setupCornerRadius(10)
    }
    
    private func setupConstraintsAutomatic(_ bool: Bool) {
        translatesAutoresizingMaskIntoConstraints = bool
    }
    
    private func setupSubviews() {
        [labelStackView, championStackView]
            .forEach { addSubview($0) }
        [winRateLabel, KDALabel, KDARateLabel]
            .forEach { labelStackView.addArrangedSubview($0) }
        [firstChampionRateView, secondChampionRateView, thirdChampionRateView]
            .forEach { championStackView.addArrangedSubview($0) }
    }
    
    private func setupConstraints() {
        setupLabelStackViewConstraints()
        setupChampionStackViewConstraints()
    }
    
    private func setupLabelStackViewConstraints() {
        NSLayoutConstraint.activate([
            labelStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            labelStackView.bottomAnchor.constraint(equalTo: championStackView.topAnchor, constant: -12)
        ])
    }
    
    private func setupChampionStackViewConstraints() {
        NSLayoutConstraint.activate([
            championStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            championStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            championStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            championStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            heightAnchor.constraint(equalTo: championStackView.heightAnchor, multiplier: 2)
        ])
    }
    
    private func setupBackgroundColor(_ color: UIColor?) {
        backgroundColor = color
    }
    
    private func setupCornerRadius(_ radius: CGFloat) {
        layer.cornerRadius = radius
    }
}
