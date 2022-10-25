//
//  String+Extension.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/25.
//

import Foundation

extension String {
    func strikeThrough(value: Int) -> NSAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(
            NSAttributedString.Key.strikethroughStyle,
            value: value,
            range: NSMakeRange(.zero, attributeString.length))

        return attributeString
    }
}
