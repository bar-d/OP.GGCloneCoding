//
//  NSMatchTransformer.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/12/05.
//

import Foundation

final class NSMatchTransformer: ValueTransformer {
    override func transformedValue(_ value: Any?) -> Any? {
        guard let match = value as? InfoEntity else {
            return nil
        }

        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: match, requiringSecureCoding: true)
            print("InfoEntity 정상 저장 완료🥰")
            return data
        } catch {
            print("InfoEntity 정상 저장 실패🥶")
            return nil
        }
    }

    override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let data = value as? Data else { return nil }

        do {

            let match = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? InfoEntity
//            let match = try NSKeyedUnarchiver.unarchivedObject(ofClass: InfoEntity.self, from: data)
            print("InfoEntity 정상 로드 완료🥰")
            return match
        } catch {
            print("InfoEntity 정상 로드 실패🥶")
            return nil
        }
    }
}
