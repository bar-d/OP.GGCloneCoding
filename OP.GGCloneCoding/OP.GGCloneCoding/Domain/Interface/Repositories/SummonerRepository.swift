//
//  SummonerRepository.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/04.
//

protocol SummonerRepository {
    func fetchSummonerInformation(
        name: String,
        completion: @escaping (Result<SummonerUnit, Error>) -> Void
    )
}
