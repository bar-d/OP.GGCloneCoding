//
//  SettingsCell.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/20.
//

import SwiftUI

final class SettingsCell: UITableViewCell {

    // MARK: Properties

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title Label"
        label.font = .preferredFont(forTextStyle: .headline)

        return label
    }()

    private let indicatorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Indicator Label"
        label.textColor = .systemGray
        label.textAlignment = .right
        label.font = .preferredFont(forTextStyle: .subheadline)

        return label
    }()

    private let indicator: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = UIColor(named: "LanguageColor")

        return imageView
    }()

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

    func setupTitleLabel(with text: String) {
        titleLabel.text = text
    }

    func setupTitleColor(_ color: String) {
        titleLabel.textColor = UIColor(named: color)
    }

    func setupTitleFont(_ font: UIFont.TextStyle) {
        titleLabel.font = .preferredFont(forTextStyle: font)
    }

    func setupIndicatorLabelText(with text: String) {
        indicatorLabel.text = text
    }

    func setupIndicatorLabelHidden(_ bool: Bool) {
        indicatorLabel.isHidden = bool
    }

    func setupIndicatorHidden(_ bool: Bool) {
        indicator.isHidden = bool
    }

    private func commonInit() {
        setupSubviews()
        setupConstraints()
        setupContentPriority()
        setupBackgroundColor()
    }

    private func setupSubviews() {
        [titleLabel, indicatorLabel, indicator]
            .forEach { addSubview($0) }
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),

            indicatorLabel.topAnchor.constraint(equalTo: topAnchor),
            indicatorLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            indicatorLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 20),

            indicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            indicator.leadingAnchor.constraint(equalTo: indicatorLabel.trailingAnchor, constant: 20),
            indicator.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }

    private func setupContentPriority() {
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        indicatorLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        indicator.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }

    private func setupBackgroundColor() {
        backgroundColor = Design.backgroundColor
    }
}

// MARK: - Preview

struct SettingsCell_Preview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let view = SettingsCell()
            return view
        }
        .previewLayout(.fixed(width: 400, height: 50))
    }
}

// MARK: - Namespace

private enum Design {
    static let backgroundColor = UIColor(named: "SecondaryColor")
}
