//
//  SettingsViewController.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/20.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    // MARK: Properties
    
    private let stickyHeaderView = SettingsStickyHeaderView()
    private let tableView = SettingsTableView()
    private let headerView = HeaderViewBuilder()
        .setupSettingHeaderView()
        .build()
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        
        return scrollView
    }()
    
    private var stickyHeaderviewTopConstraint = NSLayoutConstraint()
    private var tableViewHeightConstraint = NSLayoutConstraint()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        tableViewHeightConstraint.constant = tableView.contentSize.height
    }
    
    // MARK: - Methods
    
    private func setupUI() {
        setupSubviews()
        //        setupConstraintsAutomatic(false)
        setupConstraints()
        setupScrollViewContentInset()
        setupBackgroundColor()
        setupDelegate()
    }
    
    private func setupSubviews() {
        [scrollView, stickyHeaderView, headerView]
            .forEach { view.addSubview($0) }
        [tableView]
            .forEach { scrollView.addSubview($0) }
        //        view.addSubview(scrollView)
        //        view.addSubview(stickyHeaderView)
        //        view.addSubview(headerView)
        //        scrollView.addSubview(tableView)
    }
    
    //    private func setupConstraintsAutomatic(_ bool: Bool) {
    //        stickyHeaderView.translatesAutoresizingMaskIntoConstraints = bool 이미 스티키 헤더뷰에 구현되어있음
    //        headerView.translatesAutoresizingMaskIntoConstraints = bool 다른 빌더도 다 구현되어 있어서 걍 구현해줌
    //        scrollView.translatesAutoresizingMaskIntoConstraints = bool 애도 위에 되이씀
    //    }
    
    private func setupConstraints() {
        setupHeaderViewConstraints()
        setupStickyHeaderViewConstraints()
        setupSettingsScrollViewConstraints()
        setupSettingsTableViewConstraints()
    }
    
    private func setupHeaderViewConstraints() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: Design.headerMinHeight)
        ])
    }
    
    private func setupStickyHeaderViewConstraints() {
        stickyHeaderviewTopConstraint = stickyHeaderView.topAnchor.constraint(equalTo: view.topAnchor)
        
        NSLayoutConstraint.activate([
            stickyHeaderviewTopConstraint,
            stickyHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stickyHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stickyHeaderView.heightAnchor.constraint(equalToConstant: Design.headerMaxHeight)
        ])
    }
    
    private func setupSettingsScrollViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: Design.headerMinHeight),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupSettingsTableViewConstraints() {
        tableViewHeightConstraint = tableView.heightAnchor.constraint(equalToConstant: .zero)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            tableView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            tableViewHeightConstraint
        ])
    }
    
    private func setupScrollViewContentInset() {
        scrollView.contentInset = Design.scrollViewContentInsets
    }
    
    private func setupBackgroundColor() {
        view.backgroundColor = Design.secondaryColor
        scrollView.backgroundColor = Design.secondaryColor
    }
    
    private func setupDelegate() {
        scrollView.delegate = self
    }
}

// MARK: - Extension

extension SettingsViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateStickyHeaderView()
        updateHeaderView()
    }
    
    private func updateStickyHeaderView() {
        stickyHeaderviewTopConstraint.constant = -calculateHeaderConstant()
    }
    
    private func updateHeaderView() {
        headerView.changeTitleLabelAlpha(with: calculateHeaderConstant() / Design.headerMinHeight)
    }
    
    private func calculateHeaderConstant() -> CGFloat {
        var headerConstant = scrollView.contentOffset.y + Design.headerMaxHeight - Design.headerMinHeight
        headerConstant = headerConstant < 0 ? 0 : headerConstant
        headerConstant = headerConstant > Design.headerMinHeight ? Design.headerMinHeight : headerConstant
        
        return headerConstant
    }
}

// MARK: - Namespace

private enum Design {
    static let secondaryColor = UIColor(named: "SecondaryColor")
    static let scrollViewContentInsets = UIEdgeInsets(top: headerMaxHeight - headerMinHeight,
                                                      left: 0,
                                                      bottom: -(headerMaxHeight - headerMinHeight),
                                                      right: 0)
    static let headerMaxHeight: CGFloat = 150
    static let headerMinHeight: CGFloat = 100
}
