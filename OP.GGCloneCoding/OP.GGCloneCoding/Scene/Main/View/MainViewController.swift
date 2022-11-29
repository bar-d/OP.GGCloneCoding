//
//  MainViewController.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/16.
//

import UIKit
import SafariServices

final class MainViewController: UIViewController {

    // MARK: Properties

    private let mainTopView = MainTopView()
    private let mainStickyHeaderView = MainStickyHeaderView()
    private let mainTableView = MainTableView()
    private let mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.refreshControl = UIRefreshControl()

        return scrollView
    }()

    private var mainStickyHeaderviewTopConstraint = NSLayoutConstraint()
    private var mainTableViewHeightConstraint = NSLayoutConstraint()

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()

        // UserDefaults 초기화 구문
        for key in UserDefaults.standard.dictionaryRepresentation().keys {
            UserDefaults.standard.removeObject(forKey: key.description)
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        setupCellDelegate()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        setupMainTableViewHeightConstraint()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        mainTableView.reloadData()
    }

    // MARK: - Methods

    private func setupUI() {
        setupSubviews()
        setupConstraintsAutomatic(false)
        setupConstraints()
        setupScrollViewContentInset()
        setupBackgroundColor()
        setupDelegate()
    }

    private func setupSubviews() {
        [mainStickyHeaderView, mainTopView, mainScrollView]
            .forEach { view.addSubview($0) }
        [mainTableView]
            .forEach { mainScrollView.addSubview($0) }
    }

    private func setupConstraintsAutomatic(_ bool: Bool) {
        mainScrollView.translatesAutoresizingMaskIntoConstraints = bool
    }

    private func setupConstraints() {
        setupMainTopViewConstraints()
        setupStickyHeaderViewConstraints()
        setupSettingsScrollViewConstraints()
        setupSettingsTableViewConstraints()
    }

    private func setupMainTopViewConstraints() {
        NSLayoutConstraint.activate([
            mainTopView.topAnchor.constraint(equalTo: view.topAnchor),
            mainTopView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor
            ),
            mainTopView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor
            ),
            mainTopView.heightAnchor.constraint(equalToConstant: Design.headerMinHeight)
        ])
    }

    private func setupStickyHeaderViewConstraints() {
        mainStickyHeaderviewTopConstraint = mainStickyHeaderView.topAnchor.constraint(
            equalTo: view.topAnchor
        )

        NSLayoutConstraint.activate([
            mainStickyHeaderviewTopConstraint,
            mainStickyHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainStickyHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainStickyHeaderView.heightAnchor.constraint(
                equalToConstant: Design.headerMaxHeight
            )
        ])
    }

    private func setupSettingsScrollViewConstraints() {
        NSLayoutConstraint.activate([
            mainScrollView.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: Design.headerMinHeight
            ),
            mainScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainScrollView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor
            )
        ])
    }

    private func setupSettingsTableViewConstraints() {
        mainTableViewHeightConstraint = mainTableView.heightAnchor.constraint(
            equalToConstant: .zero
        )

        NSLayoutConstraint.activate([
            mainTableView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
            mainTableView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
            mainTableView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor),
            mainTableView.trailingAnchor.constraint(
                equalTo: mainScrollView.trailingAnchor
            ),
            mainTableView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor),
            mainTableViewHeightConstraint
        ])
    }

    private func setupScrollViewContentInset() {
        mainScrollView.contentInset = Design.scrollViewContentInsets
    }

    private func setupBackgroundColor() {
        view.backgroundColor = Design.backgroundColor
        mainTopView.backgroundColor = Design.secondaryColor
    }

    private func setupDelegate() {
        mainScrollView.delegate = self
    }

    private func setupCellDelegate() {
        setupOtherGamesDelegate()
        setupPatchNoteDelegate()
        setupMySummonerDelegate()
        setupFavoriteSummonersCellDelegate()
    }

    private func setupMySummonerDelegate() {
        guard let cell = mainTableView.cellForRow(
            at: Design.mySummonerCellIndex
        ) as? MySummonerCell else {
            return
        }

        cell.setupUnselectedSummonerViewDelegate(self)
        cell.setupSummonerDescriptionViewDelegate(self)
        cell.setupSummonerDetailViewDelegate(self)
        cell.setupSelectedSummonerViewDelegate(self)
    }

    private func setupFavoriteSummonersCellDelegate() {
        guard let cell = mainTableView.cellForRow(
            at: Design.favoriteSummonerCellIndex
        ) as? FavoriteSummonersCell else {
            return
        }

        cell.setupFavoriteSummonersCellDelegate(self)
    }

    private func setupOtherGamesDelegate() {
        guard let cell = mainTableView.cellForRow(
            at: Design.otherGamesCellIndex
        ) as? OtherGamesCell else {
            return
        }

        cell.setupOtherGamesCellDelegate(self)
    }

    private func setupPatchNoteDelegate() {
        guard let cell = mainTableView.cellForRow(
            at: Design.patchNoteCellIndex
        ) as? PatchNoteCell else {
            return
        }

        cell.setupPatchNoteCellDelegate(self)
    }

    private func setupMainTableViewHeightConstraint() {
        mainTableViewHeightConstraint.constant = mainTableView.contentSize.height
    }
}

// MARK: - Extension

extension MainViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateStickyHeaderView()
    }

    private func updateStickyHeaderView() {
        mainStickyHeaderviewTopConstraint.constant = -calculateHeaderConstant()
    }

    private func calculateHeaderConstant() -> CGFloat {
        var headerConstant = mainScrollView.contentOffset.y + Design.dynamicHeaderHeight
        headerConstant = headerConstant < 0 ? 0 : headerConstant
        headerConstant = headerConstant > Design.headerMinHeight
        ? Design.headerMinHeight : headerConstant

        return headerConstant
    }
}

extension MainViewController:
    OtherGamesDelegate, PatchNoteDelegate,
    UnselectedSummonerViewDelegate, SummonerDescriptionViewDelegate,
    SummonerDetailViewDelegate, FavoriteSummonersCellDelegate,
    SelectedSummonerViewDelegate {
    
    func detailButtonDidTapped() {
        let summonerDetailViewController = SummonerDetailViewController()
        
        present(summonerDetailViewController, animated: true)
    }
    
    func summonerSearchButtonDidTapped() {
        let summonerSearchViewController = SummonerSearchViewController()

        present(summonerSearchViewController, animated: true)
    }

    func searchButtonDidTapped() {
        let summonerRegisterViewController = SummonerRegisterViewController()

        present(summonerRegisterViewController, animated: true)
    }

    func valorantImageDidTapped() {
        presentSafariViewController(using: Design.URL.valorant)
    }

    func battlegroundsImageDidTapped() {
        presentSafariViewController(using: Design.URL.battlegrounds)
    }

    func eternalReturnImageDidTapped() {
        presentSafariViewController(using: Design.URL.eternalReturn)
    }

    func overwatchDidTapped() {
        presentSafariViewController(using: Design.URL.overwatch)
    }

    func firstPatchNoteImageDidTapped() {
        presentSafariViewController(using: Design.URL.firstPatchNote)
    }

    func secondPatchNoteImageDidTapped() {
        presentSafariViewController(using: Design.URL.secondPatchNote)
    }

    func thirdPatchNoteImageDidTapped() {
        presentSafariViewController(using: Design.URL.thirdPatchNote)
    }

    private func presentSafariViewController(using url: URL) {
        let safari = SFSafariViewController(url: url)

        present(safari, animated: true)
    }

    func showAlert(from alert: UIAlertController) {
        present(alert, animated: true)
    }
}

// MARK: - Namespace

private enum Design {
    enum URL {
        static let valorant = "https://valorant.op.gg".url
        static let battlegrounds = "https://pubg.op.gg".url
        static let eternalReturn = "https://er.op.gg".url
        static let overwatch = "https://overwatch.op.gg".url
        static let firstPatchNote = "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-12-20-notes/".url
        static let secondPatchNote = "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-12-19-notes/".url
        static let thirdPatchNote = "https://www.leagueoflegends.com/ko-kr/news/game-updates/patch-12-18-notes/".url
    }

    static let backgroundColor = UIColor(named: "PrimitiveColor")
    static let secondaryColor = UIColor(named: "SecondaryColor")

    static let headerMaxHeight: CGFloat = 150
    static let headerMinHeight: CGFloat = 100
    static let dynamicHeaderHeight = headerMaxHeight - headerMinHeight
    static let scrollViewContentInsets = UIEdgeInsets(
        top: headerMaxHeight - headerMinHeight + 7,
        left: 0,
        bottom: -(headerMaxHeight - headerMinHeight + 7),
        right: 0
    )

    static let mySummonerCellIndex = IndexPath(row: .zero, section: .zero)
    static let favoriteSummonerCellIndex = IndexPath(row: .zero, section: 1)
    static let patchNoteCellIndex = IndexPath(row: .zero, section: 2)
    static let otherGamesCellIndex = IndexPath(row: .zero, section: 7)
}
