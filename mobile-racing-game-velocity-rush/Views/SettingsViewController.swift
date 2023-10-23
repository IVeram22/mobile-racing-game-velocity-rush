//
//  SettingsViewController.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 21.10.23.
//

import UIKit

private enum Constants {
    enum Cell {
        static let width: CGFloat = 271
        static let height: CGFloat = 271
    }
}

class SettingsViewController: UIViewController {
    private var road: RoadView!
    private var scrollView = UIScrollView()
    private var userSettingsView: UserSettingsView!
    private var carColorView: CarColorsSliderSettingsView!
    private var hindranceView: HindrancesSliderSettingsView!
    private var levelView: LevelsSliderSettingsView!
    private var controlView: ControlsSliderSettingsView!
    private var backButton: BackButton!
    
    private let router: BackRouter = Router.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let height: CGFloat = 1500
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        scrollView.contentSize = CGSize(width: 300, height: height)

        road = RoadView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: height))

        view.addSubview(road)
        view.addBlackBackground()
        
        
        view.addSubview(scrollView)
        addUserSettingsView()
        addCarColorView()
        addHindranceView()
        addLevelView()
        addControlView()
        addBackButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        road.runAllAnimation()
    }
    
    private func addUserSettingsView() {
        userSettingsView = UserSettingsView(frame: CGRect(
            x: 0,
            y: 0,
            width: Constants.Cell.width,
            height: Constants.Cell.height
        ))
        
        userSettingsView.addDelegate(with: self)
        userSettingsView.setFoto(UIImage(named: "Racer")!)
        userSettingsView.setName("Ivan V.")
        
        
        
        scrollView.addSubview(userSettingsView)
        NSLayoutConstraint.activate([
            userSettingsView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            userSettingsView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            userSettingsView.widthAnchor.constraint(equalToConstant: Constants.Cell.width),
            userSettingsView.heightAnchor.constraint(equalToConstant: Constants.Cell.height),
            
        ])
        
    }
    
    private func addCarColorView() {
        carColorView = CarColorsSliderSettingsView(frame: CGRect(
            x: 0,
            y: 0,
            width: Constants.Cell.width,
            height: Constants.Cell.height
        ))
        carColorView.setTitle("Player Car Colors")
        carColorView.addCar()
        
        scrollView.addSubview(carColorView)
        
        NSLayoutConstraint.activate([
            carColorView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            carColorView.topAnchor.constraint(equalTo: userSettingsView.bottomAnchor, constant: 25),
            carColorView.widthAnchor.constraint(equalToConstant: Constants.Cell.width),
            carColorView.heightAnchor.constraint(equalToConstant: Constants.Cell.height),
            
        ])
        
        
    }
    
    private func addHindranceView() {
        hindranceView = HindrancesSliderSettingsView(frame: CGRect(
            x: 0,
            y: 0,
            width: Constants.Cell.width,
            height: Constants.Cell.height
        ))
        hindranceView.setTitle("Hindrances")
        hindranceView.addHindrance(with: 0)
        
        scrollView.addSubview(hindranceView)
        
        NSLayoutConstraint.activate([
            hindranceView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            hindranceView.topAnchor.constraint(equalTo: carColorView.bottomAnchor, constant: 25),
            hindranceView.widthAnchor.constraint(equalToConstant: Constants.Cell.width),
            hindranceView.heightAnchor.constraint(equalToConstant: Constants.Cell.height),
            
        ])
        
        
    }
    
    private func addLevelView() {
        levelView = LevelsSliderSettingsView(frame: CGRect(
            x: 0,
            y: 0,
            width: Constants.Cell.width,
            height: Constants.Cell.height
        ))
        levelView.setTitle("Levels")
        levelView.addLevel(with: 0)
        
        scrollView.addSubview(levelView)
        
        NSLayoutConstraint.activate([
            levelView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            levelView.topAnchor.constraint(equalTo: hindranceView.bottomAnchor, constant: 25),
            levelView.widthAnchor.constraint(equalToConstant: Constants.Cell.width),
            levelView.heightAnchor.constraint(equalToConstant: Constants.Cell.height),
            
        ])
        
        
    }
    
    private func addControlView() {
        controlView = ControlsSliderSettingsView(frame: CGRect(
            x: 0,
            y: 0,
            width: Constants.Cell.width,
            height: Constants.Cell.height
        ))
        controlView.setTitle("Player Controls")
        controlView.addControl(with: 0)
        
        scrollView.addSubview(controlView)
        
        NSLayoutConstraint.activate([
            controlView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            controlView.topAnchor.constraint(equalTo: levelView.bottomAnchor, constant: 25),
            controlView.widthAnchor.constraint(equalToConstant: Constants.Cell.width),
            controlView.heightAnchor.constraint(equalToConstant: Constants.Cell.height),
            
        ])
        
        
    }
    
    private func addBackButton() {
        backButton = BackButton(frame: CGRect(
            x: 0,
            y: 0,
            width: GlobalConstants.BackButton.width,
            height: GlobalConstants.BackButton.height
        ))
       
        backButton.setDelegate(with: self)
        
        scrollView.addSubview(backButton)
        
        NSLayoutConstraint.activate([
            backButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            backButton.topAnchor.constraint(equalTo: controlView.bottomAnchor, constant: 5),
            backButton.widthAnchor.constraint(equalToConstant: GlobalConstants.BackButton.width),
            backButton.heightAnchor.constraint(equalToConstant: GlobalConstants.BackButton.height),
            
        ])
        
        
    }
    
}

extension SettingsViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)

        // No image found
        guard let image = info[.editedImage] as? UIImage else { return }
        userSettingsView.setFoto(image)
        
    }
    
}

extension SettingsViewController: SettingsViewControllerDelegate {
    func imageViewTapped() {
        let actionSheet = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)

        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                let vc = UIImagePickerController()
                vc.sourceType = .camera
                vc.allowsEditing = true
                vc.delegate = self
                self.present(vc, animated: true)
            } else {
                print("Camera is not available")
            }
        }))

        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action:UIAlertAction) in
            let vc = UIImagePickerController()
            vc.sourceType = .photoLibrary
            vc.allowsEditing = true
            vc.delegate = self
            self.present(vc, animated: true)
        }))

        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(actionSheet, animated: true, completion: nil)
    }

}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

extension SettingsViewController: SettingsViewControllerBackDelegate {
    func comeBack() {
        router.comeBack(from: self)
    }
    
}
