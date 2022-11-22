//
//  UIView+Extension.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/28.
//

import UIKit

extension UIView {
    func addDashedBorder(
        cornerRadius: CGFloat = .zero,
        fillColor: CGColor? = UIColor.clear.cgColor,
        strokeColor: CGColor? = UIColor.lightGray.cgColor,
        lineWidth: CGFloat = 0.1,
        lineJoin: CAShapeLayerLineJoin = .round,
        dashPattern: [NSNumber] = [6, 3]
    ) {
        let shapeRect = CGRect(
            x: .zero, y: .zero,
            width: frame.size.width,
            height: frame.size.height
        )
        let shapeLayer = CAShapeLayer()
        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        shapeLayer.fillColor = fillColor
        shapeLayer.strokeColor = strokeColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.lineJoin = lineJoin
        shapeLayer.lineDashPattern = dashPattern
        shapeLayer.path = UIBezierPath(
            roundedRect: shapeRect,
            cornerRadius: cornerRadius
        ).cgPath
        
        layer.cornerRadius = cornerRadius
        layer.addSublayer(shapeLayer)
    }
}
