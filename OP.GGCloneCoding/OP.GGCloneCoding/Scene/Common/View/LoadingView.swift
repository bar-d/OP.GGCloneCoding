//
//  LoadingView.swift
//  OP.GGCloneCoding
//
//  Created by 바드, 수꿍 on 2022/10/17.
//

import UIKit
import Lottie

final class LoadingView: UIView {
    
    // MARK: Properties
    
    private let circleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Design.loadingViewColor
        
        return view
    }()
    
    private let loadingView: LottieAnimationView = {
        let animationView: LottieAnimationView = Design.loadingIndicatorView
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.loopMode = .loop
        animationView.contentMode = .scaleAspectFill
        
        return animationView
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    // MARK: - View Life Cycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        circleView.layer.cornerRadius = circleView.frame.size.width / 2
    }
    
    // MARK: - Methods
    
    private func commonInit() {
        setupConstraintsAutomatic(false)
        setupSubviews()
        setupConstraints()
        loadingView.play()
    }
    
    private func setupConstraintsAutomatic(_ bool: Bool) {
        translatesAutoresizingMaskIntoConstraints = bool
    }
    
    private func setupSubviews() {
        addSubview(circleView)
        circleView.addSubview(loadingView)
    }
    
    private func setupConstraints() {
        setupCircleViewConstraints()
        setupLoadingViewConstraints()
    }
    
    private func setupCircleViewConstraints() {
        NSLayoutConstraint.activate([
            circleView.centerXAnchor.constraint(equalTo: centerXAnchor),
            circleView.centerYAnchor.constraint(equalTo: centerYAnchor),
            circleView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2),
            circleView.heightAnchor.constraint(equalTo: circleView.widthAnchor)
        ])
    }
    
    private func setupLoadingViewConstraints() {
        NSLayoutConstraint.activate([
            loadingView.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: circleView.centerYAnchor),
            loadingView.widthAnchor.constraint(
                equalTo: circleView.widthAnchor,
                multiplier: 1.5
            ),
            loadingView.heightAnchor.constraint(
                equalTo: circleView.heightAnchor,
                multiplier: 1.5
            )
        ])
    }
}

// MARK: - Namespace

private enum Design {
    static let loadingViewColor = UIColor(named: "LoadingView")
    static let loadingIndicatorView = LottieAnimationView.init(name: "LoadingIndicator")
}
