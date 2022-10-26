//
//  PatchNoteCell.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/24.
//

import UIKit

final class PatchNoteCell: UITableViewCell {
    
    // MARK: Properties
    
    private let titleLabel = LabelBuilder()
        .setupMainCellTitleLabel(text: Design.titleLabelText, color: .white)
        .build()
    
    private let patchNoteScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    private let patchNoteStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.spacing = 10
        
        return stackView
    }()
    
    private let firstPatchNoteImageView = PatchNoteImageView()
    private let secondPatchNoteImageView = PatchNoteImageView()
    private let thirdPatchNoteImageView = PatchNoteImageView()
    
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
        setupContentInset(top: 0, left: 20, bottom: 0, right: 20)
        setupBackgroundColor(Design.patchNoteBackgroundColor)
        setupContentViewUserInteractionEnabled(false)
        setupSelectionStyle(.none)
    }
    
    private func setupSubviews() {
        [titleLabel, patchNoteScrollView]
            .forEach { addSubview($0) }
        [patchNoteStackView]
            .forEach { patchNoteScrollView.addSubview($0) }
        [firstPatchNoteImageView, secondPatchNoteImageView, thirdPatchNoteImageView]
            .forEach { patchNoteStackView.addArrangedSubview($0) }
    }
    
    private func setupConstraints() {
        setupFirstPatchNoteImageViewConstraints()
        setupTitleLabelConstraints()
        setupPatchNoteScrollViewConstraints()
        setupPatchNoteStackViewConstraints()
    }
    
    private func setupFirstPatchNoteImageViewConstraints() {
        [firstPatchNoteImageView, secondPatchNoteImageView, thirdPatchNoteImageView]
            .forEach {
                $0.heightAnchor.constraint(equalTo: titleLabel.widthAnchor, multiplier: 3/5).isActive = true
                $0.widthAnchor.constraint(equalTo: $0.heightAnchor, multiplier: 3/2).isActive = true
            }
    }
    
    private func setupTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 20)
        ])
    }
    
    private func setupPatchNoteScrollViewConstraints() {
        NSLayoutConstraint.activate([
            patchNoteScrollView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            patchNoteScrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            patchNoteScrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            patchNoteScrollView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func setupPatchNoteStackViewConstraints() {
        NSLayoutConstraint.activate([
            patchNoteStackView.topAnchor.constraint(equalTo: patchNoteScrollView.topAnchor),
            patchNoteStackView.bottomAnchor.constraint(equalTo: patchNoteScrollView.bottomAnchor, constant: -20),
            patchNoteStackView.leadingAnchor.constraint(equalTo: patchNoteScrollView.leadingAnchor),
            patchNoteStackView.trailingAnchor.constraint(equalTo: patchNoteScrollView.trailingAnchor),
            patchNoteStackView.heightAnchor.constraint(equalTo: patchNoteScrollView.heightAnchor, constant: -20)
        ])
    }
    
    private func setupContentInset(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) {
        patchNoteScrollView.contentInset = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }
    
    private func setupBackgroundColor(_ color: UIColor?) {
        backgroundColor = color
    }
    
    private func setupContentViewUserInteractionEnabled(_ bool: Bool) {
        contentView.isUserInteractionEnabled = bool
    }
    
    private func setupSelectionStyle(_ style: UITableViewCell.SelectionStyle) {
        selectionStyle = style
    }
    
    private func setupTitleLabel() {
        titleLabel.text = Design.titleLabelText
    }
}

// MARK: - Namespace

private enum Design {
    static let titleLabelText = "패치 노트"
    static let patchNoteBackgroundColor = UIColor(named: "PatchNoteColor")
}
