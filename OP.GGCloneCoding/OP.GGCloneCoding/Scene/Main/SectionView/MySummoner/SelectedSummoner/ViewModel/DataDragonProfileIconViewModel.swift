//
//  DataDragonProfileIconViewModel.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/16.
//

import UIKit
import CoreData

struct DataDragonProfileIconViewModel: ViewModel {

    // MARK: Properties

    private let dataDragonProfileIconUseCase = DataDragonProfileIconUseCase()
    private let output: Output
    lazy var input = Input(fetchProfileIconImage: fetchProfileIconImage)

    // MARK: - Initializers

    init(output: Output) {
        self.output = output
    }

    // MARK: - Methods

    private func fetchProfileIconImage(with version: String) {
        guard let mySummoner = UserDefaults.standard.string(forKey: "MySummoner"),
              let request: NSFetchRequest<SummonerInformation> = CoreDataSummonerInformationStorage.shared.fetchRequest(by: mySummoner),
              let storedData = CoreDataSummonerInformationStorage.shared.read(by: request) else {
            return
        }

        dataDragonProfileIconUseCase.searchProfileIcon(version: version, iconID: String(storedData.profileIconID)) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let profileIcon):
                    output.setupContents(profileIcon)
                case .failure(let error):
                    output.showErrorAlert(
                        ErrorAlertController.unknownError(error as? APIError).value
                    )
                }
            }
        }
    }
}

extension DataDragonProfileIconViewModel {
    struct Input {
        let fetchProfileIconImage: (String) -> Void
    }

    struct Output {
        let setupContents: (UIImage) -> Void
        let showErrorAlert: (UIAlertController) -> Void
    }
}
