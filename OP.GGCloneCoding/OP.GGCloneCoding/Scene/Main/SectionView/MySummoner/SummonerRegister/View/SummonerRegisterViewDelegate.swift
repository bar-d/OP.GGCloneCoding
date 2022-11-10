//
//  SummonerRegisterViewDelegate.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/09.
//

import UIKit

protocol SummonerRegisterViewDelegate: AnyObject {
    func fetchSummonerRankInformation(encryptedID: String)
    func showAlert(from alert: UIAlertController)
}
