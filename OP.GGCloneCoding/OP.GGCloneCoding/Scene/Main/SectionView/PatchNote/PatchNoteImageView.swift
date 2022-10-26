//
//  PatchNoteImageView.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/24.
//

import UIKit

final class PatchNoteImageView: UIView {
    
    // MARK: Properties
    
    private let patchImageView = ImageViewBuilder()
        .setupPatchImageView()
        .build()
    
    private let titleLabel = LabelBuilder()
        .setupMainCellTitleLabel(text: Design.titleLabelText, color: .white, font: .footnote)
        .build()
    
    private let indicatorImageView = ImageViewBuilder()
        .setupPatchNoteIndicatorImageView()
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
    
    private func commonInit() {
        setupConstraintsAutomatic(false)
        setupSubviews()
        setupConstraints()
    }
    
    private func setupConstraintsAutomatic(_ bool: Bool) {
        translatesAutoresizingMaskIntoConstraints = bool
    }
    
    private func setupSubviews() {
        [patchImageView, titleLabel, indicatorImageView]
            .forEach { addSubview($0) }
    }
    
    private func setupConstraints() {
        setupPatchImageViewConstraints()
        setupTitleLabelConstraints()
        setupIndicatorImageViewConstraints()
    }
    
    private func setupPatchImageViewConstraints() {
        NSLayoutConstraint.activate([
            patchImageView.topAnchor.constraint(equalTo: topAnchor),
            patchImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            patchImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            patchImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            patchImageView.heightAnchor.constraint(equalTo: heightAnchor),
            patchImageView.widthAnchor.constraint(equalTo: widthAnchor)
        ])
    }
    
    private func setupTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            titleLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/2)
        ])
    }
    
    private func setupIndicatorImageViewConstraints() {
        NSLayoutConstraint.activate([
            indicatorImageView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            indicatorImageView.topAnchor.constraint(equalTo: titleLabel.topAnchor),
            indicatorImageView.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            indicatorImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            indicatorImageView.widthAnchor.constraint(equalTo: indicatorImageView.heightAnchor)
        ])
    }
}

// MARK: - Namespace

private enum Design {
    static let titleLabelText = "패치 노트"
}
