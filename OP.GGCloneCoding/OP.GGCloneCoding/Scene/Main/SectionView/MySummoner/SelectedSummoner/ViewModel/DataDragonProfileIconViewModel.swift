//
//  DataDragonProfileIconViewModel.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/16.
//

import UIKit

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
        dataDragonProfileIconUseCase.searchProfileIcon(version: version) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let profileIcon):
                    output.setupContents(profileIcon)
                    fetchSummoner()
                case .failure(let error):
                    output.showErrorAlert(
                        ErrorAlertController.unknownError(error as? APIError).value
                    )
                }
            }
        }
        
    }
    
    private func fetchSummoner() {
        guard let summoner = dataDragonProfileIconUseCase.getSummoner() else {
            return
        }
        
        output.setupContentsWithSummoner(summoner)
    }
}

extension DataDragonProfileIconViewModel {
    struct Input {
        let fetchProfileIconImage: (String) -> Void
    }

    struct Output {
        let setupContents: (UIImage) -> Void
        let setupContentsWithSummoner: (Summoner) -> Void
        let showErrorAlert: (UIAlertController) -> Void
    }
}
