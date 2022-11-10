//
//  SummonerRegisterViewController.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/01.
//

import UIKit

final class SummonerRegisterViewController: UIViewController {
    
    // MARK: Properties
    
    private let summonerRegisterView = SummonerRegisterView()

    // MARK: - Initializers
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupUI()
    }
    
    // MARK: - Methods

    func setupUI() {
        setupSubviews()
        setupConstraints()
        setupModalPresentationStyle(.fullScreen)
        setupBackgroundColor(UIColor(named: "PrimitiveColor") ?? .systemBackground)
        setupDelegate()
    }
    
    private func setupModalPresentationStyle(_ style: UIModalPresentationStyle) {
        modalPresentationStyle = style
    }
    
    private func setupSubviews() {
        view.addSubview(summonerRegisterView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            summonerRegisterView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            summonerRegisterView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            summonerRegisterView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            summonerRegisterView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupBackgroundColor(_ color: UIColor) {
        view.backgroundColor = color
    }

    private func setupDelegate() {
        summonerRegisterView.setupSummonerRegisterTopViewDelegate(self)
        summonerRegisterView.setupSummonerRegisterViewDelegate(self)
    }
}

// MARK: - Extension

extension SummonerRegisterViewController: SummonerRegisterTopViewDelegate {
    func cancelButtonDidTapped() {
        dismiss(animated: true)
    }
}

extension SummonerRegisterViewController: SummonerRegisterViewDelegate {
    func fetchSummonerRankInformation(encryptedID: String) {
        viewModel.input.fetchSummonerRankInformation(encryptedID)
    }
    
    func showAlert(from alert: UIAlertController) {
        present(alert, animated: true)
    }
}
