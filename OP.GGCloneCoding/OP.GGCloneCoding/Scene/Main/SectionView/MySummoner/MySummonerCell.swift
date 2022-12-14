//
//  MySummonerCell.swift
//  OP.GGCloneCoding
//
//  Created by λ°λ, μκΏ on 2022/10/24.
//

import UIKit

final class MySummonerCell: UITableViewCell {

    // MARK: Properties

    private let emptyView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private let unselectedSummonerView = UnselectedSummonerView()
    private let selectedSummoenrView = SelectedSummonerView()

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

    func setupUnselectedSummonerViewDelegate(_ delegate: UnselectedSummonerViewDelegate) {
        unselectedSummonerView.setupUnselectedSummonerViewDelegate(delegate)
    }

    func setupSummonerDescriptionViewDelegate(
        _ delegate: SummonerDescriptionViewDelegate
    ) {
        selectedSummoenrView.setupSummonerDescriptionViewDelegate(delegate)
    }

    func setupSummonerDetailViewDelegate(_ delegate: SummonerDetailViewDelegate) {
        selectedSummoenrView.setupSummonerDetailViewDelegate(delegate)
    }
    
    func setupSelectedSummonerViewDelegate(_ delegate: SelectedSummonerViewDelegate) {
        selectedSummoenrView.setupSelectedSummonerViewDelegate(delegate)
    }

    private func commonInit() {
        setupContentViewUserInteractionEnabled(false)
        setupSubviews()
        setupConstraints()
        setupBackgroundColor(Design.cellBackgroundColor)
        setupSelectionStyle(.none)
        checkSummonerRegistrationForHidingView()
    }

    private func checkSummonerRegistrationForHidingView() {
        guard UserDefaults.standard.bool(forKey: Design.userDefaultsKey) else {
            setupUnselectedSummonerViewHidden(false)
            setupSelectedSummonerViewHidden(true)

            return
        }

        setupUnselectedSummonerViewHidden(true)
        setupSelectedSummonerViewHidden(false)
    }

    private func setupContentViewUserInteractionEnabled(_ bool: Bool) {
        contentView.isUserInteractionEnabled = bool
    }

    private func setupSubviews() {
        [emptyView]
            .forEach { addSubview($0) }
        [unselectedSummonerView, selectedSummoenrView]
            .forEach { emptyView.addSubview($0) }
    }

    private func setupConstraints() {
        setupEmptyViewConstraints()
        setupUnselectedSummonerViewConstraints()
        setupSelectedSummonerViewConstraints()
    }

    private func setupEmptyViewConstraints() {
        NSLayoutConstraint.activate([
            emptyView.topAnchor.constraint(equalTo: topAnchor),
            emptyView.bottomAnchor.constraint(equalTo: bottomAnchor),
            emptyView.leadingAnchor.constraint(equalTo: leadingAnchor),
            emptyView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    private func setupUnselectedSummonerViewConstraints() {
        NSLayoutConstraint.activate([
            unselectedSummonerView.topAnchor.constraint(
                equalTo: emptyView.topAnchor
            ),
            unselectedSummonerView.bottomAnchor.constraint(
                equalTo: emptyView.bottomAnchor
            ),
            unselectedSummonerView.leadingAnchor.constraint(
                equalTo: emptyView.leadingAnchor
            ),
            unselectedSummonerView.trailingAnchor.constraint(
                equalTo: emptyView.trailingAnchor
            )
        ])
    }

    private func setupSelectedSummonerViewConstraints() {
        NSLayoutConstraint.activate([
            selectedSummoenrView.topAnchor.constraint(equalTo: emptyView.topAnchor),
            selectedSummoenrView.bottomAnchor.constraint(
                equalTo: emptyView.bottomAnchor
            ),
            selectedSummoenrView.leadingAnchor.constraint(
                equalTo: emptyView.leadingAnchor
            ),
            selectedSummoenrView.trailingAnchor.constraint(
                equalTo: emptyView.trailingAnchor
            )
        ])
    }

    private func setupBackgroundColor(_ color: UIColor?) {
        backgroundColor = color
    }

    private func setupSelectionStyle(_ style: UITableViewCell.SelectionStyle) {
        selectionStyle = style
    }

    private func setupUnselectedSummonerViewHidden(_ bool: Bool) {
        unselectedSummonerView.isHidden = bool
    }

    private func setupSelectedSummonerViewHidden(_ bool: Bool) {
        selectedSummoenrView.isHidden = bool
    }
}

// MARK: - Namespace

private enum Design {
    static let descriptionLabelText = "μνμ¬λ₯Ό κ²μν΄μ λ±λ‘ν΄μ£ΌμΈμ!\nλμ μ μ μ λΆμν΄ λμμ μ€λλ€."
    static let summonerRegisterButtonTitle = "μνμ¬ λ±λ‘νκΈ°"
    static let cellBackgroundColor = UIColor(named: "PrimitiveColor")
    static let userDefaultsKey = "DidSummonerSelected"
}
