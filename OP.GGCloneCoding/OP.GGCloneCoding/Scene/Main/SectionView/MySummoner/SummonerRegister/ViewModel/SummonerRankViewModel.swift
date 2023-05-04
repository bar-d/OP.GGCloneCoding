//
//  SummonerRankViewModel.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/10.
//

import UIKit

struct SummonerRankViewModel: ViewModel {

    // MARK: Properties

    private let summonerRankUseCase: SummonerRankUseCase = SummonerRankUseCase()
    private let output: Output
    lazy var input = Input(
        fetchSummonerRankInformation: fetchSummonerRankInformation(encryptedID:)
    )

    // MARK: - Initializers

    init(output: Output) {
        self.output = output
    }

    // MARK: - Methods

    private func fetchSummonerRankInformation(encryptedID: String) {
        summonerRankUseCase.searchSummonerRank(encryptedId: encryptedID) { result in
            DispatchQueue.main.async {
                if case let .failure(error) = result {
                    output.showErrorAlert(
                        ErrorAlertController.unknownError(error as? APIError).value
                    )
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
        let showErrorAlert: (UIAlertController) -> Void
    }
}
