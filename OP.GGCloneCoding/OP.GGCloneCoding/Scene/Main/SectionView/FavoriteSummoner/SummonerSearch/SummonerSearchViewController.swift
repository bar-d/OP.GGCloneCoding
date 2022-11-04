//
//  SummonerSearchViewController.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/01.
//

import UIKit

final class SummonerSearchViewController: UIViewController {
    
    // MARK: Properties
    
    private let summonerSearchTopView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let backwardButton = ButtonBuilder()
        .setupConstraintsAutomatic(false)
        .setupImage(image: Design.backwardButtonImage)
        .setupColor(tint: .label)
        .build()
    
    private let searchTextField = SearchTextField()
    
    private let cancelButton = ButtonBuilder()
        .setupConstraintsAutomatic(false)
        .setupTitle(name: Design.cancelButtonTitle, color: .label)
        .build()
    
    private let summonerSearchTableView = SummonerSearchTableView()
    
    private var cancelButtonTrailingConstraint = NSLayoutConstraint()
    private var summonerSearchTableViewWidthConstraint = NSLayoutConstraint()
    private var summonerSearchTopViewWidthConstraint = NSLayoutConstraint()
    
    // MARK: - View Life Cycle
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupUI()
    }
    
    // MARK: - Methods
    
    private func setupUI() {
        setupSubviews()
        setupConstraints()
        setupSearchTextFieldDelegate()
        setupPresentationStyle(style: .fullScreen)
        setupBackgroundColor(Design.backgroundColor)
        setupBackwardButton()
        setupCancelButton()
    }
    
    private func setupSubviews() {
        [summonerSearchTopView, summonerSearchTableView]
            .forEach { view.addSubview($0) }
        [backwardButton, searchTextField, cancelButton]
            .forEach { summonerSearchTopView.addSubview($0) }
    }
    
    private func setupConstraints() {
        setupSummonerSearchTopViewConstraints()
        setupBackwardButtonConstraints()
        setupSearchTextFieldConstraints()
        setupCancelButtonConstraints()
        setupSummonerSearchTableViewConstraints()
    }
    
    private func setupSummonerSearchTopViewConstraints() {
        summonerSearchTopViewWidthConstraint = summonerSearchTopView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 8/7)
        
        NSLayoutConstraint.activate([
            summonerSearchTopViewWidthConstraint,
            summonerSearchTopView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            summonerSearchTopView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            summonerSearchTopView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setupBackwardButtonConstraints() {
        NSLayoutConstraint.activate([
            backwardButton.leadingAnchor.constraint(equalTo: summonerSearchTopView.leadingAnchor),
            backwardButton.heightAnchor.constraint(equalTo: summonerSearchTopView.heightAnchor, multiplier: 1/2),
            backwardButton.widthAnchor.constraint(equalTo: backwardButton.heightAnchor),
            backwardButton.centerYAnchor.constraint(equalTo: summonerSearchTopView.centerYAnchor)
        ])
    }
    
    private func setupSearchTextFieldConstraints() {
        NSLayoutConstraint.activate([
            searchTextField.trailingAnchor.constraint(equalTo: cancelButton.leadingAnchor, constant: -8),
            searchTextField.leadingAnchor.constraint(equalTo: backwardButton.trailingAnchor, constant: 8),
            searchTextField.centerYAnchor.constraint(equalTo: summonerSearchTopView.centerYAnchor),
            searchTextField.heightAnchor.constraint(equalTo: backwardButton.heightAnchor)
        ])
    }
    
    private func setupCancelButtonConstraints() {
        NSLayoutConstraint.activate([
            cancelButton.trailingAnchor.constraint(equalTo: summonerSearchTopView.trailingAnchor),
            cancelButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/6),
            cancelButton.centerYAnchor.constraint(equalTo: summonerSearchTopView.centerYAnchor),
            cancelButton.topAnchor.constraint(equalTo: backwardButton.topAnchor),
            cancelButton.bottomAnchor.constraint(equalTo: backwardButton.bottomAnchor),
        ])
    }
    
    private func setupSummonerSearchTableViewConstraints() {
        NSLayoutConstraint.activate([
            summonerSearchTableView.topAnchor.constraint(equalTo: summonerSearchTopView.bottomAnchor),
            summonerSearchTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            summonerSearchTableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            summonerSearchTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupSearchTextFieldDelegate() {
        searchTextField.setupTextFieldDelegate(self)
    }
    
    private func setupPresentationStyle(style: UIModalPresentationStyle) {
        modalPresentationStyle = style
    }
    
    private func setupBackgroundColor(_ color: UIColor?) {
        view.backgroundColor = color
    }
    
    private func setupBackwardButton() {
        backwardButton.addTarget(self, action: #selector(backwardButtonDidTapped), for: .touchUpInside)
    }
    
    
    private func setupCancelButton() {
        cancelButton.addTarget(self, action: #selector(cancelButtonDidTapped), for: .touchUpInside)
    }
    
    @objc private func backwardButtonDidTapped() {
        dismiss(animated: true)
    }
    
    @objc private func cancelButtonDidTapped() {
        searchTextField.clearTextFieldText()
        summonerSearchTopViewWidthConstraint = summonerSearchTopView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 8/7)
        summonerSearchTopViewWidthConstraint.isActive = true
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 1,
                       options: .curveEaseOut,
                       animations: { [weak self] in
            
            self?.view.layoutIfNeeded()
        }, completion: nil)
        
        searchTextField.textField.resignFirstResponder()
    }
}

// MARK: - Extension

extension SummonerSearchViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        summonerSearchTopViewWidthConstraint = summonerSearchTopView.widthAnchor.constraint(equalTo: view.widthAnchor)
        summonerSearchTopViewWidthConstraint.isActive = true
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 1,
                       options: .curveEaseOut,
                       animations: { [weak self] in
            
            self?.view.layoutIfNeeded()
        }, completion: nil)
        
        searchTextField.setupLayerColor(.darkGray)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        summonerSearchTopViewWidthConstraint = summonerSearchTopView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 8/7)
        summonerSearchTopViewWidthConstraint.isActive = true
        
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 1,
                       options: .curveEaseOut,
                       animations: { [weak self] in
            
            self?.view.layoutIfNeeded()
        }, completion: nil)
        
        searchTextField.setupLayerColor(.lightGray)
    }
    
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        let newText = string.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard let text = textField.text,
              let textRange = Range(range, in: text) else {
            return true
        }
        
        let reaminedText = text.replacingCharacters(in: textRange, with: newText)
            .trimmingCharacters(in: .whitespacesAndNewlines)
        
        if reaminedText.isEmpty {
            textField.rightViewMode = .never
        } else {
            textField.rightViewMode = .whileEditing
        }
        
        return true
    }
    
    // 검색하고 메인뷰로 나가야 됨
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        return true
    }
}

// MARK: - Namespace

private enum Design {
    static let backwardButtonImage = UIImage(systemName: "chevron.left")
    static let cancelButtonTitle = "취소"
    static let backgroundColor = UIColor(named: "PrimitiveColor")
}
