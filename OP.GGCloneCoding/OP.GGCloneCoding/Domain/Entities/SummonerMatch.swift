//
//  SummonerMatch.swift
//  OP.GGCloneCoding
//
//  Created by 전민수 on 2022/11/10.
//

struct SummonerMatch: Codable {
    let summonerName: String // 찾고자하는 participants 특정
//            let wins: Bool // count로 변환해야함
//    //        let defeats: Bool
//            let kda: Float // 후에 모든 kda더해서 20으로 나눠주어야 함
//            let championID, championName: String // 승률 좋은 챔피언 KDA 계산을 위해
//            let encryptedSummonerID: String
//            let participants: [String]
//    
    private enum CodingKeys: String, CodingKey {
        case summonerName
    }
}

