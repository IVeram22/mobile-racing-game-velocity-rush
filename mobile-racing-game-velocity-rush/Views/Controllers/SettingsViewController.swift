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
    
    enum ScrollView {
        static let width: CGFloat = 301
        static let height: CGFloat = 1501
    }
    
    enum Slider {
        static let shift: CGFloat = 25
    }
    
    enum BackButton {
        static let shift: CGFloat = 5
    }
    
}

class SettingsViewController: UIViewController {
    // MARK: Interface
    private var road: RoadView!
    private var scrollView = UIScrollView()
    private var userSettingsView: UserSettingsView!
    private var carColorView: CarColorsSliderSettingsView!
    private var hindranceView: HindrancesSliderSettingsView!
    private var levelView: LevelsSliderSettingsView!
    private var controlView: ControlsSliderSettingsView!
    private var backButton: BackButton!
    // MARK: Navigation
    private let router: BackRouter = Router.shared
    // MARK: Presenter
    private var config: GameSettingsModel!
    private let presenter = GameSettingsPresenter()
    weak private var gameSettingsOutputDelegate: GameSettingsOutputDelegate?
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPresenter()
        setupInterface()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupBeforeAppearance()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        saveData()
    }
    
    // MARK: - Private
    private func setupPresenter() {
        presenter.setGameSettingsInputDelegate(with: self)
        gameSettingsOutputDelegate = presenter
    }
    
    private func setupInterface() {
        addRoad()
        view.addBlackBackground()
        addScrollView()
        addUserSettingsView()
        addCarColorView()
        addHindranceView()
        addLevelView()
        addControlView()
        addBackButton()
        addSwipeRightToGoBack()
        gameSettingsOutputDelegate?.getConfig()
    }
    
    private func setupBeforeAppearance() {
        road.runAllAnimation()
    }
    
    private func addRoad() {
        road = RoadView(frame: CGRect(
            x: 0,
            y: 0,
            width: view.frame.width,
            height: view.frame.height
        ))
        view.addSubview(road)
    }
    
    private func addScrollView() {
        scrollView = UIScrollView(frame: CGRect(
            x: 0,
            y: 0,
            width: view.frame.width,
            height: view.frame.height
        ))
        scrollView.contentSize = CGSize(
            width: Constants.ScrollView.width,
            height: Constants.ScrollView.height
        )
        view.addSubview(scrollView)
    }
    
    private func addUserSettingsView() {
        userSettingsView = UserSettingsView(frame: CGRect(
            x: 0,
            y: 0,
            width: Constants.Cell.width,
            height: Constants.Cell.height
        ))
        userSettingsView.addDelegate(with: self)
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
        carColorView.setTitle("Player Car Colors".localized)
        scrollView.addSubview(carColorView)
        NSLayoutConstraint.activate([
            carColorView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            carColorView.topAnchor.constraint(equalTo: userSettingsView.bottomAnchor, constant: Constants.Slider.shift),
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
        hindranceView.setTitle("Hindrances".localized)
        scrollView.addSubview(hindranceView)
        NSLayoutConstraint.activate([
            hindranceView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            hindranceView.topAnchor.constraint(equalTo: carColorView.bottomAnchor, constant: Constants.Slider.shift),
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
        levelView.setTitle("Levels".localized)
        scrollView.addSubview(levelView)
        NSLayoutConstraint.activate([
            levelView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            levelView.topAnchor.constraint(equalTo: hindranceView.bottomAnchor, constant: Constants.Slider.shift),
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
        controlView.setTitle("Player Controls".localized)
        scrollView.addSubview(controlView)
        NSLayoutConstraint.activate([
            controlView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            controlView.topAnchor.constraint(equalTo: levelView.bottomAnchor, constant: Constants.Slider.shift),
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
            backButton.topAnchor.constraint(equalTo: controlView.bottomAnchor, constant: Constants.BackButton.shift),
            backButton.widthAnchor.constraint(equalToConstant: GlobalConstants.BackButton.width),
            backButton.heightAnchor.constraint(equalToConstant: GlobalConstants.BackButton.height),
        ])
    }
    
    private func addSwipeRightToGoBack() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(comeBack))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
    }
    
    private func saveData() {
        if let name = userSettingsView.getName() {
            config.user.name = name
        }
        if let foto = userSettingsView.getFoto() {
            config.user.foto = foto
        }
        config.carColorIndex = carColorView.getCurrentIndex()
        config.hindranceIndex = hindranceView.getCurrentIndex()
        config.levelIndex = levelView.getCurrentIndex()
        config.controlIndex = controlView.getCurrentIndex()
        gameSettingsOutputDelegate?.setConfig(with: config)
    }
    
}

// MARK: - Extensions
extension SettingsViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[.editedImage] as? UIImage {
            userSettingsView.setFoto(editedImage)
        } else if let originalImage = info[.originalImage] as? UIImage {
            userSettingsView.setFoto(originalImage)
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
}

extension SettingsViewController: SettingsViewControllerDelegate {
    func imageViewTapped() {
        let actionSheet = UIAlertController(title: "Choose Image Source".localized, message: nil, preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera".localized, style: .default, handler: { (action:UIAlertAction) in
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
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library".localized, style: .default, handler: { (action:UIAlertAction) in
            let vc = UIImagePickerController()
            vc.sourceType = .photoLibrary
            vc.allowsEditing = true
            vc.delegate = self
            self.present(vc, animated: true)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel".localized, style: .cancel, handler: nil))
        present(actionSheet, animated: true, completion: nil)
    }
    
}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

extension SettingsViewController: BackButtonDelegate {
    @objc func comeBack() {
        router.comeBack(from: self)
    }
    
}

extension SettingsViewController: GameSettingsInputDelegate {
    func setupInitialState() {
        displayData()
    }
    
    func setupConfig(with gameSettings: GameSettingsModel) {
        config = gameSettings
    }
    
    func displayData() {
        userSettingsView.setName(config.user.name)
        userSettingsView.setFoto(config.user.foto!)
        carColorView.addCar(with: config.carColorIndex)
        hindranceView.addHindrance(with: config.hindranceIndex)
        levelView.addLevel(with: config.levelIndex)
        controlView.addControl(with: config.controlIndex)
    }
    
}

