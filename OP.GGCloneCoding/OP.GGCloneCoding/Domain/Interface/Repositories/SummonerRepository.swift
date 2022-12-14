//
//  SummonerRepository.swift
//  OP.GGCloneCoding
//
//  Created by λ°λ, μκΏ on 2022/11/04.
//

protocol SummonerRepository {
    func fetchSummonerInformation(
        id: String,
        completion: @escaping (Result<Summoner, Error>) -> Void
    )
}
