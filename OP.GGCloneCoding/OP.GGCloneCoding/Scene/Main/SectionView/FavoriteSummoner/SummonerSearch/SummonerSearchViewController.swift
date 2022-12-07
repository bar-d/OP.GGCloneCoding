//
//  SummonerSearchViewController.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/01.
//

import UIKit

final class SummonerSearchViewController: UIViewController {
    
    // MARK: Properties
    
    private let topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let backwardButton = ButtonBuilder()
        .setupConstraintsAutomatic(false)
        .setupImage(image: Design.backwardButtonImage)
        .setupColor(tint: .label, background: .clear)
        .build()
    
    private let searchTextField = SearchTextField()
    
    private let cancelButton = ButtonBuilder()
        .setupConstraintsAutomatic(false)
        .setupTitle(name: Design.cancelButtonTitle, color: .label)
        .build()
    
    private let summonerSearchTableView = SummonerSearchTableView()
    
    private var cancelButtonTrailingConstraint = NSLayoutConstraint()
    private var topViewWidthConstraint = NSLayoutConstraint()
    
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
        [topView, summonerSearchTableView]
            .forEach { view.addSubview($0) }
        [backwardButton, searchTextField, cancelButton]
            .forEach { topView.addSubview($0) }
    }
    
    private func setupConstraints() {
        setupSummonerSearchTopViewConstraints()
        setupBackwardButtonConstraints()
        setupSearchTextFieldConstraints()
        setupCancelButtonConstraints()
        setupSummonerSearchTableViewConstraints()
    }
    
    private func setupSummonerSearchTopViewConstraints() {
        topViewWidthConstraint = topView.widthAnchor.constraint(
            equalTo: view.widthAnchor,
            multiplier: 8/7
        )
        
        NSLayoutConstraint.activate([
            topViewWidthConstraint,
            topView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setupBackwardButtonConstraints() {
        NSLayoutConstraint.activate([
            backwardButton.leadingAnchor.constraint(
                equalTo: topView.leadingAnchor
            ),
            backwardButton.heightAnchor.constraint(
                equalTo: topView.heightAnchor,
                multiplier: 1/2
            ),
            backwardButton.widthAnchor.constraint(equalTo: backwardButton.heightAnchor),
            backwardButton.centerYAnchor.constraint(
                equalTo: topView.centerYAnchor
            )
        ])
    }
    
    private func setupSearchTextFieldConstraints() {
        NSLayoutConstraint.activate([
            searchTextField.trailingAnchor.constraint(
                equalTo: cancelButton.leadingAnchor,
                constant: -8
            ),
            searchTextField.leadingAnchor.constraint(
                equalTo: backwardButton.trailingAnchor,
                constant: 8
            ),
            searchTextField.centerYAnchor.constraint(
                equalTo: topView.centerYAnchor
            ),
            searchTextField.heightAnchor.constraint(equalTo: backwardButton.heightAnchor)
        ])
    }
    
    private func setupCancelButtonConstraints() {
        NSLayoutConstraint.activate([
            cancelButton.trailingAnchor.constraint(
                equalTo: topView.trailingAnchor
            ),
            cancelButton.widthAnchor.constraint(
                equalTo: view.widthAnchor,
                multiplier: 1/6
            ),
            cancelButton.centerYAnchor.constraint(
                equalTo: topView.centerYAnchor
            ),
            cancelButton.topAnchor.constraint(equalTo: backwardButton.topAnchor),
            cancelButton.bottomAnchor.constraint(equalTo: backwardButton.bottomAnchor)
        ])
    }
    
    private func setupSummonerSearchTableViewConstraints() {
        NSLayoutConstraint.activate([
            summonerSearchTableView.topAnchor.constraint(
                equalTo: topView.bottomAnchor
            ),
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
        backwardButton.addTarget(
            self,
            action: #selector(backwardButtonDidTap),
            for: .touchUpInside
        )
    }
    
    
    private func setupCancelButton() {
        cancelButton.addTarget(
            self,
            action: #selector(cancelButtonDidTap),
            for: .touchUpInside
        )
    }
    
    @objc private func backwardButtonDidTap() {
        dismiss(animated: true)
    }
    
    @objc private func cancelButtonDidTap() {
        searchTextField.clearTextFieldText()
        topViewWidthConstraint = topView.widthAnchor.constraint(
            equalTo: view.widthAnchor,
            multiplier: 8/7
        )
        topViewWidthConstraint.isActive = true
        
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
        topViewWidthConstraint = topView.widthAnchor.constraint(equalTo: view.widthAnchor)
        topViewWidthConstraint.isActive = true
        
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
        topViewWidthConstraint = topView.widthAnchor.constraint(
            equalTo: view.widthAnchor,
            multiplier: 8/7
        )
        topViewWidthConstraint.isActive = true
        
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
    
    /// 검색하고 메인뷰로 나가야 됨
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
