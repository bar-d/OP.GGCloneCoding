//
//  CoreDataSummonerMatchEntityStorage.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/12/02.
//

import CoreData

final class CoreDataSummonerMatchEntityStorage: CoreDataSummonerStorage {

    // MARK: Property

    static let shared = CoreDataSummonerMatchEntityStorage()
    private let coreDataStorage: CoreDataStorage

    // MARK: - Initializer

    init(coreDataStorage: CoreDataStorage = CoreDataStorage.shared) {
        self.coreDataStorage = coreDataStorage
    }

    // MARK: - Methods

    func fetchRequest<T: NSManagedObject>(matchID: String) -> NSFetchRequest<T>? {

        guard let request = T.fetchRequest() as? NSFetchRequest<T> else {
            return nil
        }

        request.predicate = NSPredicate(format: "matchID = %@", matchID)

        return request
    }

    func createUsing(matchID: String, data: RiotAPIResponseDTO.MatchDTO) {
        let context = coreDataStorage.loadContext()

        do {
            try SummonerMatchEntity.toEntity(with: matchID, by: data, in: context)
        } catch {
            fatalError("Unresolved error \(error), \((error as NSError).userInfo)")
        }
    }

    func update<T: NSManagedObject>(
        matchID: String,
        data: RiotAPIResponseDTO.MatchDTO,
        by request: NSFetchRequest<T>
    ) {
        delete(by: request)
        createUsing(matchID: matchID, data: data)
    }
}
