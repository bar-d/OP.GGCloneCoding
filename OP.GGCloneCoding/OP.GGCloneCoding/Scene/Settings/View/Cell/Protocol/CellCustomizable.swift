//
//  CellCustomizable.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/20.
//

import UIKit

protocol CellCustomizable: UITableViewCell {
    func setupContent(with indexPath: IndexPath)
    func setupTitleAttributes(font: UIFont?, color: UIColor?)
}
