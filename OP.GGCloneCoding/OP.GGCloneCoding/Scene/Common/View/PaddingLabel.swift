//
//  PaddingLabel.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/25.
//

import UIKit

class PaddingLabel: UILabel {
    
    // MARK: Properties
    
    private var padding: UIEdgeInsets
    
    // MARK: - Initializers
    
    init(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat) {
        self.padding = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        self.padding = UIEdgeInsets()
        super.init(frame: .zero)
    }
    
    // MARK: - Methods
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }
    
    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height += padding.top + padding.bottom
        contentSize.width += padding.left + padding.right
        
        return contentSize
    }
}
