//
//  SummonerDescriptionViewDelegate.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/16.
//

import UIKit.UIAlertController

protocol SummonerDescriptionViewDelegate: AnyObject {
    func showAlert(from alert: UIAlertController)
    func reloadData()
    func resetDelegate()
}
