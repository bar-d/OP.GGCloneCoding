//
//  ThemeSelectionViewController.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/04.
//

import UIKit

final class ThemeSelectionViewController: UIViewController {
    
    // MARK: Properties
    
    private var isPresenting = false
    private var mainViewHeight = UIScreen.main.bounds.height / 3
    private let themeSelection = ["시스템 설정 사용", "라이트 모드", "다크 모드"]
    
    private let cancelButton = ButtonBuilder()
        .setupConstraintsAutomatic(false)
        .setupImage(image: UIImage(systemName: "xmark"))
        .setupColor(tint: .label)
        .build()
    
    private let titleLabel = LabelBuilder()
        .setupConstraintsAutomatic(false)
        .setupLabelText(text: "기본 테마를 설정해주세요.", color: .label)
        .setupLabelTextAttributes(font: .title3)
        .build()
    
    private let themeSelectionTableView = ThemeSelectionTableView()
    
    private let mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.backgroundColor = UIColor(named: "PrimitiveColor")
        
        return view
    }()
    
    private let emptyView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    // MARK: - Initializers
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    // MARK: - Methods
    
    private func commonInit() {
        setupSubviews()
        setupConstraints()
        setupModalPresentationStyle(.custom)
        setupTabGesture()
        setupDelegate()
        setupDataSource()
    }
    
    private func setupSubviews() {
        [emptyView, mainView]
            .forEach { view.addSubview($0) }
        [cancelButton, titleLabel, themeSelectionTableView]
            .forEach { mainView.addSubview($0) }
    }
    
    private func setupConstraints() {
        setupEmptyViewConstraints()
        sestupMainViewConstraints()
        setupCancelButtonConstraints()
        setupTitleLabelConstraints()
        setupLanguageSelectionTableViewConstraints()
    }
    
    private func setupEmptyViewConstraints() {
        NSLayoutConstraint.activate([
            emptyView.topAnchor.constraint(equalTo: view.topAnchor),
            emptyView.bottomAnchor.constraint(equalTo: mainView.topAnchor),
            emptyView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            emptyView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func sestupMainViewConstraints() {
        NSLayoutConstraint.activate([
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainView.heightAnchor.constraint(equalToConstant: mainViewHeight)
        ])
    }
    
    private func setupCancelButtonConstraints() {
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 12),
            cancelButton.trailingAnchor.constraint(
                equalTo: mainView.trailingAnchor,
                constant: -12
            ),
            cancelButton.widthAnchor.constraint(equalToConstant: 20),
            cancelButton.heightAnchor.constraint(equalTo: cancelButton.widthAnchor)
        ])
    }
    
    private func setupTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(
                equalTo: mainView.leadingAnchor,
                constant: 12
            ),
            titleLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor)
        ])
    }
    
    private func setupLanguageSelectionTableViewConstraints() {
        NSLayoutConstraint.activate([
            themeSelectionTableView.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: 40
            ),
            themeSelectionTableView.leadingAnchor.constraint(
                equalTo: mainView.leadingAnchor
            ),
            themeSelectionTableView.trailingAnchor.constraint(
                equalTo: mainView.trailingAnchor
            ),
            themeSelectionTableView.bottomAnchor.constraint(
                equalTo: mainView.bottomAnchor
            )
        ])
    }
    
    private func setupModalPresentationStyle(_ style: UIModalPresentationStyle) {
        modalPresentationStyle = style
    }
    
    private func setupTabGesture() {
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(backgroundViewDidTapped)
        )
        emptyView.addGestureRecognizer(tapGesture)
    }
    
    private func setupDelegate() {
        transitioningDelegate = self
        themeSelectionTableView.delegate = self
    }
    
    private func setupDataSource() {
        themeSelectionTableView.dataSource = self
    }
    
    @objc private func backgroundViewDidTapped() {
        dismiss(animated: true, completion: nil)
    }
}

extension ThemeSelectionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = ThemeSelectionTableViewCell()
        cell.setupThemeLabelText(themeSelection[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        
        switch indexPath.row {
        case 0:
            window?.overrideUserInterfaceStyle = .unspecified
            if window?.overrideUserInterfaceStyle == .unspecified {
                UserDefaults.standard.set(0, forKey: "Appearance")
            }
        case 1:
            window?.overrideUserInterfaceStyle = .light
            UserDefaults.standard.set(1, forKey: "Appearance")
        case 2:
            window?.overrideUserInterfaceStyle = .dark
            UserDefaults.standard.set(2, forKey: "Appearance")
            
        default:
            window?.overrideUserInterfaceStyle = .unspecified
        }
        dismiss(animated: true)
    }
}

extension ThemeSelectionViewController: UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    func animationController(
        forPresented presented: UIViewController,
        presenting: UIViewController,
        source: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
        
        return self
    }
    
    func animationController(
        forDismissed dismissed: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
        
        return self
    }
    
    func transitionDuration(
        using transitionContext: UIViewControllerContextTransitioning?
    ) -> TimeInterval {
        
        return 1
    }
    
    func animateTransition(
        using transitionContext: UIViewControllerContextTransitioning
    ) {
        let containerView = transitionContext.containerView
        
        guard let transitionViewController = transitionContext.viewController(
            forKey: UITransitionContextViewControllerKey.to
        ) else { return }
        
        isPresenting = !isPresenting
        
        if isPresenting == true {
            containerView.addSubview(transitionViewController.view)
            
            UIView.animate(
                withDuration: 0.4,
                delay: 0,
                options: [.curveEaseInOut],
                animations: { [weak self] in
                    self?.view.backgroundColor = .black.withAlphaComponent(0.5)
                    self?.mainView.frame.origin.y -= self?.mainViewHeight ?? 0
                },
                completion: { (finished) in
                    transitionContext.completeTransition(true)
                }
            )
        } else {
            UIView.animate(
                withDuration: 0.4,
                delay: 0,
                options: [.curveEaseInOut],
                animations: { [weak self] in
                    self?.view.backgroundColor = .clear
                    self?.mainView.frame.origin.y += self?.mainViewHeight ?? 0
                },
                completion: { (finished) in
                    transitionContext.completeTransition(true)
                }
            )
        }
    }
}
