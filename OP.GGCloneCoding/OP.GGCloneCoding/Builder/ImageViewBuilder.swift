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
}

// MARK: - Namespace

private enum Design {
    static let logoImage = UIImage(named: "OP.GGMainLogo")
}
