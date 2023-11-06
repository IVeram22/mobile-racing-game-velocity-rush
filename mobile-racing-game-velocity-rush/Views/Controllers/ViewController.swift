//
//  ViewController.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 11.10.23.
//

import UIKit

private enum Constants {
    static let withTimeInterval: TimeInterval = 2.0
    static let withDuration: TimeInterval = 1.7
    
    enum GameNameLabel {
        static let text: String = "Velocity\nRush"
        static let font: UIFont? = UIFont(name: "Merriweather-Light", size: 64)
        static let textColor: UIColor = .white
        static let widthAnchor: CGFloat = 342
        static let heightAnchor: CGFloat = 272
        static let centerYAnchor: CGFloat = -31
    }
        
    enum BackgroundLoadingLine {
        static let startFrame: CGRect = CGRect(x: 51, y: 531, width: 291, height: 1)
        static let backgroundColor: UIColor = UIColor(red: 0.44, green: 0.44, blue: 0.44, alpha: 1)
    }
    
    enum LoadingLine {
        static let startFrame: CGRect = CGRect(x: 51, y: 532, width: 1, height: 1)
        static let endFrame: CGRect = CGRect(x: 51, y: 532, width: 291, height: 1)
        static let backgroundColor: UIColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    enum LoadingPoint {
        static let startFrame: CGRect = CGRect(x: 50, y: 530, width: 5, height: 5)
        static let backgroundColor: UIColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        static let shift: CGFloat = 291
        static let radius: CGFloat = 2.5
    }

}

final class ViewController: UIViewController {
    // MARK: Interface
    private let gameNameLabel: UILabel = {
        let label = UILabel(frame: .infinite)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = Constants.GameNameLabel.text
        label.font = Constants.GameNameLabel.font
        label.textColor = Constants.GameNameLabel.textColor
        return label
    }()
    private let backgroundLoadingLine: UIView = {
        let view = UIView(frame: Constants.BackgroundLoadingLine.startFrame)
        view.backgroundColor = Constants.BackgroundLoadingLine.backgroundColor
        return view
    }()
    private let loadingLine: UIView = {
        let view = UIView(frame: Constants.LoadingLine.startFrame)
        view.backgroundColor = Constants.LoadingLine.backgroundColor
        return view
    }()
    private var loadingPoint: UIView = {
        let view = UIView(frame: Constants.LoadingPoint.startFrame)
        view.backgroundColor = Constants.LoadingPoint.backgroundColor
        view.cornerRadius(with: Constants.LoadingPoint.radius)
        return view
    }()
    // MARK: Navigation
    private let router: MainRouter = Router.shared
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        view.addSubview(gameNameLabel)
        view.addSubview(backgroundLoadingLine)
        view.addSubview(loadingLine)
        view.addSubview(loadingPoint)
        
        NSLayoutConstraint.activate([
            gameNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameNameLabel.centerYAnchor.constraint(
                equalTo: view.centerYAnchor,
                constant: Constants.GameNameLabel.centerYAnchor),
            gameNameLabel.widthAnchor.constraint(equalToConstant: Constants.GameNameLabel.widthAnchor),
            gameNameLabel.heightAnchor.constraint(equalToConstant: Constants.GameNameLabel.heightAnchor),
            
            backgroundLoadingLine.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundLoadingLine.topAnchor.constraint(equalTo: gameNameLabel.bottomAnchor),
            backgroundLoadingLine.widthAnchor.constraint(equalToConstant: Constants.LoadingPoint.shift),
            backgroundLoadingLine.heightAnchor.constraint(equalToConstant: 1),
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Timer.scheduledTimer(withTimeInterval: Constants.withTimeInterval, repeats: false) { [self] _ in
            router.openMainScreen(from: self)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: Constants.withDuration) { [self] in
            loadingLine.frame = Constants.LoadingLine.endFrame
            loadingPoint.frame.origin.x += Constants.LoadingPoint.shift
        }
    }
    
}
