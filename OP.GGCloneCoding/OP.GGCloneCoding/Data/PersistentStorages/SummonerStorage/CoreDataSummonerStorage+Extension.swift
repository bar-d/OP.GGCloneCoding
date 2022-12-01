//
//  CoreDataSummonerStorage+Extension.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/29.
//

import CoreData

extension CoreDataSummonerStorage {
    func fetchRequest<T: NSManagedObject>(by identifier: String) -> NSFetchRequest<T>? {

        guard let request = T.fetchRequest() as? NSFetchRequest<T> else {
            return nil
        }

        request.predicate = NSPredicate(
            format: "identifier = %@",
            identifier.convertToIdentifier()
        )

        return request
    }

    func fetchAllRequest<T: NSManagedObject>() -> NSFetchRequest<T>? {
        return T.fetchRequest() as? NSFetchRequest<T>
    }

    func read<T: NSManagedObject>(by request: NSFetchRequest<T>) -> T? {
        let context = CoreDataStorage.shared.loadContext()

        do {
            guard let requestEntity = try context.fetch(request).first else {
                return nil
            }

            return requestEntity
        } catch {
            return nil
        }
    }

    func delete<T: NSManagedObject>(by request: NSFetchRequest<T>) {
        let context = CoreDataStorage.shared.loadContext()

        do {
            if let result = try context.fetch(request).first {
                context.delete(result)
            }
        } catch  {
            fatalError("Unresolved error \(error), \((error as NSError).userInfo)")
        }
    }

    func deleteAll<T: NSManagedObject>(objectType: T.Type) {
        let context = CoreDataStorage.shared.loadContext()
        let request = T.fetchRequest()
        let delete = NSBatchDeleteRequest(fetchRequest: request)

        do {
            try context.execute(delete)
        } catch {
            fatalError("Unresolved error \(error), \((error as NSError).userInfo)")
        }
    }

    func isEmpty<T: NSManagedObject>(by request: NSFetchRequest<T>) -> Bool {
        let context = CoreDataStorage.shared.loadContext()

        do {
            let summonerInformations = try context.fetch(request)

            if summonerInformations.isEmpty {
                return true
            }
        } catch {
            fatalError("Unresolved error \(error), \((error as NSError).userInfo)")
        }

        return false
    }
}
