//
//  SummonerDescriptionViewDelegate.swift
//  OP.GGCloneCoding
//
//  Created by λ°λ, μκΏ on 2022/11/16.
//

import UIKit.UIAlertController

protocol SummonerDescriptionViewDelegate: AnyObject {
    func showAlert(from alert: UIAlertController)
    func cancelButtonDidTap()
}
