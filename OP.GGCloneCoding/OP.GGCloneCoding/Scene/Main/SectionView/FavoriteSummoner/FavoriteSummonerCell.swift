//
//  FavoriteSummonersCell.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/24.
//

import UIKit

final class FavoriteSummonersCell: UITableViewCell {

    // MARK:  Properties
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Design.titleLabelText
        label.font = .preferredFont(forTextStyle: .title3)
        label.backgroundColor = .red
        
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = Design.descriptionLabelText
        label.numberOfLines = 2
        label.textColor = Design.descriptionLabelTextColor
        label.font = .preferredFont(forTextStyle: .footnote)
        label.backgroundColor = .orange
        
        return label
    }()
    
    private let summonerSearchButton = ButtonBuilder()
        .setupConstraintsAutomatic(false)
        .setupTitle(name: Design.registerButtonTitle, state: .normal, font: .footnote)
        .setupColor(background: Design.registerButtonBackgroundColor)
        .setupLayer(cornerRadius: 4, width: 1)
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
        setupBackgroundColor(Design.cellBackgroundColor)
        setupSelectionStyle(.none)
    }
    
    private func setupSubviews() {
        [titleLabel, descriptionLabel, summonerSearchButton]
            .forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            titleLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalToConstant: 100),
            titleLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -50),
            
            descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -140),
            descriptionLabel.bottomAnchor.constraint(equalTo: summonerSearchButton.topAnchor, constant: -20),
            descriptionLabel.heightAnchor.constraint(equalTo: summonerSearchButton.heightAnchor, multiplier: 2),
            
            summonerSearchButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            summonerSearchButton.widthAnchor.constraint(equalTo: widthAnchor, constant: -40),
            summonerSearchButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
    
    private func setupBackgroundColor(_ color: UIColor?) {
        backgroundColor = color
    }
    
    private func setupSelectionStyle(_ style: UITableViewCell.SelectionStyle) {
        selectionStyle = style
    }
}

// MARK: - Namespace

private enum Design {
    static let titleLabelText = "즐겨찾기한 소환사"
    static let descriptionLabelText = "⭐️ 즐겨찾기한 소환사가 없습니다.\n소환사를 검색한 후 등록해주세요!"
    static let descriptionLabelTextColor = UIColor(named: "IconColor")
    static let registerButtonTitle = "소환사 검색하기"
    static let registerButtonBackgroundColor = UIColor(named: "ButtonFontColor")
    static let cellBackgroundColor = UIColor(named: "PrimitiveColor")
}
