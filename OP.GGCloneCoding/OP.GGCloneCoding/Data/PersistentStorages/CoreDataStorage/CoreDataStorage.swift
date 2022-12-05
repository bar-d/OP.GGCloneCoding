//
//  CoreDataStorage.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/25.
//

import CoreData

final class CoreDataStorage {

    // MARK: Properties

    static let shared = CoreDataStorage()

    private let persistentContainer: NSPersistentContainer = {
        ValueTransformer.setValueTransformer(NSMatchTransformer(), forName: NSValueTransformerName("NSMatchTransformer"))

        let container = NSPersistentContainer(name: "Summoner")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })

        return container
    }()

    // MARK: - Method

    func save(_ context: NSManagedObjectContext) throws {
        guard context.hasChanges else {
            return
        }

        do {
            try context.save()
        } catch {
            fatalError("Unresolved error \(error), \((error as NSError).userInfo)")
        }
    }

    func performBackgroundTask(_ block: @escaping (NSManagedObjectContext) -> Void) {
        persistentContainer.performBackgroundTask(block)
    }

    func loadContext() -> NSManagedObjectContext {
        return persistentContainer.viewContext
    }
}
