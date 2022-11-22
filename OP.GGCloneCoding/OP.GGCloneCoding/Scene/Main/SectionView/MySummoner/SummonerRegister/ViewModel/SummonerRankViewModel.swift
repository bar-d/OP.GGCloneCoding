//
//  SummonerRankViewModel.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/10.
//

import UIKit

struct SummonerRankViewModel: ViewModel {
    
    // MARK: Properties
    
    private let summonerRankUsecase: SummonerRankUseCase = SummonerRankUseCase()
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
        summonerRankUsecase.searchSummonerRank(encryptedId: encryptedID) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let summonerRankArray):
                    print(summonerRankArray)
                    let archivedRankData = try? JSONEncoder().encode(summonerRankArray)
                    // UserDefaults는 비즈니스 로직인가?
                    UserDefaults.standard.set(
                        archivedRankData,
                        forKey: Design.userDefaultsKey
                    )
                case .failure(let error):
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

// MARK: - Namespace

private enum Design {
    static let userDefaultsKey = "MySummonerRankInformation"
}
