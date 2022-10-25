//
//  MySummonerCell.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/24.
//

import UIKit

final class MySummonerCell: UITableViewCell {

    // MARK: Properties
    
    private let emptySummonerView = ImageViewBuilder()
        .setupConstraintsAutomatic(false)
        .setupBackgroundColor(.red)
        .setupLayer(cornerRadius: 10, width: 1)
        .build()
    
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
    
    private let summonerRegisterButton = ButtonBuilder()
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
    }
    
    // MARK: - Methods
    
    private func commonInit() {
        setupSubviews()
        setupConstraints()
        setupBackgroundColor(Design.cellBackgroundColor)
        setupSelectionStyle(.none)
    }
    
    private func setupSubviews() {
        [emptySummonerView, descriptionLabel, summonerRegisterButton]
            .forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            emptySummonerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            emptySummonerView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            emptySummonerView.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -20),
            emptySummonerView.heightAnchor.constraint(equalToConstant: 100),
            emptySummonerView.widthAnchor.constraint(equalTo: widthAnchor, constant: -50),
            
            descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionLabel.widthAnchor.constraint(equalTo: widthAnchor, constant: -140),
            descriptionLabel.bottomAnchor.constraint(equalTo: summonerRegisterButton.topAnchor, constant: -20),
            descriptionLabel.heightAnchor.constraint(equalTo: summonerRegisterButton.heightAnchor, multiplier: 2),
            
            summonerRegisterButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            summonerRegisterButton.widthAnchor.constraint(equalTo: widthAnchor, constant: -40),
            summonerRegisterButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
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
    static let descriptionLabelText = "소환사를 검색해서 등록해주세요!\n나의 전적을 분석해 도움을 줍니다."
    static let descriptionLabelTextColor = UIColor(named: "IconColor")
    static let registerButtonTitle = "소환사 등록하기"
    static let registerButtonBackgroundColor = UIColor(named: "ButtonFontColor")
    static let cellBackgroundColor = UIColor(named: "PrimitiveColor")
}
