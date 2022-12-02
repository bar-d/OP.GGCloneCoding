//
//  SummonerRegisterView.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/01.
//

import UIKit

final class SummonerRegisterView: UIView {

    // MARK: Properties

    private lazy var viewModel = SummonerSearchViewModel(output: .init(
        fetchSummonerRankInformation: fetchSummonerRankInformation(encryptedID:),
        fetchSummonerMatchListInformation: fetchSummonerMatchListInformation(puuid:),
        showErrorAlert: showErrorAlert
    ))

    private weak var summonerRegisterViewDelegate: SummonerRegisterViewDelegate?

    private let summonerRegisterTopView = SummonerRegisterTopView()

    private let logoImageView = ImageViewBuilder()
        .setupConstraintsAutomatic(false)
        .setupImage(image: Design.iconImage)
        .setupContentMode(.scaleAspectFill)
        .setupLayer(cornerRadius: 20)
        .build()

    private let descriptionLabel = LabelBuilder()
        .setupMainCellDescriptionLabel(text: Design.descriptionLabelText)
        .setupLabelTextAttributes(numberOfLines: 2, font: .title3)
        .build()

    private let textFieldLayer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 4

        return view
    }()

    private let searchTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = Design.summonerID
        textField.clearButtonMode = .whileEditing

        return textField
    }()

    private let completeButton = ButtonBuilder()
        .setupConstraintsAutomatic(false)
        .setupTitle(name: Design.completeButtonText)
        .setupColor(background: .gray)
        .setupLayer(cornerRadius: 4)
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

    func setupSummonerRegisterTopViewDelegate(
        _ delegate: SummonerRegisterTopViewDelegate
    ) {
        summonerRegisterTopView.setupSummonerRegisterTopViewDelegate(delegate)
    }

    func setupSummonerRegisterViewDelegate(_ delegate: SummonerRegisterViewDelegate) {
        summonerRegisterViewDelegate = delegate
    }

    private func fetchSummonerRankInformation(encryptedID: String) {
        summonerRegisterViewDelegate?.fetchSummonerRankInformation(
            encryptedID: encryptedID
        )
    }

    private func fetchSummonerMatchListInformation(puuid: String) {
        summonerRegisterViewDelegate?.fetchSummonerMatchListInformation(puuid: puuid)
    }

    private func showErrorAlert(from alert: UIAlertController) {
        summonerRegisterViewDelegate?.showAlert(from: alert)
    }

    private func commonInit() {
        setupConstraintsAutomatic(false)
        setupSubviews()
        setupConstraints()
        setupSearchTextField()
        setupCompletionButton()
    }

    private func setupConstraintsAutomatic(_ bool: Bool) {
        translatesAutoresizingMaskIntoConstraints = bool
    }

    private func setupSubviews() {
        [summonerRegisterTopView, logoImageView, textFieldLayer,
         descriptionLabel, searchTextField, completeButton]
            .forEach { addSubview($0) }
    }

    private func setupConstraints() {
        setupSummonerRegisterTopViewConstraints()
        setupLogoImageViewConstraints()
        setupDescriptionLabelConstraints()
        setupTextFieldLayerConstraints()
        setupSearchTextFieldConstraints()
        setupCompleteButtonConstraints()
    }

    private func setupSummonerRegisterTopViewConstraints() {
        NSLayoutConstraint.activate([
            summonerRegisterTopView.topAnchor.constraint(equalTo: topAnchor),
            summonerRegisterTopView.leadingAnchor.constraint(equalTo: leadingAnchor),
            summonerRegisterTopView.trailingAnchor.constraint(equalTo: trailingAnchor),
            summonerRegisterTopView.heightAnchor.constraint(equalToConstant: 20)
        ])
    }

    private func setupLogoImageViewConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/5),
            logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor),
            logoImageView.topAnchor.constraint(
                equalTo: summonerRegisterTopView.bottomAnchor,
                constant: 40
            ),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
    }

    private func setupDescriptionLabelConstraints() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(
                equalTo: logoImageView.bottomAnchor,
                constant: 8
            ),
            descriptionLabel.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 20
            ),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }

    private func setupTextFieldLayerConstraints() {
        NSLayoutConstraint.activate([
            textFieldLayer.topAnchor.constraint(
                equalTo: descriptionLabel.bottomAnchor,
                constant: 20
            ),
            textFieldLayer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            textFieldLayer.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -20
            ),
            textFieldLayer.heightAnchor.constraint(
                equalTo: summonerRegisterTopView.heightAnchor,
                multiplier: 2
            )
        ])
    }

    private func setupSearchTextFieldConstraints() {
        NSLayoutConstraint.activate([
            searchTextField.centerXAnchor.constraint(
                equalTo: textFieldLayer.centerXAnchor
            ),
            searchTextField.centerYAnchor.constraint(
                equalTo: textFieldLayer.centerYAnchor
            ),
            searchTextField.leadingAnchor.constraint(
                equalTo: textFieldLayer.leadingAnchor,
                constant: 8
            ),
            searchTextField.trailingAnchor.constraint(
                equalTo: textFieldLayer.trailingAnchor,
                constant: -8
            )
        ])
    }

    private func setupCompleteButtonConstraints() {
        NSLayoutConstraint.activate([
            completeButton.topAnchor.constraint(
                equalTo: textFieldLayer.bottomAnchor,
                constant: 8
            ),
            completeButton.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 20
            ),
            completeButton.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -20
            ),
            completeButton.heightAnchor.constraint(equalTo: textFieldLayer.heightAnchor)
        ])
    }

    private func setupSearchTextField() {
        searchTextField.addTarget(
            self,
            action: #selector(didSearchTextFieldChanged),
            for: .editingChanged
        )
    }

    private func setupCompletionButton() {
        completeButton.addTarget(
            self,
            action: #selector(didTapCompleteButton),
            for: .touchUpInside
        )
    }

    @objc private func didTapCompleteButton() {
        guard let text = searchTextField.text else {
            return
        }

        viewModel.input.completeButtonDidTap(text)
    }

    @objc private func didSearchTextFieldChanged(_ sender: UITextField) {
        if sender.text?.isEmpty == true {
            completeButton.backgroundColor = .gray
        } else {
            completeButton.backgroundColor = .systemBlue
        }
    }
}

// MARK: - Namespace

private enum Design {
    static let iconImage = UIImage(named: "OP.GGIcon")
    static let descriptionLabelText = "소환사를 검색해서 등록해주세요!\n나의 전적을 분석해 도움을 줍니다."
    static let summonerID = "소환사 아이디"
    static let completeButtonText = "완료"
}
