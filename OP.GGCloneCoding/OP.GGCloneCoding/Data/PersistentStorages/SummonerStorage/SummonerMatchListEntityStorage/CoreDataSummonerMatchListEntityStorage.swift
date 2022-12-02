//
//  CoreDataSummonerMatchListEntityStorage.swift
//  OP.GGCloneCoding
//
//  Created by 전민수 on 2022/12/02.
//

import CoreData

final class CoreDataSummonerMatchListEntityStorage: CoreDataSummonerStorage {

    // MARK: Property

    static let shared = CoreDataSummonerMatchListEntityStorage()
    private let coreDataStorage: CoreDataStorage

    // MARK: - Initializer

    init(coreDataStorage: CoreDataStorage = CoreDataStorage.shared) {
        self.coreDataStorage = coreDataStorage
    }

    // MARK: - Methods

    func fetchRequest<T: NSManagedObject>(puuid: String) -> NSFetchRequest<T>? {

        guard let request = T.fetchRequest() as? NSFetchRequest<T> else {
            return nil
        }

        request.predicate = NSPredicate(format: "puuid = %@", puuid)

        return request
    }

    func create(data: [String]) {
        let context = coreDataStorage.loadContext()

        do {
            try SummonerMatchListEntity.toEntity(by: data, in: context)
        } catch {
            fatalError("Unresolved error \(error), \((error as NSError).userInfo)")
        }
    }

    func update<T: NSManagedObject>(
        data: [String],
        by request: NSFetchRequest<T>
    ) {
        delete(by: request)
        create(data: data)
    }
}
