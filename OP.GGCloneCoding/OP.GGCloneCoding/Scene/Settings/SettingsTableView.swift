//
//  SettingsTableView.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/20.
//

import SwiftUI

final class SettingsTableView: UITableView {

    // MARK: - Initializer

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: .grouped)

        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        commonInit()
    }

    // MARK: - Methods

    private func commonInit() {
        setupConstraintsAutomatic(false)
        setupDelegate()
        setupDataSource()
        setupSectionHeight(header: 4, footer: 4)
        setupContentInset(Design.tableViewEdgeInsets)
        setupBackgroundColor()
        setupScrollIndicatorVisible(false)
    }

    private func setupConstraintsAutomatic(_ bool: Bool) {
        translatesAutoresizingMaskIntoConstraints = bool
    }

    private func setupDelegate() {
        delegate = self
    }

    private func setupDataSource() {
        dataSource = self
    }

    private func setupSectionHeight(header: CGFloat, footer: CGFloat) {
        sectionHeaderHeight = header
        sectionFooterHeight = footer
    }

    private func setupContentInset(_ insets: UIEdgeInsets) {
        contentInset = insets
    }

    private func setupBackgroundColor() {
        backgroundColor = Design.primitiveColor
    }

    private func setupScrollIndicatorVisible(_ bool: Bool) {
        showsVerticalScrollIndicator = bool
    }
}

// MARK: - Extension

extension SettingsTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: // 로그인
            return 1
        case 1: // 푸시알림
            return 1
        case 2: // 챔피언 화면 기본 탭 설정
            return 1
        case 3: // 언어 선택
            return 1
        case 4: // 기본 테마 설정
            return 1
        case 5: // 버그제보 및 건의, 리뷰
            return 2
        case 6: // 이용 약관, 개인정보 보호방침
            return 2
        case 7: // 버전
            return 1
        default:
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = SettingsCell()

        switch indexPath.section {
        case 0:
            let cell = SettingsCell()
            cell.setupTitleLabel(with: "로그인")
            return cell
        case 1:
            let cell = PushNotificationCell()
            cell.setupTitleLabel(with: "푸시 알림")
            cell.setupFirstContentTitleLabel(with: "게임 정보 알림")
            cell.setupSecondContentTitleLabel(with: "커뮤니티 알림")
            return cell
        case 2:
            let cell = SettingsCell()
            cell.setupTitleLabel(with: "챔피언 화면 기본 탭 설정")
            return cell
        case 3:
            let cell = SettingsCell()
            cell.setupTitleLabel(with: "언어 선택")
            return cell
        case 4:
            let cell = SettingsCell()
            cell.setupTitleLabel(with: "기본 테마 설정")
            return cell
        case 5:
            let cell = SettingsCell()
            cell.setupTitleLabel(with: "버그제보 및 건의하기")
            return cell
        case 6:
            let cell = SettingsCell()
            if indexPath.row == 0 {
                cell.setupTitleLabel(with: "이용약관")
            } else if indexPath.row == 1{
                cell.setupTitleLabel(with: "개인정보 보호 방침")
            }

            return cell
        case 7:
            let cell = SettingsCell()
            cell.setupTitleLabel(with: SettingsMenu.version.title)
            return cell
        default:
            return cell
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return SettingsMenu.allCases.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 {
            return 190
        } else {
            return 60
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        return 0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section != 1 {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}

// MARK: - Preview

struct SettingsTableView_Preview: PreviewProvider {
    static var previews: some View {
        UIViewPreview {
            let view = SettingsTableView()
            return view
        }
        .previewDevice("iPhone 12 mini")
    }
}

// MARK: - Namespace

private enum Design {
    static let primitiveColor = UIColor(named: "PrimitiveColor")
    static let tableViewEdgeInsets = UIEdgeInsets(top: -40, left: 0, bottom: 0, right: 0)
}
