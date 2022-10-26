//
//  MainViewController.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/16.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: Properties
    
    private let mainTopView = MainTopView()
    private let mainStickyHeaderView = MainStickyHeaderView()
    private let mainTableView = MainTableView()
    private let mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.refreshControl = UIRefreshControl()

        return scrollView
    }()

    private var mainStickyHeaderviewTopConstraint = NSLayoutConstraint()
    private var mainTableViewHeightConstraint = NSLayoutConstraint()

    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        mainTableViewHeightConstraint.constant = mainTableView.contentSize.height
    }
    
    // MARK: - Methods
    
    private func setupUI() {
        setupSubviews()
        setupConstraintsAutomatic(false)
        setupConstraints()
        setupScrollViewContentInset()
        setupBackgroundColor()
        setupDelegate()
    }
    
    private func setupSubviews() {
        [mainStickyHeaderView, mainTopView, mainScrollView]
            .forEach { view.addSubview($0) }
        [mainTableView]
            .forEach { mainScrollView.addSubview($0) }
    }
    
    private func setupConstraintsAutomatic(_ bool: Bool) {
        mainScrollView.translatesAutoresizingMaskIntoConstraints = bool
    }
    
    private func setupConstraints() {
        setupMainTopViewConstraints()
        setupStickyHeaderViewConstraints()
        setupSettingsScrollViewConstraints()
        setupSettingsTableViewConstraints()
    }

    private func setupMainTopViewConstraints() {
        NSLayoutConstraint.activate([
            mainTopView.topAnchor.constraint(equalTo: view.topAnchor),
            mainTopView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainTopView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainTopView.heightAnchor.constraint(equalToConstant: Design.headerMinHeight)
        ])
    }

    private func setupStickyHeaderViewConstraints() {
        mainStickyHeaderviewTopConstraint = mainStickyHeaderView.topAnchor.constraint(equalTo: view.topAnchor)

        NSLayoutConstraint.activate([
            mainStickyHeaderviewTopConstraint,
            mainStickyHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainStickyHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainStickyHeaderView.heightAnchor.constraint(equalToConstant: Design.headerMaxHeight)
        ])
    }

    private func setupSettingsScrollViewConstraints() {
        NSLayoutConstraint.activate([
            mainScrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: Design.headerMinHeight),
            mainScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    private func setupSettingsTableViewConstraints() {
        mainTableViewHeightConstraint = mainTableView.heightAnchor.constraint(equalToConstant: .zero)

        NSLayoutConstraint.activate([
            mainTableView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
            mainTableView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor),
            mainTableView.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor),
            mainTableView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor),
            mainTableViewHeightConstraint
        ])
    }
    
    private func setupScrollViewContentInset() {
        mainScrollView.contentInset = Design.scrollViewContentInsets
    }

    private func setupBackgroundColor() {
        view.backgroundColor = Design.backgroundColor
        mainTopView.backgroundColor = Design.secondaryColor
    }

    private func setupDelegate() {
        mainScrollView.delegate = self
    }
}

// MARK: - Extension

extension MainViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateStickyHeaderView()
    }

    private func updateStickyHeaderView() {
        mainStickyHeaderviewTopConstraint.constant = -calculateHeaderConstant()
    }

    private func calculateHeaderConstant() -> CGFloat {
        var headerConstant = mainScrollView.contentOffset.y + Design.headerMaxHeight - Design.headerMinHeight
        headerConstant = headerConstant < 0 ? 0 : headerConstant
        headerConstant = headerConstant > Design.headerMinHeight ? Design.headerMinHeight : headerConstant

        return headerConstant
    }
}

// MARK: - Namespace

private enum Design {
    static let backgroundColor = UIColor(named: "PrimitiveColor")
    static let secondaryColor = UIColor(named: "SecondaryColor")
    static let scrollViewContentInsets = UIEdgeInsets(top: headerMaxHeight - headerMinHeight + 7,
                                                      left: 0,
                                                      bottom: -(headerMaxHeight - headerMinHeight + 7),
                                                      right: 0)
    static let headerMaxHeight: CGFloat = 150
    static let headerMinHeight: CGFloat = 100
}
