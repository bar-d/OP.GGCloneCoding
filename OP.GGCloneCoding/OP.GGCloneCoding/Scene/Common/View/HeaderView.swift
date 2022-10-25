//
//  HeaderView.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/17.
//

import SwiftUI

final class HeaderView: UIView {
    
    // MARK: - Properties
    
    private let leftBarItem: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        stackView.distribution = .fillEqually
        
        return stackView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.textAlignment = .center
        label.alpha = .zero

        return label
    }()
    
    private let rightBarItem: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private let firstLeftButton = UIButton()
    private let secondLeftButton = UIButton()
    private let firstRightButton = UIButton()
    private let secondRightButton = UIButton()
    
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

    func setupTitleLabel(with text: String) {
        titleLabel.text = text
    }

    func changeTitleLabelAlpha(with alpha: CGFloat) {
        titleLabel.alpha = alpha
    }
    
    func setupFirstLeftButtonImage(with image: UIImage?) {
        firstLeftButton.setImage(image, for: .normal)
    }
    
    func setupSecondLeftButtonImage(with image: UIImage?) {
        secondLeftButton.setImage(image, for: .normal)
    }
    
    func setupFirstRightButtonImage(with image: UIImage?) {
        firstRightButton.setImage(image, for: .normal)
    }
    
    func setupSecondRightButtonImage(with image: UIImage?) {
        secondRightButton.setImage(image, for: .normal)
    }

    private func commonInit() {
        setupConstraintsAutomatic(false)
        setupSubviews()
        setupConstraints()
        setupLabel()
        setupBackgroundColor()
    }

    private func setupConstraintsAutomatic(_ bool: Bool) {
        translatesAutoresizingMaskIntoConstraints = bool
    }

    private func setupSubviews() {
        [leftBarItem, titleLabel, rightBarItem]
            .forEach { addSubview($0) }
        [firstLeftButton, secondLeftButton]
            .forEach { leftBarItem.addArrangedSubview($0) }
        [firstRightButton, secondRightButton]
            .forEach { rightBarItem.addArrangedSubview($0) }
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            leftBarItem.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            leftBarItem.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            leftBarItem.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/5),
            
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 20),
            
            rightBarItem.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            rightBarItem.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            rightBarItem.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            rightBarItem.widthAnchor.constraint(equalTo: leftBarItem.widthAnchor),
        ])
    }

    private func setupLabel() {
        titleLabel.text = Design.titleLabel
    }

    private func setupBackgroundColor() {
        backgroundColor = Design.backgroundColor
    }
}

// MARK: - Namespace

private enum Design {
    static let backgroundColor = UIColor(named: "SecondaryColor")
    static let titleLabel = "Title Label"
}

// MARK: - Preview

struct HeaderView1_Preview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let view = HeaderView()
            view.translatesAutoresizingMaskIntoConstraints = true
            view.changeTitleLabelAlpha(with: 1)
            
            return view
        }
        .previewLayout(.fixed(width: 600, height: 100))
    }
}
