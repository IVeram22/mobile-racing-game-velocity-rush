//
//  SliderSettingsView.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 21.10.23.
//

import UIKit

private enum Constants {
    enum Title {
        static let text: String = "Title"
        static let backgroundColor: UIColor = .black
        static let textColor: UIColor = .white
        static let heightAnchor: CGFloat = 35
        
    }
    
}

class SliderSettingsView: UIView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.Title.text
        label.backgroundColor = Constants.Title.backgroundColor
        label.textColor = Constants.Title.textColor
        label.textAlignment = .center
        label.alpha = 0.7
        return label
    }()
    
    private let previousButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("❬", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 65)
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("❭", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 65)
        return button
    }()
    
    internal var mainElement = UIView()
    internal var index: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        
        addSubview(previousButton)
        addSubview(nextButton)
        
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: frame.width),
            titleLabel.heightAnchor.constraint(equalToConstant: Constants.Title.heightAnchor),
            
            previousButton.topAnchor.constraint(equalTo: topAnchor),
            previousButton.leftAnchor.constraint(equalTo: leftAnchor),
            previousButton.widthAnchor.constraint(equalToConstant: 51),
            previousButton.heightAnchor.constraint(equalToConstant: frame.height),
            
            nextButton.topAnchor.constraint(equalTo: topAnchor),
            nextButton.leftAnchor.constraint(equalTo: rightAnchor, constant: -51),
            nextButton.widthAnchor.constraint(equalToConstant: 51),
            nextButton.heightAnchor.constraint(equalToConstant: frame.height),
            
        ])
        
        
        previousButton.addTarget(self, action: #selector(previousButtonTapped), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(_ title: String) {
        titleLabel.text = title
    }
    
    @objc func previousButtonTapped(_ sender: UIButton) { }
    
    @objc func nextButtonTapped(_ sender: UIButton) { }
    
    internal func removeMainElement() {
        mainElement.removeFromSuperview()
    }
    
    func getCurrentIndex() -> Int {
        index
    }
    
}
