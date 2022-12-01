//
//  SummonerRegisterViewModel.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/09.
//

import UIKit

struct SummonerSearchViewModel: ViewModel {
    
    // MARK: Properties
    
    private let summonerSearchUsecase: SummonerSearchUseCase = SummonerSearchUseCase()
    private let output: Output
    lazy var input = Input(completeButtonDidTap: completeButtonDidTap(name:))

    // MARK: - Initializers
    
    init(output: Output) {
        self.output = output
    }
    
    // MARK: - Methods

    private func completeButtonDidTap(name: String) {
        summonerSearchUsecase.searchSummoner(name: name) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let summoner):
                    UserDefaults.standard.set(true, forKey: "DidSummonerSelected")
                    UserDefaults.standard.set(summoner.name, forKey: "MySummoner")

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
