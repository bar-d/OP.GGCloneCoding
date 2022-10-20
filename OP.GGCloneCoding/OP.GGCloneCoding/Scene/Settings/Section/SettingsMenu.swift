//
//  SettingsMenu.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/20.
//

enum SettingsMenu: CaseIterable {
    case login
    case pushNotification
    case championDefaultView
    case language
    case defaultTheme
    case userReport
    case termsOfService
    case version
    
    var title: String {
        switch self {
        case .login:
            return "로그인"
        case .pushNotification:
            return "푸시 알림"
        case .championDefaultView:
            return "챔피언 화면 기본 탭 설정"
        case .language:
            return "언어 선택"
        case .defaultTheme:
            return "기본 테마 설정"
        case .userReport:
            return "버그제보 및 건의하기"
        case .termsOfService:
            return "이용약관"
        case .version:
            return "버전 6.3.2 (9)"
        }
    }
    
    var kindCount: Int {
        switch self {
        case .login:
            return 1
        case .pushNotification:
            return 2
        case .championDefaultView:
            return 1
        case .language:
            return 1
        case .defaultTheme:
            return 1
        case .userReport:
            return 2
        case .termsOfService:
            return 2
        case .version:
            return 1
        }
    }
}

