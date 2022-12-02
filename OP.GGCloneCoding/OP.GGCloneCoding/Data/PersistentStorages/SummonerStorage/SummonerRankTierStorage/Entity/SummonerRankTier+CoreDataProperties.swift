//
//  SummonerRankTier+CoreDataProperties.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/12/01.
//
//

import CoreData

extension SummonerRankTier {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<SummonerRankTier> {
        return NSFetchRequest<SummonerRankTier>(entityName: "SummonerRankTier")
    }

    @NSManaged public var queueType: String
    @NSManaged public var tier: String
    @NSManaged public var rank: String
    @NSManaged public var leaguePoints: Int64
    @NSManaged public var losses: Int64
    @NSManaged public var wins: Int64
    @NSManaged public var identifier: String
    @NSManaged public var summonerID: String
}

extension SummonerRankTier {
    func toDTO() -> RiotAPIResponseDTO.LeagueEntryDTO {
        return .init(
            summonerID: summonerID,
            queueType: queueType,
            tier: tier,
            rank: rank,
            leaguePoints: Int(leaguePoints),
            wins: Int(wins),
            losses: Int(losses)
        )
    }

    class func toEntity(by data: RiotAPIResponseDTO.LeagueEntryDTO, in context: NSManagedObjectContext) throws {
        guard let mySummoner = UserDefaults.standard.string(forKey: "MySummoner"),
              let request: NSFetchRequest<SummonerInformation> = CoreDataSummonerInformationStorage.shared.fetchRequest(by: mySummoner),
              let storedData = CoreDataSummonerInformationStorage.shared.read(name: request) else {
            return
        }

        let summonerRankTier = SummonerRankTier(context: context)

        summonerRankTier.setValue(
            storedData.name.convertToIdentifier(),
            forKey: "identifier"
        )
        summonerRankTier.setValue(
            data.summonerID,
            forKey: "summonerID"
        )
        summonerRankTier.setValue(
            data.queueType,
            forKey: "queueType"
        )
        summonerRankTier.setValue(
            data.tier,
            forKey: "tier"
        )
        summonerRankTier.setValue(
            data.rank,
            forKey: "rank"
        )
        summonerRankTier.setValue(
            Int64(data.leaguePoints),
            forKey: "leaguePoints"
        )
        summonerRankTier.setValue(
            Int64(data.wins),
            forKey: "wins"
        )
        summonerRankTier.setValue(
            Int64(data.losses),
            forKey: "losses"
        )

        try CoreDataStorage.shared.save(context)
    }
}
