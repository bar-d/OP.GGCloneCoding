//
//  MainViewController.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/16.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: Properties
    
    private let topView = MainTopView()
    private let searchButton = SummonerSearchButton()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupSubviews()
        setupConstraints()
    }
    
    // MARK: - Methods
    
    private func setupUI() {
        view.backgroundColor = Design.backgroundColor
    }
    
    private func setupSubviews() {
        [topView, searchButton]
            .forEach { view.addSubview($0) }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            topView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            searchButton.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 20),
            searchButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            searchButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
}

// MARK: - Namespace

private enum Design {
    static let backgroundColor = UIColor(named: "PrimitiveColor")
}
