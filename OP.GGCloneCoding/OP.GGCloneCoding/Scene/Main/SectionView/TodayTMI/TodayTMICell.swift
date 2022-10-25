//
//  TodayTMICell.swift
//  OP.GGCloneCoding
//
//  Created by bard on 2022/10/25.
//

import SwiftUI

final class TodayTMICell: UITableViewCell {
    
    // MARK: Properties
    
    private let titleLabel: PaddingLabel = {
        let label = PaddingLabel(top: 4, left: 0, bottom: 4, right: 0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Design.titleLabelText
        label.textColor = .white
        label.layer.backgroundColor = Design.titleLabelBackgoundColors[0]?.cgColor
        label.layer.cornerRadius = 8
        
        return label
    }()
    
    private let TMIDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.text = Design.TMIDescriptionText
        label.numberOfLines = 3
        
        return label
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
    
    private func commonInit() {
        setupSubviews()
        setupConstraints()
        setupBackgroundColor(Design.cellBackgoundColors)
    }
    
    private func setupSubviews() {
        [titleLabel, TMIDescription]
            .forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.heightAnchor.constraint(equalTo: TMIDescription.heightAnchor, multiplier: 2/3),
            
            TMIDescription.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            TMIDescription.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            TMIDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            TMIDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    private func setupBackgroundColor(_ color: [UIColor?]) {
        let TMIColors = color.compactMap { $0 }
        
        backgroundColor = TMIColors.randomElement()
    }
}

// MARK: - Namespace

private enum Design {
    static let titleLabelText = "  😁 오늘의 TMI  "
    static let titleLabelBackgoundColors = [UIColor(named: "TMITitleBackgroundBlue")]
    static let TMIDescriptionText = "다리우스와 드레이븐은 형제입니다."
    static let cellBackgoundColors = [UIColor(named: "TMIBackgroundBlue")]
}

// MARK: - Preview

struct TodayTMICell_Preview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let view = TodayTMICell()
            
            return view
        }
        .previewLayout(.fixed(width: 300, height: 100))}
}
