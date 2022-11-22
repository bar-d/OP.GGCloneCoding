//
//  UIImage+Extension.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/22.
//

import UIKit.UIImage

extension UIImage {
    func resize(width: CGFloat) -> UIImage {
        let scale = width / self.size.width
        let newHeight = self.size.height * scale
        let size = CGSize(width: width, height: newHeight)

        let render = UIGraphicsImageRenderer(size: size)
        let renderImage = render.image { context in
            self.draw(in: CGRect(origin: .zero, size: size))
        }

        return renderImage
    }
}

