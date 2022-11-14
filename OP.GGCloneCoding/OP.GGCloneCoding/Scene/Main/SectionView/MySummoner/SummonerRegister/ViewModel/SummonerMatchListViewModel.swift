//
//  SummonerMatchListViewModel.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/10.
//

import UIKit

struct SummonerMatchListViewModel: ViewModel {
    
    // MARK: Properties
    
    private let summonerMatchListUsecase = SummonerMatchListUseCase()
    private let output: Output
    lazy var input = Input(
        fetchSummonerMatchListInformation: fetchSummonerMatchListInformation(puuid:)
    )

    // MARK: - Initializers
    
    init(output: Output) {
        self.output = output
    }
    
    // MARK: - Methods

    private func fetchSummonerMatchListInformation(puuid: String) {
        summonerMatchListUsecase.searchSummonerMatch(puuid: puuid) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let summonerMatchList):
                    print(summonerMatchList)
                    let archivedMatchListData = try? JSONEncoder().encode(
                        summonerMatchList
                    )

                    UserDefaults.standard.set(
                        archivedMatchListData,
                        forKey: "MySummonerMatchListInformation"
                    )
                    output.fetchMatchInformation()
                case .failure(let error):
                    output.showErrorAlert(
                        ErrorAlertController.unknownError(error as? APIError).value
                    )
                }
            }
        }
    }
}

extension SummonerMatchListViewModel {
    struct Input {
        let fetchSummonerMatchListInformation: (String) -> Void
    }

    struct Output {
        let fetchMatchInformation: () -> Void
        let showErrorAlert: (UIAlertController) -> Void
    }
}
