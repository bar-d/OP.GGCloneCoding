//
//  SelectedSummonerView.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/09.
//

import UIKit

final class SelectedSummonerView: UIView {

    // MARK: Properties

    private weak var summonerDetailViewDelegate: SummonerDetailViewDelegate?
    private weak var selectedSummonerViewDelegate: SelectedSummonerViewDelegate?
    

    private let totalStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 12

        return stackView
    }()

    private let summonerDescriptionView = SummonerDescriptionView()
    private let detailView = DetailView()

    private let detailButton = ButtonBuilder()
        .setupTitle(name: Design.detailButtonTitle, color: .systemBackground)
        .setupLayer(cornerRadius: 10)
        .setupColor(background: .systemBlue)
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

    func setupSummonerDescriptionViewDelegate(_ delegate: SummonerDescriptionViewDelegate) {
        summonerDescriptionView.setupSummonerDescriptionViewDelegate(delegate)
    }

    func setupSummonerDetailViewDelegate(_ delegate: SummonerDetailViewDelegate) {
        summonerDetailViewDelegate = delegate
    }
    
    func setupSelectedSummonerViewDelegate(_ delegate: SelectedSummonerViewDelegate) {
        selectedSummonerViewDelegate = delegate
    }

    private func commonInit() {
        setupConstraintsAutomatic(false)
        setupSubviews()
        setupConstraints()
        setupChampionIconFetcherDelegate()
        setupDetailButton()
    }

    private func setupConstraintsAutomatic(_ bool: Bool) {
        translatesAutoresizingMaskIntoConstraints = bool
    }

    private func setupSubviews() {
        [totalStackView]
            .forEach { addSubview($0) }
        [summonerDescriptionView, detailView, detailButton]
            .forEach { totalStackView.addArrangedSubview($0) }
    }

    private func setupConstraints() {
        setupTotalStackViewConstraints()
        setupDetailButtonConstraints()
    }

    private func setupTotalStackViewConstraints() {
        NSLayoutConstraint.activate([
            totalStackView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            totalStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            totalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            totalStackView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -20
            )
        ])
    }

    private func setupDetailButtonConstraints() {
        NSLayoutConstraint.activate([
            detailButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1/6),
            summonerDescriptionView.heightAnchor.constraint(
                equalTo: detailView.heightAnchor,
                multiplier: 1
            )
        ])
    }

    private func setupChampionIconFetcherDelegate() {
        summonerDescriptionView.setupChampionIconFetcherDelegate(detailView)
    }
    
    private func setupDetailButton() {
        detailButton.addTarget(
            self,
            action: #selector(detailButtonDidTapped(_ :)),
            for: .touchUpInside
        )
    }
    
    @objc private func detailButtonDidTapped(_ sender: UIButton) {
        selectedSummonerViewDelegate?.detailButtonDidTapped()
    }
}

// MARK: - Namespace

private enum Design {
    static let detailButtonTitle = "자세히 보기"
}
