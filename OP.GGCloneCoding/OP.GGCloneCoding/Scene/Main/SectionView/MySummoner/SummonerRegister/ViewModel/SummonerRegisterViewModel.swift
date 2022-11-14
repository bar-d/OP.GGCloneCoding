//
//  SummonerRegisterViewModel.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/09.
//

import UIKit

struct SummonerSearchViewModel {
    private let summonerSearchUsecase: SummonerSearchUseCase = SummonerSearchUseCase()
    private let output: Output
    lazy var input = Input(completeButtonDidTap: completeButtonDidTap(id:))

    init(output: Output) {
        self.output = output
    }

    private func completeButtonDidTap(id: String) {
        summonerSearchUsecase.searchSummoner(id: id) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let summoner):
                    let archivedData = try? JSONEncoder().encode(summoner)

                    UserDefaults.standard.set(archivedData, forKey: "MySummonerInformation")
                    output.fetchSummonerRankInformation(summoner.id)
                    output.fetchSummonerMatchListInformation(summoner.puuid)
                case .failure(_):
                    output.showErrorAlert(ErrorAlertController.nonexistentSummoner.value)
                }
            }
        }
    }
}

extension SummonerSearchViewModel {
    struct Input {
        let completeButtonDidTap: (String) -> Void
    }

    struct Output {
        let fetchSummonerRankInformation: (String) -> Void
        let fetchSummonerMatchListInformation: (String) -> Void
        let showErrorAlert: (UIAlertController) -> Void
    }
}
