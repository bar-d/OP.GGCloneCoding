//
//  String+Extension.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/25.
//

import Foundation

extension String {
    var url: URL {
        guard let url = URL(string: self) else {
            fatalError("Failed to convert \(self) String to URL")
        }
        
        return url
    }
    
    func strikeThrough(value: Int) -> NSAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(
            NSAttributedString.Key.strikethroughStyle,
            value: value,
            range: NSMakeRange(.zero, attributeString.length))
        
        return attributeString
    }

    func convertRomanToNumeric() -> String {
        let numberWithRomanArray: [Character: Int] = [
            "I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000
        ]
        var previous = 0
        var answer = 0
        let stringArray = Array(self)
        let length = stringArray.count

        for index in 1...length {
            guard let now = numberWithRomanArray[stringArray[length - index]] else {
                return "Unable to Convert"
            }

            answer += now >= previous ? now : -now
            previous = now
        }

        return String(answer)
    }

    func firstLetterUppercased() -> Self {
        guard let firstCharacter = self.first else {
            return ""
        }

        let firstLetter = String(firstCharacter).uppercased()
        let restLetter = self.dropFirst().lowercased()

        return firstLetter + restLetter
    }
}
