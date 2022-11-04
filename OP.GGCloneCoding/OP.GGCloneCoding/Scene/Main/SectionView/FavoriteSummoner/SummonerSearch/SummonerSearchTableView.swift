//
//  SummonerSearchTableView.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/01.
//

import UIKit

final class SummonerSearchTableView: UITableView {
    
    // MARK: Properties
    
    private let summonerSearchTableHeaderView = SummonerSearchTableHeaderView()
    
    // MARK: - Initializers
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    // MARK: - Methods
    
    private func commonInit() {
        setupConstraintsAutomatic(false)
        setupHeaderView()
        setupHeaderViewConstraints()
        setupCell()
        setupDelegate()
        setupDataSource()
    }
    
    private func setupConstraintsAutomatic(_ bool: Bool) {
        translatesAutoresizingMaskIntoConstraints = bool
    }
    
    private func setupHeaderView() {
        addSubview(summonerSearchTableHeaderView)
        tableHeaderView = summonerSearchTableHeaderView
    }
    
    private func setupHeaderViewConstraints() {
        tableHeaderView?.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: 50)
        
        NSLayoutConstraint.activate([
            summonerSearchTableHeaderView.heightAnchor.constraint(equalToConstant: 50),
            summonerSearchTableHeaderView.widthAnchor.constraint(equalTo: widthAnchor),
            summonerSearchTableHeaderView.centerXAnchor.constraint(equalTo: centerXAnchor),
            summonerSearchTableHeaderView.topAnchor.constraint(equalTo: topAnchor)
        ])
    }
    
    private func setupCell() {
        register(SummonerSearchTableViewCell.self,
                 forCellReuseIdentifier: SummonerSearchTableViewCell.identifier)
    }
    
    private func setupDelegate() {
        delegate = self
    }
    
    private func setupDataSource() {
        dataSource = self
    }
}

// MARK: - Extension

extension SummonerSearchTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = dequeueReusableCell(
            withIdentifier: SummonerSearchTableViewCell.identifier
        ) as? SummonerSearchTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
