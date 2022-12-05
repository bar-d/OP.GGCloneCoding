# OP.GG CloneCoding README.md

## 프로젝트 저장소
> 프로젝트 기간: 2022-10-16 ~ </br>
> 팀원: [바드](https://github.com/bar-d), [수꿍](https://github.com/Jeon-Minsu)</br>
그라운드롤: [GroundRule - Wiki](https://github.com/bar-d/OP.GGCloneCoding/wiki/GroundRule)

## 📑 목차
- [개발자 소개](#개발자-소개)
- [프로젝트 소개](#프로젝트-소개)
- [키노트 pdf](#키노트-pdf)
- [폴더 구조](#폴더-구조)
- [구현화면](#구현화면)
- [주요기능설명](#주요기능설명)
- [Network_Wiki](#Network_Wiki)
- [Scene_Wiki](#Scene_Wiki)
- [TroubleShooting](#TroubleShooting)

## 개발자 소개
|[바드](https://github.com/bar-d)|[수꿍](https://github.com/Jeon-Minsu)|
|:---:|:---:|
| <img src = "https://i.imgur.com/k9hX1UH.png" width="250" height="250">| <img src = "https://i.imgur.com/8RLiJxt.jpg" width="250" height="250"> |


## 프로젝트 소개

[<img src="https://i.imgur.com/8m9M82i.png" style="border-radius:20%">](https://apps.apple.com/kr/app/op-gg-오피지지/id605722237)

- LeagueOfLegends 사용자 전적 검색 어플리케이션 [OP.GG](https://apps.apple.com/kr/app/op-gg-오피지지/id605722237) 클론 코딩
- 메인 뷰 및 설정 뷰 구현


### 개발환경
![](https://img.shields.io/badge/Xcode-14.0-blue) ![](https://img.shields.io/badge/Swift-5.7-orange) 
![](https://img.shields.io/badge/Lottie-3.5.0-yellowgreen) ![](https://img.shields.io/badge/SPM-0.6.0-important) ![](https://img.shields.io/badge/SwiftSoup-2.4.3-red) 

### Target Version
![](https://img.shields.io/badge/iOS-13.0-informational) ![](https://img.shields.io/badge/OP.GG-6.3.3(2)-blue) 

### API

[Riot Developer API](https://developer.riotgames.com/apis)


### Architecture
#### MVVM
- Model
    - 프로젝트 레벨 비즈니스 로직 처리
- View
    - 디스플레이 표시
    - ViewModel로의 event 전달
- ViewModel
    - 프레젠테이션 로직 처리
    
#### Clean Architecture

![](https://i.imgur.com/nIJCIyn.png)



## 키노트 pdf
- [프로젝트 진행하면서 작성한 키노트](https://github.com/bar-d/OP.GGCloneCoding/wiki/KeyNote-PDF)

## 폴더 구조
<details>
<summary> Detail </summary>   

```
└── OP.GGCloneCoding
    └── OP.GGCloneCoding
        ├── Application
        ├── Builder
        ├── Data
        │   ├── Network
        │   │   └── DataMapping
        │   └── Repositories
        ├── Domain
        │   ├── Entities
        │   ├── Interface
        │   │   └── Repositories
        │   └── UseCases
        ├── Extension
        ├── Infrastructure
        │   └── Network
        │       ├── Common
        │       └── RiotAPI
        ├── PreviewHelpers
        ├── Protocol
        ├── Resource
        │   ├── Assets.xcassets
        │   ├── LaunchScreen.storyboard
        │   ├── Info.plist
        │   └── LoadingIndicator.json
        └── Scene
            ├── Common
            │   ├── Section
            │   ├── View
            │   └── ViewModel
            ├── Main
            │   ├── SectionView
            │   │   ├── ChampionTier
            │   │   │   └── PositionTabBar
            │   │   ├── ChampiosAndSkinOnSale
            │   │   ├── FavoriteChampion
            │   │   ├── FavoriteSummoner
            │   │   │   └── SummonerSearch
            │   │   ├── MoreInformation
            │   │   ├── MySummoner
            │   │   │   ├── SelectedSummoner
            │   │   │   │   ├── View
            │   │   │   │   └── ViewModel
            │   │   │   ├── SummonerRegister
            │   │   │   │   ├── View
            │   │   │   │   └── ViewModel
            │   │   │   └── UnselectedSummoner
            │   │   │       └── View
            │   │   ├── OtherGames
            │   │   ├── PatchNote
            │   │   └── TodayTMI
            │   ├── SummonderDetail
            │   │   ├── AdditionalInformation
            │   │   ├── SummonerInformationTableView
            │   │   ├── SummonerInformationTableViewCell
            │   │   │   └── LeftView
            │   │   ├── TierView
            │   │   ├── TopView
            │   │   └── ViewModel
            │   └── View
            └── Settings
                ├── SectionCell
                └── View
                    ├── LanguageSelection
                    └── ThemeSelection
```

</div>
</details>


## 구현화면
### 메인뷰
|라이트모드|다크모드|
|:---:|:---:|
| <img src = "https://i.imgur.com/m2PYJg9.gif" width="300" height="600">| <img src = "https://i.imgur.com/4Lnl0Mz.gif" width="300" height="600"> |

### 설정뷰


|라이트모드|다크모드|
|:---:|:---:|
| <img src = "https://i.imgur.com/CsEfSb4.gif" width="300" height="600">| <img src = "https://i.imgur.com/t36NN9v.gif" width="300" height="600"> |


## 주요기능설명

### Networking



## 🚀TroubleShooting

---


## [Network_Wiki](https://github.com/bar-d/ios-diary/wiki/Step1)
## [Scene_Wiki](https://github.com/bar-d/ios-diary/wiki/Step2)
## [TroubleShooting](https://github.com/bar-d/ios-diary/wiki/TroubleShooting)
