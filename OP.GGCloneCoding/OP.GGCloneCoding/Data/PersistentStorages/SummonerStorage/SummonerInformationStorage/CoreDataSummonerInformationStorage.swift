//
//  CoreDataSummonerInformationStorage.swift
//  OP.GGCloneCoding
//
//  Created by 전민수 on 2022/11/25.
//

import CoreData

final class CoreDataSummonerInformationStorage: CoreDataSummonerStorage {

    // MARK: Property

    static let shared = CoreDataSummonerInformationStorage()
    private let coreDataStorage: CoreDataStorage

    // MARK: - Initializer

    init(coreDataStorage: CoreDataStorage = CoreDataStorage.shared) {
        self.coreDataStorage = coreDataStorage
    }

    // MARK: - Methods

    func create(data: RiotAPIResponseDTO.SummonerDTO) {
        let context = coreDataStorage.loadContext()

        do {
            try SummonerInformation.toEntity(by: data, in: context)
        } catch {
            fatalError("Unresolved error \(error), \((error as NSError).userInfo)")
        }
    }

    func update<T: NSManagedObject>(
        data: RiotAPIResponseDTO.SummonerDTO,
        by request: NSFetchRequest<T>
    ) {
        delete(by: request)
        create(data: data)
    }
}
