//
//  LanguageSelectionViewController.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/11/03.
//

import UIKit

final class LanguageSelectionViewController: UIViewController {
    
    // MARK: Properties
    
    private var isPresenting = false
    private var mainViewHeight = UIScreen.main.bounds.height / 3
    
    private let cancelButton = ButtonBuilder()
        .setupConstraintsAutomatic(false)
        .setupImage(image: Design.cancelButtonImage)
        .setupColor(tint: .label)
        .build()
    
    private let titleLabel = LabelBuilder()
        .setupConstraintsAutomatic(false)
        .setupLabelText(text: Design.titleLabelText, color: .label)
        .setupLabelTextAttributes(font: .title3)
        .build()
    
    private let languageSelectionTableView = LanguageSelectionTableView()
    
    private let mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        view.backgroundColor = Design.mainViewBackgroundcolor
        
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
        setupModalPresentationStyle(.overCurrentContext)
        setupTabGesture()
        setupTrainsitionDelegate()
    }
    
    private func setupSubviews() {
        [mainView]
            .forEach { view.addSubview($0) }
        [cancelButton, titleLabel, languageSelectionTableView]
            .forEach { mainView.addSubview($0) }
    }
    
    private func setupConstraints() {
        sestupMainViewConstraints()
        setupCancelButtonConstraints()
        setupTitleLabelConstraints()
        setupLanguageSelectionTableViewConstraints()
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
            languageSelectionTableView.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: 40
            ),
            languageSelectionTableView.leadingAnchor.constraint(
                equalTo: mainView.leadingAnchor
            ),
            languageSelectionTableView.trailingAnchor.constraint(
                equalTo: mainView.trailingAnchor
            ),
            languageSelectionTableView.bottomAnchor.constraint(
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
        view.addGestureRecognizer(tapGesture)
    }
    
    private func setupTrainsitionDelegate() {
        transitioningDelegate = self
    }
    
    @objc private func backgroundViewDidTapped() {
        dismiss(animated: true, completion: nil)
    }
}

extension LanguageSelectionViewController: UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
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

// MARK: - Namespace

private enum Design {
    static let titleLabelText = "언어를 선택해주세요."
    static let cancelButtonImage = UIImage(systemName: "xmark")
    static let mainViewBackgroundcolor = UIColor(named: "PrimitiveColor")
}
