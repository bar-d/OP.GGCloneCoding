//
//  SettingsViewController.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/20.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    // MARK: Properties

    private let tableView = SettingsTableView()

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupBackgroundColor()
        setupSubviews()
        setupConstraints()
    }

    // MARK: - Methods

    private func setupBackgroundColor() {
        view.backgroundColor = Design.backgroundColor
    }

    private func setupSubviews() {
        view.addSubview(tableView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}


// MARK: - Namespace

private enum Design {
    static let backgroundColor = UIColor(named: "PrimitiveColor")
}
