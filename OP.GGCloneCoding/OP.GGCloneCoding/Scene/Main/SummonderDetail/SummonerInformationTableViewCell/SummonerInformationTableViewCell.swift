//
//  SummonerInformationTableViewCell.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/08.
//

import UIKit

final class SummonerInformationTableViewCell: UITableViewCell {
    
    // MARK: Properties
    
    private let summonerInformationLeftView = SummonerInformationLeftView()
    
    private let gameModeLabel = LabelBuilder()
        .setupConstraintsAutomatic(false)
        .setupLabelText(text: "무작위 총력전", color: .lightGray)
        .setupLabelTextAttributes(alignment: .right, font: .footnote)
        .build()
    
    private let playedTimeLabel = LabelBuilder()
        .setupConstraintsAutomatic(false)
        .setupLabelText(text: "19시간 전", color: .lightGray)
        .setupLabelTextAttributes(alignment: .right ,font: .footnote)
        .build()
    
    private let killingSpreeLabel = LabelBuilder()
        .setupConstraintsAutomatic(false)
        .setupLabelText(text: " Triple Kill ", color: Design.killingSpreeLabelTextColor)
        .setupLabelTextAttributes(font: .footnote)
        .setupLayer(cornerRadius: 4)
        .setupLayerBackgroundColor(Design.killingSpreeLabelLayerBackgroundColor)
        .build()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    // MARK: - Methods
    
    private func commonInit() {
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        [summonerInformationLeftView, gameModeLabel, playedTimeLabel, killingSpreeLabel]
            .forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        setupSummonerInformationLeftViewConstraints()
        setupGameModeLabelConstraints()
        setupPlayedTimeLabelConstraints()
        setupKillingSpreeLabelConstraints()
    }
    
    private func setupSummonerInformationLeftViewConstraints() {
        NSLayoutConstraint.activate([
            summonerInformationLeftView.topAnchor.constraint(equalTo: topAnchor),
            summonerInformationLeftView.leadingAnchor.constraint(equalTo: leadingAnchor),
            summonerInformationLeftView.bottomAnchor.constraint(equalTo: bottomAnchor),
            summonerInformationLeftView.widthAnchor.constraint(
                equalTo: widthAnchor, multiplier: 2/3
            )
        ])
    }
    
    private func setupGameModeLabelConstraints() {
        NSLayoutConstraint.activate([
            gameModeLabel.topAnchor.constraint(
                equalTo: summonerInformationLeftView.topAnchor,
                constant: 20
            ),
            gameModeLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -20
            )
        ])
    }
    
    private func setupPlayedTimeLabelConstraints() {
        NSLayoutConstraint.activate([
            playedTimeLabel.topAnchor.constraint(
                equalTo: gameModeLabel.bottomAnchor, constant: 4
            ),
            playedTimeLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -20
            )
        ])
    }
    
    private func setupKillingSpreeLabelConstraints() {
        NSLayoutConstraint.activate([
            killingSpreeLabel.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -20
            ),
            killingSpreeLabel.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -20
            )
        ])
    }
}

// MARK: - Namespace

private enum Design {
    static let killingSpreeLabelTextColor = UIColor(named: "KillFontColor")
    static let killingSpreeLabelLayerBackgroundColor = UIColor(
        named: "KillBackgroundColor"
    )
}
