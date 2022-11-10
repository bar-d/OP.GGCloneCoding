//
//  AlertViewModel.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/09.
//

import UIKit

protocol AlertViewModel {
    var alertController: UIAlertControllerViewModel { get }
    var alertAction: UIAlertActionViewModel { get }
}

protocol UIAlertControllerViewModel {
    var title: String? { get }
    var message: String? { get }
    var preferredStyle: UIAlertController.Style { get }
}

protocol UIAlertActionViewModel {
    var title: String? { get }
    var style: UIAlertAction.Style { get }
}
