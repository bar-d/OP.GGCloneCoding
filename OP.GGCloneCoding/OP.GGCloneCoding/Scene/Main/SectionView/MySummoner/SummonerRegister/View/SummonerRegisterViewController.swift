//
//  SummonerRegisterViewController.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/01.
//

import UIKit

final class SummonerRegisterViewController: UIViewController {
    
    // MARK: Properties

    private lazy var summonerRankViewModel = SummonerRankViewModel(output: .init(
        showErrorAlert: showErrorAlert
    ))

    private lazy var summonerMatchListViewModel = SummonerMatchListViewModel(
        output: .init(
            fetchMatchInformation: fetchMatchInformation,
            showErrorAlert: showErrorAlert
        )
    )
    
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
        setupBackgroundColor(Design.backgroundColor ?? .systemBackground)
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
            summonerRegisterView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),
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

    private func dismissController() {
        dismiss(animated: true)
    }

    private func fetchMatchInformation() {

    }

    private func showErrorAlert(from alert: UIAlertController) {
        present(alert, animated: true)
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
        summonerRankViewModel.input.fetchSummonerRankInformation(encryptedID)
    }

    func fetchSummonerMatchListInformation(puuid: String) {
        summonerMatchListViewModel.input.fetchSummonerMatchListInformation(puuid)
    }

    func showAlert(from alert: UIAlertController) {
        present(alert, animated: true)
    }
}

// MARK: - Namespace

private enum Design {
    static let backgroundColor = UIColor(named: "PrimitiveColor")
}
