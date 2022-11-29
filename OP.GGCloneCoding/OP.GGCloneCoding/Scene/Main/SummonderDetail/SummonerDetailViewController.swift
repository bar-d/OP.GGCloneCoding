//
//  SummonerInformationViewController.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/08.
//

import SwiftUI

final class SummonerInformationViewController: UIViewController {
    
    // MARK: Properties
    
    private let stickyHeaderView = SummonerInformationStickyHeaderView()
    private let headerView = HeaderViewBuilder()
        .setupConstraintsAutomatic(false)
        .setupTitleLabel(with: "바드의협곡여행")
        .setupImage(
            with: UIImage(systemName: "chevron.left"),
            for: .firstLeftButton, tint: .label
        )
        .setupBackgroundColor(color: .clear)
        .activateTopBottomConstraints()
        .build()
    
    private let headerViewContainer: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "바드의협곡여행"
        label.textAlignment = .center
        label.backgroundColor = UIColor(named: "PrimitiveColor")
        label.alpha = 0
        
        return label
    }()
    
    private let summonerInformationTableView = SummonerInformationTableView()
    
    // MARK: - Initializers
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commonInit()
    }
    
    // MARK: - Methods
    
    private func commonInit() {
        setupSubviews()
        setupConstraints()
        setupDelegate()
        setupDataSource()
        setupSummonerInformationTableView()
        setupsummonerInformationTableViewFrame(view.bounds)
    }
    
    private func setupDelegate() {
        summonerInformationTableView.setupDelegate(self)
    }
    
    private func setupDataSource() {
        summonerInformationTableView.setupDataSource(self)
    }
    
    private func setupSubviews() {
        [summonerInformationTableView, headerViewContainer, headerView]
            .forEach { view.addSubview($0) }
    }
    
    private func setupConstraints() {
        setupHeaderViewConstraints()
        setupHeaderViewContainerConstraints()
    }
    
    private func setupHeaderViewConstraints() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupHeaderViewContainerConstraints() {
        NSLayoutConstraint.activate([
            headerViewContainer.centerXAnchor.constraint(
                equalTo: headerView.centerXAnchor
            ),
            headerViewContainer.centerYAnchor.constraint(
                equalTo: headerView.centerYAnchor
            ),
            headerViewContainer.topAnchor.constraint(equalTo: view.topAnchor),
            headerViewContainer.leadingAnchor.constraint(
                equalTo: headerView.leadingAnchor
            ),
            headerViewContainer.trailingAnchor.constraint(
                equalTo: headerView.trailingAnchor
            )
        ])
    }
    
    private func setupsummonerInformationTableViewFrame(_ frame: CGRect) {
        summonerInformationTableView.frame = frame
    }
    
    private func setupSummonerInformationTableView() {
        stickyHeaderView.frame = CGRect(
            x: 0,
            y: 0,
            width: view.frame.size.width,
            height: view.frame.size.height / 3
        )
        stickyHeaderView.setupImage(UIImage(named: "a"))
        
        summonerInformationTableView.tableHeaderView = stickyHeaderView
    }
}

// MARK: - Extension

extension SummonerInformationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 20
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = summonerInformationTableView.dequeueReusableCell(
            withIdentifier: SummonerInformationTableViewCell.identifier
        ) as? SummonerInformationTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int
    ) -> CGFloat {
        
        return CGFloat.leastNormalMagnitude
    }
}

extension SummonerInformationViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        stickyHeaderView.scroliviewDidScroll(scrollView, headerView: headerViewContainer)
    }
}

// MARK: - Preview

struct SummonerSearchViewController_Preview: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview {
            let view = SummonerInformationViewController()
            
            return view
        }
        .previewLayout(.fixed(width: 300, height: 550))
    }
}
