//
//  ChampionIconFetcher.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/22.
//

protocol ChampionIconFetcher: AnyObject {
    func fetchChampionInformation(with versionID: String)
}
