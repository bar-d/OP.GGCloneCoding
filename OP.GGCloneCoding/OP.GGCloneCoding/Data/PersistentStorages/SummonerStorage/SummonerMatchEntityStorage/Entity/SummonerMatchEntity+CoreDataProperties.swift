//
//  SummonerMatchEntity+CoreDataProperties.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/12/05.
//
//

import CoreData

extension SummonerMatchEntity {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<SummonerMatchEntity> {
        return NSFetchRequest<SummonerMatchEntity>(entityName: "SummonerMatchEntity")
    }

    @NSManaged public var identifier: String
    @NSManaged public var info: InfoEntity
    @NSManaged public var matchID: String
}

extension SummonerMatchEntity {
    func toDTO() -> RiotAPIResponseDTO.MatchDTO {
        let participants = info.participants.map { participant in
            let stylesDTO = participant.perks.styles.map { styleEntity in
                let selections = styleEntity.selections.map { selectionEntity in
                    RiotAPIResponseDTO.MatchDTO.InfoDTO.ParticipantDTO.PerksDTO.StyleDTO.SelectionDTO(
                        perk: selectionEntity.perk,
                        var1: selectionEntity.var1,
                        var2: selectionEntity.var2,
                        var3: selectionEntity.var3
                    )
                }

                let styleDTO = RiotAPIResponseDTO.MatchDTO.InfoDTO.ParticipantDTO.PerksDTO.StyleDTO(
                    styleDescription: styleEntity.styleDescription,
                    selections: selections,
                    style: styleEntity.style
                )

                return styleDTO
            }

            let participantDTO = RiotAPIResponseDTO.MatchDTO.InfoDTO.ParticipantDTO(
                assists: participant.assists,
                challenges: participant.challenges,
                championID: participant.championID,
                championName: participant.championName,
                deaths: participant.deaths,
                doubleKills: participant.doubleKills,
                item0: participant.item0,
                item1: participant.item1,
                item2: participant.item2,
                item3: participant.item3,
                item4: participant.item4,
                item5: participant.item5,
                item6: participant.item6,
                kills: participant.kills,
                participantID: participant.participantID,
                pentaKills: participant.pentaKills,
                perks: RiotAPIResponseDTO.MatchDTO.InfoDTO.ParticipantDTO.PerksDTO(styles: stylesDTO),
                profileIcon: participant.profileIcon,
                puuid: participant.puuid,
                quadraKills: participant.quadraKills,
                summoner1ID: participant.summoner1ID,
                summoner2ID: participant.summoner2ID,
                summonerID: participant.summonerID,
                summonerLevel: participant.summonerLevel,
                summonerName: participant.summonerName,
                teamID: participant.teamID,
                tripleKills: participant.tripleKills,
                win: participant.win
            )

            return participantDTO
        }

        return .init(info: RiotAPIResponseDTO.MatchDTO.InfoDTO(
            gameCreation: info.gameCreation,
            gameDuration: info.gameDuration,
            gameEndTimestamp: info.gameEndTimestamp,
            gameMode: info.gameMode,
            gameStartTimestamp: info.gameStartTimestamp,
            participants: participants,
            queueID: info.queueID,
            teams: info.teams.map({ teamEntity in
                RiotAPIResponseDTO.MatchDTO.InfoDTO.TeamDTO(
                    teamID: teamEntity.teamID,
                    win: teamEntity.win
                )
            })
        ))
    }

    class func toEntity(with matchID: String, by data: RiotAPIResponseDTO.MatchDTO, in context: NSManagedObjectContext) throws {
        guard let mySummoner = UserDefaults.standard.string(forKey: "MySummoner"),
              let request: NSFetchRequest<SummonerInformation> = CoreDataSummonerInformationStorage.shared.fetchRequest(by: mySummoner),
              let storedData = CoreDataSummonerInformationStorage.shared.read(by: request) else {
            return
        }

        let summonerMatchEntity = SummonerMatchEntity(context: context)

        summonerMatchEntity.setValue(
            storedData.name.convertToIdentifier(),
            forKey: "identifier"
        )
        summonerMatchEntity.setValue(
            matchID,
            forKey: "matchID"
        )
        summonerMatchEntity.setValue(
            data.info.toEntity(),
            forKey: "info"
        )

        try CoreDataStorage.shared.save(context)
    }
}
