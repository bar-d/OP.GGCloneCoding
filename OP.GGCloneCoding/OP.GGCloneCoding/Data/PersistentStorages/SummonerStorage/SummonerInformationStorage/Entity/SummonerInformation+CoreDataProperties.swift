//
//  SummonerInformation+CoreDataProperties.swift
//  OP.GGCloneCoding
//
//  Created by 전민수 on 2022/11/28.
//
//

import CoreData

extension SummonerInformation {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SummonerInformation> {
        return NSFetchRequest<SummonerInformation>(entityName: "SummonerInformation")
    }

    @NSManaged public var identifier: String
    @NSManaged public var id: String
    @NSManaged public var puuid: String
    @NSManaged public var name: String
    @NSManaged public var level: Int64
    @NSManaged public var profileIconID: Int64
}
