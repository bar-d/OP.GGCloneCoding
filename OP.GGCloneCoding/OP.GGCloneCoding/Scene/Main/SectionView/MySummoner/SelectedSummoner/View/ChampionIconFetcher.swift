//
//  ChampionIconFetcher.swift
//  OP.GGCloneCoding
//
//  Created by λ°λ, μκΏ on 2022/11/22.
//

protocol ChampionIconFetcher: AnyObject {
    func fetchChampionInformation(with versionID: String)
}
