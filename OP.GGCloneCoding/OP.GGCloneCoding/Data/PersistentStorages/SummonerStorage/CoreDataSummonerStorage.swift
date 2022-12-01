//
//  CoreDataSummonerStorage.swift
//  OP.GGCloneCoding
//
//  Created by 전민수 on 2022/11/29.
//

import CoreData

protocol CoreDataSummonerStorage {
    func fetchRequest<T: NSManagedObject>(by identifier: String) -> NSFetchRequest<T>?
    func fetchAllRequest<T: NSManagedObject>() -> NSFetchRequest<T>?
    func read<T: NSManagedObject>(by request: NSFetchRequest<T>) -> T?
    func delete<T: NSManagedObject>(by request: NSFetchRequest<T>)
    func deleteAll<T: NSManagedObject>(objectType: T.Type)
    func isEmpty<T: NSManagedObject>(by request: NSFetchRequest<T>) -> Bool
}
