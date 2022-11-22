//
//  AlertViewModel.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/09.
//

import UIKit

protocol AlertViewModel {
    var alertController: AlertControllerViewModel { get }
    var alertAction: AlertActionViewModel { get }
}

protocol AlertControllerViewModel {
    var title: String? { get }
    var message: String? { get }
    var preferredStyle: UIAlertController.Style { get }
}

protocol AlertActionViewModel {
    var title: String? { get }
    var style: UIAlertAction.Style { get }
}
