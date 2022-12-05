//
//  SearchTextField.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/01.
//

import UIKit

final class SearchTextField: UIView {
    
    // MARK: Properties
    
    private let searchImageView = ImageViewBuilder()
        .setupConstraintsAutomatic(false)
        .setupImage(image: Design.searchImage)
        .setupImageTintColor(.lightGray)
        .setupContentMode(.scaleToFill)
        .build()
    
    private let clearButton = ButtonBuilder()
        .setupConstraintsAutomatic(false)
        .setupImage(image: Design.clearButtonImage)
        .setupColor().setupColor(tint: .lightGray)
        .build()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = Design.textFieldPlaceHolder
        let size = clearButton.frame.size
        clearButton.frame = CGRect(
            x: 0,
            y: 0,
            width: size.width + 10,
            height: size.height
        )
        clearButton.contentMode = .left
        
        textField.rightViewRect(forBounds: Design.textFieldRightViewRect)
        textField.rightView = clearButton
        textField.rightViewMode = .never
        
        return textField
    }()
    
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
    
    func setupTextFieldDelegate(_ delegate: UITextFieldDelegate) {
        textField.delegate = delegate
    }
    
    func clearTextFieldText() {
        textField.text?.removeAll()
    }
    
    func setupLayerColor(_ color: UIColor) {
        layer.borderColor = color.cgColor
    }
    
    private func commonInit() {
        setupConstraintsAutomatic(false)
        setupSubviews()
        setupConstraints()
        setupLayer(cornerRadius: 10, borderWidth: 1)
        setupLayerColor(.lightGray)
        setupClearButton()
    }
    
    private func setupConstraintsAutomatic(_ bool: Bool) {
        translatesAutoresizingMaskIntoConstraints = bool
    }
    
    private func setupSubviews() {
        [searchImageView, textField]
            .forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        setupSearchImageViewConstraints()
        setupTextFieldConstraints()
    }
    
    private func setupSearchImageViewConstraints() {
        NSLayoutConstraint.activate([
            searchImageView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 8
            ),
            searchImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            searchImageView.heightAnchor.constraint(
                equalTo: textField.heightAnchor,
                multiplier: 2/3
            ),
            searchImageView.widthAnchor.constraint(equalTo: searchImageView.heightAnchor)
        ])
    }
    
    private func setupTextFieldConstraints() {
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor),
            textField.leadingAnchor.constraint(
                equalTo: searchImageView.trailingAnchor,
                constant: 8
            ),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    private func setupLayer(cornerRadius: CGFloat, borderWidth: CGFloat) {
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
    }
    
    private func setupClearButton() {
        clearButton.addTarget(
            self,
            action: #selector(clearButtonDidTap),
            for: .touchUpInside
        )
    }
    
    @objc private func clearButtonDidTap() {
        textField.text?.removeAll()
    }
}

// MARK: - Namespace

private enum Design {
    static let searchImage = UIImage(systemName: "magnifyingglass")
    static let clearButtonImage = UIImage(systemName: "x.circle.fill")
    static let textFieldPlaceHolder = "소환사 검색"
    static let textFieldRightViewRect = CGRect(x: 10, y: 0, width: 10, height: 0)
}
