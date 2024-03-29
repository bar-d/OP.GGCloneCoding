//
//  SettingsCell.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/20.
//

import UIKit

final class SettingsCell: UITableViewCell {
    
    // MARK: Properties
    
    private let titleLabel = LabelBuilder()
        .setupSettingsTitleLabel()
        .build()
    
    private let indicatorLabel = LabelBuilder()
        .setupSettingsIndicatorLabel()
        .build()
    
    private let indicator: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = Design.indicatorImage
        imageView.tintColor = Design.indicatorTintColor
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        return imageView
    }()
    
    // MARK: - Initializers
    
    init(font: UIFont?, color: UIColor?) {
        super.init(style: .default, reuseIdentifier: nil)
        
        commonInit()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    // MARK: - Methods

    func setupContent(title: String?, indicatorText: String?) {
        if isVersionSection(by: title) {
            setupTitleAttributes(font: Design.bodyFont, color: Design.indicatorTintColor)
            setupIndicatorHidden(true)
        }

        setupTitleLabel(with: title)
        setupIndicatorLabelText(with: indicatorText)
    }

    private func isVersionSection(by title: String?) -> Bool {
        return title == SettingsSection.version.array.first ? true : false
    }

    private func setupTitleAttributes(font: UIFont?, color: UIColor?) {
        setupTitleFont(font)
        setupTitleColor(color)
    }

    private func setupTitleFont(_ font: UIFont?) {
        titleLabel.font = font
    }

    private func setupTitleColor(_ color: UIColor?) {
        titleLabel.textColor = color
    }

    private func setupIndicatorHidden(_ bool: Bool) {
        indicator.isHidden = bool
    }

    private func setupTitleLabel(with text: String?) {
        titleLabel.text = text
    }

    private func setupIndicatorLabelText(with text: String?) {
        indicatorLabel.text = text
    }

    private func commonInit() {
        setupSubviews()
        setupConstraints()
        setupBackgroundColor()
    }
    
    private func setupSubviews() {
        [titleLabel, indicatorLabel, indicator]
            .forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        setupTitleLabelConstraints()
        setupIndicatorLabelConstraints()
        setupIndicatorConstraints()
    }
    
    private func setupTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
    }
    
    private func setupIndicatorLabelConstraints() {
        NSLayoutConstraint.activate([
            indicatorLabel.topAnchor.constraint(equalTo: topAnchor),
            indicatorLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            indicatorLabel.leadingAnchor.constraint(
                equalTo: titleLabel.trailingAnchor,
                constant: 20
            )
        ])
    }
    
    private func setupIndicatorConstraints() {
        NSLayoutConstraint.activate([
            indicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            indicator.leadingAnchor.constraint(
                equalTo: indicatorLabel.trailingAnchor,
                constant: 20
            ),
            indicator.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    private func setupBackgroundColor() {
        backgroundColor = Design.backgroundColor
    }
}

// MARK: - Namespace

private enum Design {
    static let indicatorImage = UIImage(systemName: "chevron.right")
    static let indicatorTintColor = UIColor(named: "LanguageColor")
    static let backgroundColor = UIColor(named: "SecondaryColor")
    static let bodyFont = UIFont.preferredFont(forTextStyle: .body)
}
