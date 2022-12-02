//
//  CoreDataSummonerRankTierStorage.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/12/01.
//

import CoreData

final class CoreDataSummonerRankTierStorage: CoreDataSummonerStorage {

    // MARK: Property

    static let shared = CoreDataSummonerRankTierStorage()
    private let coreDataStorage: CoreDataStorage

    // MARK: - Initializer

    init(coreDataStorage: CoreDataStorage = CoreDataStorage.shared) {
        self.coreDataStorage = coreDataStorage
    }

    // MARK: - Methods

    func fetchRequest<T: NSManagedObject>(id: String) -> NSFetchRequest<T>? {

        guard let request = T.fetchRequest() as? NSFetchRequest<T> else {
            return nil
        }

        request.predicate = NSPredicate(format: "summonerID = %@", id)

        return request
    }

    func create(data: RiotAPIResponseDTO.LeagueEntryDTO) {
        let context = coreDataStorage.loadContext()

        do {
            try SummonerRankTier.toEntity(by: data, in: context)
        } catch {
            fatalError("Unresolved error \(error), \((error as NSError).userInfo)")
        }
    }

    func update<T: NSManagedObject>(
        data: RiotAPIResponseDTO.LeagueEntryDTO,
        by request: NSFetchRequest<T>
    ) {
        delete(by: request)
        create(data: data)
    }
}
