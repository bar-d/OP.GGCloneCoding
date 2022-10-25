//
//  MainSection.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/24.
//

import UIKit

enum MainSection: Int ,CaseIterable {
    case mySummoner
    case favoriteSummoner
    case patchNote
    case favoriteChampions
    case championTier
    case todayTMI
    case saleSkinsAndChampion
    case anotherGame
    case additionalInformation
    
    var cell: UITableViewCell {
        switch self {
        case .mySummoner:
            return MySummonerCell()
        case .favoriteSummoner:
            return FavoriteSummonersCell()
        case .patchNote:
            return PatchNoteCell()
        case .favoriteChampions:
            return FavoriteChampionCell()
        case .championTier:
            return MySummonerCell()
        case .todayTMI:
            return TodayTMICell()
        case .saleSkinsAndChampion:
            return ChampionsAndSkinsOnSaleCell()
        case .anotherGame:
            return MySummonerCell()
        case .additionalInformation:
            return MySummonerCell()
        }
    }
}
