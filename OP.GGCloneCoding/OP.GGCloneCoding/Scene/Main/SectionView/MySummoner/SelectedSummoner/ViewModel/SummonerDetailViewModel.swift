//
//  SummonerDetailViewModel.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/18.
//

import UIKit
import CoreData

struct SummonerDetailViewModel: ViewModel {

    // MARK: Properties

    private let dataDragonChampionIconUseCase = DataDragonChampionIconUseCase()
    private let output: Output
    lazy var input = Input(fetchChampionInformation: fetchChampionIconImage)

    // MARK: - Initializers

    init(output: Output) {
        self.output = output
    }

    // MARK: - Methods

    private func fetchChampionIconImage(with version: String) {
        guard let unarchivedSummonerMatchData = UserDefaults.standard.object(forKey: "MySummonerMatchInformation") as? Data,
              let summonerMatchArray = try? JSONDecoder().decode([SummonerMatch].self, from: unarchivedSummonerMatchData) else {
            return
        }

        guard let mySummoner = UserDefaults.standard.string(forKey: "MySummoner"),
              let request: NSFetchRequest<SummonerInformation> = CoreDataSummonerInformationStorage.shared.fetchRequest(by: mySummoner),
              let storedData = CoreDataSummonerInformationStorage.shared.read(by: request) else {
            return
        }

        let myChampionPicks = summonerMatchArray.compactMap { (match) -> String? in
            let filteredArray = match.participants.filter { participant in

                return participant.summonerName == storedData.name
            }

            return filteredArray.first?.championName
        }

        guard !myChampionPicks.isEmpty else {
            return
        }

        let selectedChampionSet = NSCountedSet(array: myChampionPicks)
        let sortedSelectedChampionArray = selectedChampionSet
            .sorted { selectedChampionSet.count(for: $0) > selectedChampionSet.count(for: $1) }
            .map { element in
                guard let stringElement = element as? String else {
                    return ""
                }

                return stringElement
            }

        let labels = setupChampionLabels(champions: sortedSelectedChampionArray)
        output.setupChampionLabels(labels)

        let count = sortedSelectedChampionArray.count >= 3 ? 3 : sortedSelectedChampionArray.count
        var fetchedChampionIconArray: [UIImage] = []

        for i in 0..<count {
            dataDragonChampionIconUseCase.searchChampionIcon(
                version: version,
                championName: sortedSelectedChampionArray[i]
            ) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let profileIcon):
                        fetchedChampionIconArray.append(profileIcon)
                        if fetchedChampionIconArray.count == count {
                            output.setupChampionIconImage(fetchedChampionIconArray)
                        }
                    case .failure(let error):
                        output.showErrorAlert(
                            ErrorAlertController.unknownError(error as? APIError).value
                        )
                    }
                }
            }
        }
    }

    private func setupChampionLabels(champions: [String]) -> [(Int, Double)] {
        guard let unarchivedSummonerMatchData = UserDefaults.standard.object(forKey: "MySummonerMatchInformation") as? Data,
              let summonerMatchArray = try? JSONDecoder().decode([SummonerMatch].self, from: unarchivedSummonerMatchData) else {
            return []
        }

        guard let mySummoner = UserDefaults.standard.string(forKey: "MySummoner"),
              let request: NSFetchRequest<SummonerInformation> = CoreDataSummonerInformationStorage.shared.fetchRequest(by: mySummoner),
              let storedData = CoreDataSummonerInformationStorage.shared.read(by: request) else {
            return []
        }

        let myChampionPicks = summonerMatchArray.compactMap { (match) -> SummonerMatch.Participant? in
            let filteredArray = match.participants.filter { participant in

                return participant.summonerName == storedData.name
            }

            return filteredArray.first
        }

        guard !myChampionPicks.isEmpty else {
            return []
        }

        var arrayOfChampionWinRateAndKDA: [(Int, Double)] = []

        let count = champions.count >= 3 ? 3 : champions.count

        for i in 0..<count {

            let championMatch = myChampionPicks
                .filter { $0.championName == champions[i] }

            let championWinRate = 100 * championMatch.filter({ $0.win == true }).count / championMatch.count

            let championKDA = championMatch
                .reduce(0) { partialResult, participant in
                    return partialResult + participant.kda / Double(championMatch.count)
                }

            arrayOfChampionWinRateAndKDA.append((championWinRate, championKDA))
        }

        return arrayOfChampionWinRateAndKDA
    }
}

extension SummonerDetailViewModel {
    struct Input {
        let fetchChampionInformation: (String) -> Void
    }

    struct Output {
        let setupChampionIconImage: ([UIImage]) -> Void
        let setupChampionLabels: ([(Int, Double)]) -> Void
        let showErrorAlert: (UIAlertController) -> Void
    }
}
