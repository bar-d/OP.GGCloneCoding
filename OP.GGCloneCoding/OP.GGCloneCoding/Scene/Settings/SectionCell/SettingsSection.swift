//
//  SettingsSection.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/20.
//

enum SettingsSection: Int, CaseIterable {
    case login
    case pushNotification
    case championTabSettings
    case language
    case theme
    case userReport
    case policy
    case version
    
    var array: [String] {
        switch self {
        case .login:
            return ["로그인"]
        case .pushNotification:
            return ["푸시 알림", "개인 정보 알림", "커뮤니티 알림"]
        case .championTabSettings:
            return ["챔피언 화면 기본 탭 설정"]
        case .language:
            return ["언어 선택"]
        case .theme:
            return ["기본 테마 설정"]
        case .userReport:
            return ["버그제보 및 건의하기", "리뷰쓰러 가기"]
        case .policy:
            return ["이용약관", "개인정보 처리방침"]
        case .version:
            return ["버전 6.3.3 (2)"]
        }
    }
    
    var indicator: String {
        switch self {
        case .login:
            return ""
        case .pushNotification:
            return ""
        case .championTabSettings:
            return "정보"
        case .language:
            return "🇰🇷 한국어"
        case .theme:
            return "라이트 모드"
        case .userReport:
            return""
        case .policy:
            return ""
        case .version:
            return ""
        }
    }
}
