//
//  SummonerRegisterViewModel.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/09.
//

import UIKit

struct SummonerSearchViewModel: ViewModel {
    
    // MARK: Properties
    
    private let summonerSearchUseCase: SummonerSearchUseCase = SummonerSearchUseCase()
    private let output: Output
    lazy var input = Input(completeButtonDidTap: completeButtonDidTap(id:))

    // MARK: - Initializers
    
    init(output: Output) {
        self.output = output
    }
    
    // MARK: - Methods

    private func completeButtonDidTap(id: String) {
        summonerSearchUseCase.searchSummoner(id: id) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let summoner):
                    let archivedData = try? JSONEncoder().encode(summoner)

                    UserDefaults.standard.set(
                        archivedData,
                        forKey: Design.mySummonerInformationUserDefaultKey
                    )
                    UserDefaults.standard.set(
                        true,
                        forKey: Design.didSummonerSelectedUserDefaultKey
                    )
                    output.fetchSummonerRankInformation(summoner.id)
                    output.fetchSummonerMatchListInformation(summoner.puuid)
                case .failure(_):
                    output.showErrorAlert(ErrorAlertController.unknownSummoner.value)
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

// MARK: - Namespace

private enum Design {
    static let mySummonerInformationUserDefaultKey = "MySummonerInformation"
    static let didSummonerSelectedUserDefaultKey = "DidSummonerSelected"
}
