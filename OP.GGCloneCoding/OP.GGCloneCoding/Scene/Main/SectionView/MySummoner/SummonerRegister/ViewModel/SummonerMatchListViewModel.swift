//
//  SummonerMatchListViewModel.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/10.
//

import UIKit

struct SummonerMatchListViewModel: ViewModel {

    // MARK: Properties

    private let summonerMatchListUseCase = SummonerMatchListUseCase()
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
        summonerMatchListUseCase.searchSummonerMatch(puuid: puuid) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let summonerMatchList):
                    /// 별도 저장까진 필요없을 것 같으니 보류
                    // let archivedMatchListData = try? JSONEncoder().encode(summonerMatchList)

                    // match userdefaults 저장을 matchID로 해서 필요 -> 다시 필요 없어져서 보류
                    // UserDefaults.standard.set(
                    //     archivedMatchListData,
                    //     forKey: Design.userDefaultsKey
                    // )

                    output.fetchSummonerMatchInformation(summonerMatchList)
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
        let fetchSummonerMatchInformation: ([String]) -> Void
        let showErrorAlert: (UIAlertController) -> Void
    }
}

// MARK: - Namespace

private enum Design {
    static let userDefaultsKey = "MySummonerMatchListInformation"
}
