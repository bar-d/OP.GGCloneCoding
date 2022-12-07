# OP.GG CloneCoding README.md

## 프로젝트 저장소
> 프로젝트 기간: 2022-10-16 ~ 2022-12-07</br>
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
- `Model`
    - 프로젝트 레벨 비즈니스 로직 처리
- `View`
    - 디스플레이 표시
    - ViewModel로의 event 전달
- `ViewModel`
    - 프레젠테이션 로직 처리
    
#### Clean Architecture

![](https://i.imgur.com/nIJCIyn.png)

- 검색하고자 하는 소환사 이름을 `ViewModel`로 전달
- `ViewModel`에서 해당 소환사 이름을 바탕으로 네트워킹 메서드 호출
- `ViewModel`의 호출로 인한 `UseCase`의 네트워킹 메서드 호출
- `UseCase`의 호출로 인한 `Repository`의 네트워킹 메서드 호출
- `Repository`의 호출로 인한 `APIService` 내 실제 네트워킹 작업 실행
- `APIService` 네트워킹 결과물을 `Repository` -> `UseCase` -> `ViewModel`로 전달
- 네트워킹한 데이터를 바탕으로 `View`를 다시 그리기

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
| <img src = "https://user-images.githubusercontent.com/99063327/206126914-b8d0f37f-edd7-4d9d-ae8e-e6bfb0978811.gif" width="300" height="600">| <img src = "https://i.imgur.com/IVWRWNc.gif" width="300" height="600"> |


### 설정뷰

|라이트모드|다크모드|
|:---:|:---:|
| <img src = "https://i.imgur.com/CsEfSb4.gif" width="300" height="600">| <img src = "https://i.imgur.com/t36NN9v.gif" width="300" height="600"> |

### 네트워킹

|소환사등록|
|:---:|
| <img src = "https://i.imgur.com/g0p5AYT.gif" width="300" height="600">|


## 주요기능설명

### Networking
![](https://i.imgur.com/97l37cf.png)

![](https://i.imgur.com/uVktxzb.png)

<center><img src = "https://i.imgur.com/W03ut8J.png" width="500" height="500"></center>

- 소환사 이름을 바탕으로 기본 소환사 정보(`RiotSummonerAPIRequest`) 불러오기
- 기본 소환사 정보 네트워킹 성공시, 소환사 랭크(`RiotSummonerRankAPIRequest`), 소환사 경기 목록(`RiotSummonerMatchListAPIRequest`) 불러오기
- 소환사 경기 목록 네트워킹 성공시, 소환사 최근 10 경기(`RiotSummonerMatchAPIRequest`) 불러오기
- 위의 네트워킹 모두 성공시, 현재 게임 버전(`DataDragonVersionAPIRequest`) 불러오기
- 현재 게임 버전 네트워킹 성공시, 소환사 프로필 아이콘(`DataDragonProfileIconAPIRequest`), 사용 챔피언 아이콘(`DataDragonChampionIconAPIRequest`) 불러오기

## 🚀TroubleShooting
### 네트워크 : cache 구현
#### 문제상황
- `RiotAPIService`의 소환사의 기본 정보에서부터 `DataDragonAsset`의 `ChampionIcon`에 이르기까지
네트워킹 작업을 모두 구현한 이후 이를 실행하던 가운데, 서버로부터 불러오는 데이터의 양이 많아지다보니,
모든 데이터를 네트워킹할 때까지 사용자가 대기하는 시간이 길어지는 문제점을 발견
- UX 측면에서 매우 불편하다 판단하여 네트워킹 시간을 최소화하는 방법을 궁구할 필요를 느낌

#### 해결방법
- **네트워킹 비용을 최소화하기 위하여 `cache`를 사용하기로 결정**
    - 현재, 소환사 검색은 보통 일면식이 없는 소환사보다는 본인을 포함하여 자주 접한 소환사를 검색하는 경향 예상
    - 이는 이전에도 검색한 정보를 또 다시 검색할 수 있다는 의미
    - 이를 네트워킹이 아닌 기존 캐시에 접근한다면 자원을 훨씬 절약함과 동시에 UX 만족도를 높일 수 있다 판단
    - 특히, 나의 소환사의 경우에는 보통 자신의 게임 아이디를 설정해놓기 때문에 무엇보다도 캐싱이 필요한 부분

- **캐싱 방법으로 `CoreData` 방식 수용**
    - 이번 어플리케이션에서 다루고자하는 정보는 일회성보다는 다회성의 성격을 더 띄기 때문에 메모리 캐시보다는 디스크 캐시가 더욱 필요한 영역이라고 판단
    - `UserDefaults`와 `CoreData`를 각각의 기준을 바탕으로 판단
        - 현재 네트워킹해서 가져오는 데이터는 작은 데이터인가, 큰 데이터인가
        - 전역적으로 접근해야할 필요가 있는가
        - 속도가 중요한 작업인가
        - 동기화 처리 이슈의 중요도는 어느 정도인가 (`Thread safeness`)
        - `Image`를 `Archiving` 하는 것이 옳은 선택인가
        - 오버헤드가 발생하는가 (사용 기능에 비해 무거운 저장소를 사용하는가)
        - 관계형 데이터세트가 필요한가
        - 데이터 필터링이 필요한가
    - `SummonerInformation`, `SummonerRank`, `SummonerMatchList` 등의 네트워킹 데이터를 
CoreData의 Entity로 별도 관리

- **CoreData 적용을 통한 네트워킹 구조 변경**

    |기존 네트워킹 구조|
    |:---:|
    |<img src = "https://i.imgur.com/Buy3dv1.png" width="500" height="500">| 
    - 한번 소환사 검색을 한 이후라면, 소환사가 게임을 하지 않는한 정보는 변하지 않음을 발견
    - 즉, 소환사 경기목록을 중심으로 변화가 있는지 살펴보고, 변화가 없다면 이전의 네트워킹 데이터를 사용
    - 아이콘 이미지 또한 게임 버전이 바뀌지 않는 이상 변하지 않음
        
    |CoreData 적용 네트워킹 구조|
    |:---:|
    | <img src = "https://i.imgur.com/9zCqbzH.png" width="500" height="500">| 
    - 네트워킹은 전적갱신을 할 때, 혹은 해당 데이터가 존재하지 않을 때, 나아가, 소환사 최근 경기 목록이 캐시 데이터와 차이가 있으면 네트워킹을 하는 방식으로 개선

#### 결과
|네트워킹|캐싱|
|:---:|:---:|
| <img src = "https://i.imgur.com/c6EoxIt.gif" width="400" height="400">| <img src = "https://i.imgur.com/kJyzDOF.gif" width="400" height="400"> |


---
### SettingView : StickyHeaderView 구현
#### 문제상황

처음 해당 설정 뷰의 타이틀 뷰가 `LargeTitle` 처럼 나타나고,
아래로 스크롤을 하면 스크롤의 높이에 맞춰 `LargeTitle`이 위로 사라지고
네비게이션 바 타이틀 위치에 알파값이 조정되면서 타이틀이 나옴

처음 생각은 `UINavigationBar`의 `LargeTitle`을 통해 해줄 수 있을거라 생각 하지만 처음 생각과는 다르게 뜻대로 되지 않아서 `Custom Navigation Bar`를 구현 결정

`Custom Navigation Bar`를 구현한다 했지만, 어떤식으로 구현해야 할지 전혀 감을 못잡음

여러 방법으로 구글링을 시도하고, 기존 핸드폰에 깔려있는 어플들을 보면서 비슷한 사례를 찾다가
`StickyHeader`라는 키워드를 발견하고 현재 뷰에 적합한 사례를 찾음

참고 블로그: https://velog.io/@annapo/iOS-Sticky-Header-구현하기

#### 해결방법

|UI 구성|구현된 UI|
|:---:|:---:|
| <img src = "https://i.imgur.com/YUJmGF0.png" width="350" height="400">| <img src = "https://i.imgur.com/WYus5f5.gif" width="200" height="400"> |

- 설정 뷰의 전체적인 UI구성은 위 그림과 같음
`StickyHeaderView`를 해당 UI를 구현해주기 위해서는 
`HeaderView`, `StickyHeaderView`, `ScrollView가` 필요(`tableView` 및 `tabBar`는 구현된 상태)

- #### `HeaderView`
   먼저 `titleLabel`을 가지고 있는 `HeaderView`를 구현  
 `HeaderView`에서 동적으로 변경해줘야 하는 것을 `titleLabel`의 알파값
   `titleLabel`의 알파값을 변경해줄 수 있는 메서드를 `public` 메서드로 구현 

- #### `StikcyHeaderView`
   `HeaderView`를 구현했다면 `StickyHeaderView`를 구현
   우리가 `StickyHeaderView`에게 원하는 `dynamic autolayout`은 `topConstraint`
 -> 스크롤에 따라 그만큼의 값이 더해진 `topConstraint`를 구해야 함

- #### `TableView `
    `ScrollView` 내부에 `TableView`를 가지고 있으므로 테이블 뷰는 컨텐츠 자체 사이즈로 높이를 가지고 있고 자체 스크롤을 막고 `ScrollView`의 스크롤로 컨텐츠를 위아래로 움직일 수 있게끔 구현해야 함
`viewWillLayoutSubviews` 메서드를 재정의해 테이블뷰 `height`을 테이블 뷰 컨텐츠 사이즈로 설정 
- #### `ScrollView`
     `ScrollViewDelegate`를 이용해 스크롤에 따라 `dynamicAutolayout` 설정`ScrollView.contentOffset.y`에 `headerView`와 `StickyHeaderView`의 높이 차이만큼을 더하여 `stickyHeaderView`의 `topConstraint`에 제약을 동적으로 설정

  다만 스크롤을 위로 할 때는 `topConstraint`를 0으로 제한
위로 스크롤을 할 때는 `topConstraint`의 `dynamic autolayout`이 필요없음
아래로 스크롤 할 때도 마찬가지로 `topConstraint`는 `HeaderView`와 `StickyHeaderView` 높이 차이만큼만 움직이면 되므로 `HeaderView` 높이만큼 제한

  `scrollViewDidScroll` 메서드에서 위에서 계산한 대로 움직이게끔 구현 
`topConstraint`의 값을 `HeaderView` 높이로 나누면 `HeaderView`의 `titleLabel`의 알파값도 0에서 1만큼 `StickyHeaderView`가 올라가는 만큼 동적으로 변경

  주의해야할 점은 `StickyHeaderView`와 `HeaderView`의 차이만큼 `scrollview`의 `contentInset`을 설정해주어야 `StickyHeaderView`와 같이 변화가 일어남
  
### SettingView : StickyHeaderView와 TableView간 스크롤 오작동
#### 문제상황
- 위로 스크롤 할 시, `Sticky HeaderView`가 사라짐과 동시에 `scrollView` 내 `TableView` 또한 사라지기 시작

|문제의 UI|
|:---:|
| <img src = "https://i.imgur.com/Ny5z88f.gif" width="200" height="400"> |

#### 해결방법
- 목표 화면은 설정과 로그인이 위로 스크롤 할 시에는 붙어서 같이 위로 이동하고, 
아래로 스크롤 할 시, `TableView`만 스크롤이 이루어졌음

- 이에, `TableView`가 바로 사라지지 못하게, `TableView`에 `inset`을 설정하여,
 어느정도 `TableView`의 내용물(cell)이 어느정도 올라간 후에야 사라지도록 설정

- 이에 따라, 기존의 `scrollView`는 `top constant`가 `headerView Max Height`에서 시작했는데,
`Min Height`로 수정하고, 대신 `inset`을 `(Max Height - Min Height)`으로 설정하여 이를 보강

### SettingView : Custom Modal ViewController 구현

#### 문제상황
- 언어 선택이나 기본 테마 설정 셀을 선택했을 때는 `modal view`를 띄어줘야 하는데, 
기존의 Apple에서 제공하는 방식이 아닌 전체 뷰의 1/3 정도로 띄우고 싶어서 
`custom modal view`를 만들어줌

#### 해결방법

|UI 구성|구현된 UI|
|:---:|:---:|
| <img src = "https://i.imgur.com/3q02o1c.png" width="350" height="400">| <img src = "https://i.imgur.com/AEZ89mQ.gif" width="200" height="400"> |

- `UIViewControllerTransitioningDelegate`, `UIViewControllerAnimatedTransitioning`을 활용해 `custom modal view`를 구현

- `UIViewControllerTransitioningDelegate`: 
viewController간의 전환을 관리해주는 프로토콜
```swift
// present될 때 실행될 애니메이션 메서드
animationController(forPresented:, presenting:, source:) -> UIViewControllerAnimatedTransitioning?
// dismiss될 때 실행될 애니메이션 메서드 
animationController(forDismissed:) -> UIViewControllerAnimatedTransitioning?
```
- `UIViewControllerAnimatedTransitioning`: 
`customViewController`전환을 해 줄 때 필요한 애니메이션 메서드들이 구현되어 있는 프로토콜
```swift
// 애니메이션 지속 시간 메서드
transitionDuration(using:) -> TimeInterval
// 전환 애니메이션 구현부 메서드
animateTransition(using:)
```


- 모달 뷰로 나타낼 줄 뷰 컨트롤러를 구현 
전역변수로 `isPresenting`이라는 `Bool` 타입 변수 선언 `isPresenting`의 값에 따라 애니메이션을 구현
`isPresenting`의 값이 `true`이면 `view`의 `backgroundColor`를 알파 값을 주고 `mainView.frame.origin.y`를 0에서 `view`의 1/3만큼 애니메이션으로 올려줌

## [Network_Wiki](https://github.com/bar-d/OP.GGCloneCoding/wiki/Network_Wiki)
## [Scene_Wiki](https://github.com/bar-d/OP.GGCloneCoding/wiki/Scene_Wiki)
## [TroubleShooting](https://github.com/bar-d/OP.GGCloneCoding/wiki/TroubleShooting)
