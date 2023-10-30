//
//  UserSettingsView.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 21.10.23.
//

import UIKit

private enum Constants {
    enum Player {
        static let text: String = "Player".localized
        static let backgroundColor: UIColor = .black
        static let textColor: UIColor = .white
        static let heightAnchor: CGFloat = 35
        
    }
    
    enum TextField {
        static let backgroundColor: UIColor = .black
        static let textColor: UIColor = .white
        static let heightAnchor: CGFloat = 35
        
    }
    
}

final class UserSettingsView: UIView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.Player.text
        label.backgroundColor = Constants.Player.backgroundColor
        label.textColor = Constants.Player.textColor
        label.textAlignment = .center
        label.alpha = 0.7
        return label
    }()
    
    private var fotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .systemGray
        return imageView
    }()
    
    private var nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = Constants.TextField.backgroundColor
        textField.textColor = Constants.TextField.textColor
        textField.textAlignment = .center
        return textField
    }()
    
    private weak var settingsViewControllerDelegate: SettingsViewControllerDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(fotoImageView)
        addSubview(titleLabel)
        addSubview(nameTextField)
        
        
        NSLayoutConstraint.activate([
            fotoImageView.topAnchor.constraint(equalTo: topAnchor),
            fotoImageView.leftAnchor.constraint(equalTo: leftAnchor),
            fotoImageView.widthAnchor.constraint(equalToConstant: frame.width),
            fotoImageView.heightAnchor.constraint(equalToConstant: frame.height),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: frame.width),
            titleLabel.heightAnchor.constraint(equalToConstant: Constants.Player.heightAnchor),
            
            nameTextField.bottomAnchor.constraint(equalTo: bottomAnchor),
            nameTextField.leftAnchor.constraint(equalTo: leftAnchor),
            nameTextField.widthAnchor.constraint(equalToConstant: frame.width),
            nameTextField.heightAnchor.constraint(equalToConstant: Constants.TextField.heightAnchor),
            
        ])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
        fotoImageView.addGestureRecognizer(tap)
        fotoImageView.isUserInteractionEnabled = true

    }
    
    @objc func imageViewTapped() {
        settingsViewControllerDelegate?.imageViewTapped()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addDelegate(with delegate: SettingsViewController) {
        settingsViewControllerDelegate = delegate
        nameTextField.delegate = delegate
    }
  
    func setName(_ name: String) {
        nameTextField.text = name
    }
    
    func getName() -> String? {
        nameTextField.text
    }

    func setFoto(_ image: UIImage) {
        fotoImageView.image = image
    }

    func getFoto() -> UIImage? {
        fotoImageView.image
    }
    
}
