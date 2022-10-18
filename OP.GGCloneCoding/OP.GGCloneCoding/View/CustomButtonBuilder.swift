//
//  CustomButtonBuilder.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/18.
//

import UIKit

final class CustomButtonBuilder {

    // MARK: Properties

    private var button = UIButton()

    // MARK: - Initizliers

    init() {}

    // MARK: - Methods

    func build() -> UIButton {
        return button
    }

    func setupConstraintsAutomatically(_ bool: Bool) -> CustomButtonBuilder {
        button.translatesAutoresizingMaskIntoConstraints = bool

        return self
    }

    func setupColor(
        tint: UIColor? = .systemBackground,
        background: UIColor? = .systemBackground
    ) -> CustomButtonBuilder {
        button.tintColor = tint
        button.backgroundColor = background

        return self
    }

    func setupImage(
        image: UIImage?,
        state: UIControl.State = .normal,
        textStyle: UIFont.TextStyle = .body,
        scale: UIImage.SymbolScale = .default
    ) -> CustomButtonBuilder {
        button.setImage(image, for: state)
        button.setPreferredSymbolConfiguration(.init(textStyle: textStyle, scale: scale), forImageIn: state)

        return self
    }

    func setupTitle(
        name: String?,
        state: UIControl.State = .normal,
        font: UIFont? = UIFont().withSize(12),
        color: UIColor? = .black
    ) -> CustomButtonBuilder {
        button.setTitle(name, for: state)
        button.titleLabel?.font = font
        button.setTitleColor(color, for: state)

        return self
    }

    func setupInset(
        titleInset: UIEdgeInsets,
        contentInset: UIEdgeInsets
    ) -> CustomButtonBuilder {
        button.titleEdgeInsets = titleInset
        button.contentEdgeInsets = contentInset

        return self
    }

    func setupPriority(
        hugging: UILayoutPriority = .init(250),
        compression: UILayoutPriority = .init(750),
        axis: NSLayoutConstraint.Axis
    ) -> CustomButtonBuilder {
        button.setContentHuggingPriority(hugging, for: axis)
        button.setContentCompressionResistancePriority(compression, for: axis)

        return self
    }

    func setupLayer(
        cornerRadius: CGFloat = 0,
        width: CGFloat = 0,
        color: CGColor? = UIColor.black.cgColor
    ) -> CustomButtonBuilder {
        button.layer.cornerRadius = cornerRadius
        button.layer.borderWidth = width
        button.layer.borderColor = color

        return self
    }

    func setupSemanticContentAttribute(direction: UISemanticContentAttribute) -> CustomButtonBuilder {
        button.semanticContentAttribute = direction

        return self
    }

    func setupHorizontalAlignment(direction: UIControl.ContentHorizontalAlignment) -> CustomButtonBuilder {
        button.contentHorizontalAlignment = direction

        return self
    }
}
