//
//  ErrorAlertController.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/09.
//

import UIKit

enum ErrorAlertController {
    case unknownSummoner
    case unknownError(_ error: APIError?)
    
    var value: UIAlertController {
        switch self {
        case .unknownSummoner:
            return UnknownSummonerAlertViewModel().makeAlertController()
        case .unknownError(let error):
            return UnknownErrorAlertViewModel().makeAlertController(error: error)
        }
    }
}

extension ErrorAlertController {
    struct UnknownSummonerAlertViewModel: AlertViewModel {
        var alertController: AlertControllerViewModel = UnknownSummonerAlertController()
        var alertAction: AlertActionViewModel = UnknownSummonerAlertActionViewModel()
        
        func makeAlertController() -> UIAlertController {
            let alert = UIAlertController(
                title: alertController.title,
                message: alertController.message,
                preferredStyle: alertController.preferredStyle
            )
            
            let action = UIAlertAction(
                title: alertAction.title,
                style: alertAction.style
            )
            
            alert.addAction(action)
            
            return alert
        }
    }
    
    struct UnknownSummonerAlertController: AlertControllerViewModel {
        var title: String? = Design.unknownSummonerAlertControllerTitle
        var message: String? = Design.unknownSummonerAlertControllerMessage
        var preferredStyle: UIAlertController.Style = .alert
    }
    
    struct UnknownSummonerAlertActionViewModel: AlertActionViewModel {
        var title: String? = Design.unknownSummonerAlertActionTitle
        var style: UIAlertAction.Style = .default
    }
    
    struct UnknownErrorAlertViewModel: AlertViewModel {
        var alertController: AlertControllerViewModel = UnknownErrorAlertController()
        var alertAction: AlertActionViewModel = UnknownErrorAlertActionViewModel()
        
        func makeAlertController(error: APIError?) -> UIAlertController {
            let alert = UIAlertController(
                title: alertController.title,
                message: error?.localizedDescription,
                preferredStyle: alertController.preferredStyle
            )
            
            let action = UIAlertAction(
                title: alertAction.title,
                style: alertAction.style
            )
            
            alert.addAction(action)
            
            return alert
        }
    }
    
    struct UnknownErrorAlertController: AlertControllerViewModel {
        var title: String? = Design.unknownErrorAlertControllerTitle
        var message: String?
        var preferredStyle: UIAlertController.Style = .alert
    }
    
    struct UnknownErrorAlertActionViewModel: AlertActionViewModel {
        var title: String? = Design.unknownErrorAlertActionTitle
        var style: UIAlertAction.Style = .default
    }
}

// MARK: - Namespace

private enum Design {
    static let unknownSummonerAlertControllerTitle = "존재하지 않는 소환사입니다."
    static let unknownSummonerAlertControllerMessage = "소환사 아이디를 확인해주세요!"
    static let unknownSummonerAlertActionTitle = "확인"
    static let unknownErrorAlertControllerTitle = "에러 발생"
    static let unknownErrorAlertActionTitle = "확인"
}
