//
//  SettingsCell.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/20.
//

import SwiftUI

final class SettingsCell: UITableViewCell, CellCustomizable {
    
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
    
    init(font: UIFont?, color: UIColor?) {
        super.init(style: .default, reuseIdentifier: nil)
        
        commonInit()
        setupTitleAttributes(font: font, color: color)
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
    
    func setupContent(with indexPath: IndexPath) {
        setupTitleLabel(with: SettingSection(rawValue: indexPath.section)?.array[indexPath.row])
        setupIndicatorLabelText(with: SettingSection(rawValue: indexPath.section)?.indicator)
    }
    
    func setupTitleAttributes(font: UIFont?, color: UIColor?) {
        setupTitleFont(font)
        setupTitleColor(color)
    }
    
    private func setupTitleLabel(with text: String?) {
        titleLabel.text = text
    }
    
    private func setupIndicatorLabelText(with text: String?) {
        indicatorLabel.text = text
    }
    
    private func setupTitleFont(_ font: UIFont?) {
        titleLabel.font = font
    }
    
    private func setupTitleColor(_ color: UIColor?) {
        titleLabel.textColor = color
    }
    
    private func commonInit() {
        setupSubviews()
        setupConstraints()
        setupBackgroundColor()
        setupContentPriority()
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
    
    private func setupBackgroundColor() {
        backgroundColor = Design.backgroundColor
    }
    
    private func setupContentPriority() {
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        indicatorLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        indicator.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
}

// MARK: - Namespace

private enum Design {
    static let backgroundColor = UIColor(named: "SecondaryColor")
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
