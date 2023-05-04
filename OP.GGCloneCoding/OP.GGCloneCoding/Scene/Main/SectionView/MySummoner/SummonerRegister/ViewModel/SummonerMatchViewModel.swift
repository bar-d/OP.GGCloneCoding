//
//  SummonerMatchViewModel.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/15.
//

import UIKit

struct SummonerMatchViewModel: ViewModel {

    // MARK: Properties

    private var count: Int = 0
    private let summonerMatchUseCase = SummonerMatchUseCase()
    private let output: Output
    lazy var input = Input(
        fetchSummonerMatchInformation: fetchSummonerMatchInformation(matchIDList:)
    )

    // MARK: - Initializers

    init(output: Output) {
        self.output = output
    }

    // MARK: - Methods

    private func fetchSummonerMatchInformation(matchIDList: [String]) {
        summonerMatchUseCase.searchSummoner(matchIDList: matchIDList) { result in
            DispatchQueue.main.async() {
                switch result {
                case .success(_):
                    output.dismissController()
                case .failure(let error):
                    output.showErrorAlert(
                        ErrorAlertController.unknownError(error as? APIError).value
                    )
                    /// 추후 제거 필요
                    print("👏👏👏👏")
                }
            }
        }
    }
}

extension SummonerMatchViewModel {
    struct Input {
        let fetchSummonerMatchInformation: ([String]) -> Void
    }

    struct Output {
        let dismissController: () -> Void
        let showErrorAlert: (UIAlertController) -> Void
    }
}
