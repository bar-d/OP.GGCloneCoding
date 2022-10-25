//
//  ImageViewBuilder.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/18.
//

import UIKit

final class ImageViewBuilder {

    // MARK: - Properties

    private let imageView = UIImageView()

    // MARK: - Initializers

    init() { }

    // MARK: - Methods

    func build() -> UIImageView {
        return imageView
    }

    func setupConstraintsAutomatic(_ bool: Bool) -> ImageViewBuilder {
        imageView.translatesAutoresizingMaskIntoConstraints = bool

        return self
    }

    func setupImage(image: UIImage? = UIImage()) -> ImageViewBuilder {
        imageView.image = image

        return self
    }

    func setupContentMode(_ contentMode: UIView.ContentMode) -> ImageViewBuilder {
        imageView.contentMode = contentMode

        return self
    }

    func setupImageTintColor(_ color: UIColor) -> ImageViewBuilder {
        imageView.tintColor = color

        return self
    }

    func setupBackgroundColor(_ color: UIColor?) -> ImageViewBuilder {
        imageView.backgroundColor = color

        return self
    }

    func setupLayer(
        cornerRadius: CGFloat = 0,
        width: CGFloat = 0,
        color: CGColor? = UIColor.clear.cgColor
    ) -> ImageViewBuilder {
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = cornerRadius
        imageView.layer.borderWidth = width
        imageView.layer.borderColor = color

        return self
    }
}

// MARK: - Extension

extension ImageViewBuilder {
    func setupLoadImageView() -> ImageViewBuilder {
        let builder = self
            .setupConstraintsAutomatic(false)
            .setupImage(image: Design.logoImage)
            .setupContentMode(.left)

        return builder
    }
    
    func setupPatchImageView() -> ImageViewBuilder {
        let builder = self
            .setupConstraintsAutomatic(false)
            .setupImage(image: Design.patchImageViewImage)
            .setupContentMode(.scaleAspectFit)
            .setupBackgroundColor(.darkGray)
            .setupLayer(cornerRadius: 10, width: 1)
        
        return builder
    }
    
    func setupIndicatorImageView() -> ImageViewBuilder {
        let builder = self
            .setupConstraintsAutomatic(false)
            .setupImage(image: Design.indicatorImage)
            .setupImageTintColor(.white)
        
        return builder
    }

    func setupAnotherGameImageView(image: UIImage?) -> ImageViewBuilder {
        let builder = self
            .setupConstraintsAutomatic(false)
            .setupImage(image: image)
            .setupContentMode(.scaleAspectFit)
            .setupLayer(cornerRadius: 10, width: 1)

        return builder
    }
}

// MARK: - Namespace

private enum Design {
    static let logoImage = UIImage(named: "OP.GGMainLogo")
    static let patchImageViewImage = UIImage(named: "OP.GGLoadLogo")
    static let indicatorImage = UIImage(systemName: "chevron.right")
}
