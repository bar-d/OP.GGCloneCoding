//
//  ErrorAlertController.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/09.
//

import UIKit

enum ErrorAlertController {
    case nonexistentSummoner
    case unknownError(_ error: APIError?)

    var value: UIAlertController {
        switch self {
        case .nonexistentSummoner:
            return NonexistentSummonerAlertViewModel().makeAlertController()
        case .unknownError(let error):
            return UnknownErrorAlertViewModel().makeAlertController(error: error)
        }
    }
}

extension ErrorAlertController {
    struct NonexistentSummonerAlertViewModel: AlertViewModel {
        var alertController: UIAlertControllerViewModel = NonexistentSummonerAlertController()
        var alertAction: UIAlertActionViewModel = NonexistentSummonerAlertActionViewModel()

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

    struct NonexistentSummonerAlertController: UIAlertControllerViewModel {
        var title: String? = "존재하지 않는 소환사입니다."
        var message: String? = "소환사 아이디를 확인해주세요!"
        var preferredStyle: UIAlertController.Style = .alert
    }

    struct NonexistentSummonerAlertActionViewModel: UIAlertActionViewModel {
        var title: String? = "확인"
        var style: UIAlertAction.Style = .default
    }

    struct UnknownErrorAlertViewModel: AlertViewModel {
        var alertController: UIAlertControllerViewModel = UnknownErrorAlertController()
        var alertAction: UIAlertActionViewModel = UnknownErrorAlertActionViewModel()

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

    struct UnknownErrorAlertController: UIAlertControllerViewModel {
        var title: String? = "에러 발생"
        var message: String?
        var preferredStyle: UIAlertController.Style = .alert
    }

    struct UnknownErrorAlertActionViewModel: UIAlertActionViewModel {
        var title: String? = "확인"
        var style: UIAlertAction.Style = .default
    }
}
