//
//  SummonerAdditionalInformationView.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/10.
//

import SwiftUI

final class SummonerAdditionalInformationView: UIScrollView {
    
    // MARK: Properties
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 4
        
        return stackView
    }()
    
    private let recentGameSummaryView = RecentGameSummaryView()
    private let championInformationView = ChampionInformationView()
    private let playedWithView = ChampionInformationView()
    private let playedBestChampionView = MostChampionView()
    private let playedMostChampionView = MostChampionView()
    private let mostKillsView = SummonerAdditionalInformationView()
    private let mostDeathsView = SummonerAdditionalInformationView()
    private let mostAssistsView = SummonerAdditionalInformationView()
    
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
    }
    
    private func setupConstraintsAutomatic(_ bool: Bool) {
        translatesAutoresizingMaskIntoConstraints = bool
    }
    
    private func setupSubviews() {
        [recentGameSummaryView, championInformationView, playedWithView,
         playedBestChampionView, playedMostChampionView, mostKillsView, mostDeathsView,
         mostAssistsView]
            .forEach { stackView.addArrangedSubview($0) }
        [stackView]
            .forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

// MARK: - Preview

struct SummonerAdditionalInformationView_Preview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let view = SummonerAdditionalInformationView()
            view.translatesAutoresizingMaskIntoConstraints = true
            
            return view
        }
        .previewLayout(.fixed(width: 500, height: 330))
    }
}
