//
//  DataDragonVersionViewModel.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/16.
//

import UIKit

struct DataDragonVersionViewModel: ViewModel {

    // MARK: Properties

    private let dataDragonVersionUseCase = DataDragonVersionUseCase()
    private let output: Output
    lazy var input = Input(fetchGameVersion: fetchGameVersion)

    // MARK: - Initializers

    init(output: Output) {
        self.output = output
    }

    // MARK: - Methods

    private func fetchGameVersion() {
        dataDragonVersionUseCase.searchGameVersion { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let version):
                    /// 추후 제거 필요
                    /// version 바탕으로 프로필 아이콘 가져오기
                    print(version)
                    
                    output.fetchProfileIconImage(version)
                    output.fetchChampionIconImage(version)
                case .failure(let error):
                    output.showErrorAlert(
                        ErrorAlertController.unknownError(error as? APIError).value
                    )
                }
            }
        }
    }
}

extension DataDragonVersionViewModel {
    struct Input {
        let fetchGameVersion: () -> Void
    }

    struct Output {
        let fetchProfileIconImage: (String) -> Void
        let fetchChampionIconImage: (String) -> Void
        let showErrorAlert: (UIAlertController) -> Void
    }
}
