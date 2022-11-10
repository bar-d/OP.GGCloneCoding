//
//  SummonerRankViewModel.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/10.
//

import UIKit

struct SummonerRankViewModel {
    private let summonerRankUsecase: SummonerRankUseCase = SummonerRankUseCase()
    private let output: Output
    lazy var input = Input(fetchSummonerRankInformation: fetchSummonerRankInformation(encryptedID:))

    init(output: Output) {
        self.output = output
    }

    private func fetchSummonerRankInformation(encryptedID: String) {
        summonerRankUsecase.searchSummonerRank(encryptedId: encryptedID) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let summonerRankArray):
                    print(summonerRankArray)
                    let archivedRankData = try? JSONEncoder().encode(summonerRankArray)

                    UserDefaults.standard.set(archivedRankData, forKey: "MySummonerRankInformation")
                    output.dismissController()
                case .failure(let error):
                    output.showErrorAlert(ErrorAlertController.unknownError(error as? APIError).value)
                }
            }
        }
    }
}

extension SummonerRankViewModel {
    struct Input {
        let fetchSummonerRankInformation: (String) -> Void
    }

    struct Output {
        let dismissController: () -> Void
        let showErrorAlert: (UIAlertController) -> Void
    }
}
