//
//  SummonerRegisterViewDelegate.swift
//  OP.GGCloneCoding
//
//  Created by λ°λ, μκΏ on 2022/11/09.
//

import UIKit

protocol SummonerRegisterViewDelegate: AnyObject {
    func fetchSummonerRankInformation(encryptedID: String)
    func fetchSummonerMatchListInformation(puuid: String)
    func showAlert(from alert: UIAlertController)
}
