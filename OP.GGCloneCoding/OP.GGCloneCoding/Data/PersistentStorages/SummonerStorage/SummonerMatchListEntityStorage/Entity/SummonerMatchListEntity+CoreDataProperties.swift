//
//  SummonerMatchListEntity+CoreDataProperties.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/12/02.
//
//

import CoreData

extension SummonerMatchListEntity {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<SummonerMatchListEntity> {
        return NSFetchRequest<SummonerMatchListEntity>(entityName: "SummonerMatchListEntity")
    }

    @NSManaged public var identifier: String
    @NSManaged public var matchList: [String]
    @NSManaged public var puuid: String
}

extension SummonerMatchListEntity {
    class func toEntity(by data: [String], in context: NSManagedObjectContext) throws {
        guard let mySummoner = UserDefaults.standard.string(forKey: "MySummoner"),
              let request: NSFetchRequest<SummonerInformation> = CoreDataSummonerInformationStorage.shared.fetchRequest(by: mySummoner),
              let storedData = CoreDataSummonerInformationStorage.shared.read(by: request) else {
            return
        }

        let summonerMatchListEntity = SummonerMatchListEntity(context: context)

        summonerMatchListEntity.setValue(
            storedData.name.convertToIdentifier(),
            forKey: "identifier"
        )
        summonerMatchListEntity.setValue(
            storedData.puuid,
            forKey: "puuid"
        )
        summonerMatchListEntity.setValue(
            data,
            forKey: "matchList"
        )

        try CoreDataStorage.shared.save(context)
    }
}
