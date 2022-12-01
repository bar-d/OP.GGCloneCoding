//
//  SummonerInformation+CoreDataProperties.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/28.
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

extension SummonerInformation {
    func toDTO() -> RiotAPIResponseDTO.SummonerDTO {
        return .init(
            id: id,
            puuid: puuid,
            name: name,
            profileIconID: Int(profileIconID),
            summonerLevel: Int(level)
        )
    }

    class func toEntity(by data: RiotAPIResponseDTO.SummonerDTO, in context: NSManagedObjectContext) throws {
        let summoner = SummonerInformation(context: context)

        summoner.setValue(
            data.name.convertToIdentifier(),
            forKey: "identifier"
        )
        summoner.setValue(
            data.id,
            forKey: "id"
        )
        summoner.setValue(
            data.puuid,
            forKey: "puuid"
        )
        summoner.setValue(
            data.name,
            forKey: "name"
        )
        summoner.setValue(
            Int64(data.profileIconID),
            forKey: "profileIconID"
        )
        summoner.setValue(
            Int64(data.summonerLevel),
            forKey: "level"
        )

        try CoreDataStorage.shared.save(context)
    }
}
