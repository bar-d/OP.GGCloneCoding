//
//  MostChampionView.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/10.
//

import SwiftUI

final class MostChampionView: UIView {
    
    // MARK: Properties
    
    private let titleLabel = LabelBuilder()
        .setupConstraintsAutomatic(false)
        .setupLabelText(text: "가장 잘하는\n챔피언은?")
        .setupLabelTextAttributes(numberOfLines: 2)
        .build()
    
    private let championImageView = ImageViewBuilder()
        .setupConstraintsAutomatic(false)
        .setupImage(image: UIImage(named: "OP.GGIcon"))
        .setupLayer(cornerRadius: 20)
        .build()
    
    private let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        
        return stackView
    }()
    
    private let championNameOrSummonerNameLabel = LabelBuilder()
        .setupConstraintsAutomatic(false)
        .setupLabelText(text: "바드")
        .build()
    
    private let additionalInformationLabel = LabelBuilder()
        .setupConstraintsAutomatic(false)
        .setupLabelText(text: "승률 100%", color: UIColor(named: "LanguageColor"))
        .build()
    
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
        setupLayer()
    }
    
    private func setupConstraintsAutomatic(_ bool: Bool) {
        translatesAutoresizingMaskIntoConstraints = bool
    }
    
    private func setupSubviews() {
        [championNameOrSummonerNameLabel, additionalInformationLabel]
            .forEach { labelStackView.addArrangedSubview($0) }
        [titleLabel, championImageView, labelStackView]
            .forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        setupTitleLabelConstraints()
        setupChampionImageViewConstraints()
        setupLabelStackViewConstraints()
    }
    
    private func setupMostChampionViewConstraints() {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalTo: heightAnchor)
        ])
    }
    
    private func setupTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12)
        ])
    }
    
    private func setupChampionImageViewConstraints() {
        NSLayoutConstraint.activate([
            championImageView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: -12
            ),
            championImageView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 12
            ),
            championImageView.heightAnchor.constraint(
                equalTo: heightAnchor,
                multiplier: 1/3
            ),
            championImageView.widthAnchor.constraint(
                equalTo: championImageView.heightAnchor
            )
        ])
    }
    
    private func setupLabelStackViewConstraints() {
        NSLayoutConstraint.activate([
            labelStackView.centerYAnchor.constraint(
                equalTo: championImageView.centerYAnchor
            ),
            labelStackView.leadingAnchor.constraint(
                equalTo: championImageView.trailingAnchor,
                constant: 8
            ),
            labelStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func setupLayer() {
        layer.cornerRadius = 10
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 2
    }
}

// MARK: - Preview

struct MostChampionView_Preview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let view = MostChampionView()
            view.translatesAutoresizingMaskIntoConstraints = true
            
            return view
        }
        .previewLayout(.fixed(width: 200, height: 150))
    }
}

