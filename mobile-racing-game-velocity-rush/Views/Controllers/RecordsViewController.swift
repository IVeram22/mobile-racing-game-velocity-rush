//
//  RecordsViewController.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 25.10.23.
//

import UIKit

private enum Constants {
    enum Cell {
        static let heightForRowAt: CGFloat = 101
    }
    
    enum BackButton {
        static let shift: CGFloat = -55
    }
}

class RecordsViewController: UIViewController {
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPresenter()
        addRoad()
        view.addBlackBackground()
        addTable()
        addBackButton()
        addSwipeRightToGoBack()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        gameSettingsOutputDelegate?.getConfig()
        recordsOutputDelegate?.getRecords()
        road.runAllAnimation()
    }
    
    // MARK: - Private
    private var road: RoadView!
    private var tableView: UITableView!
    private var backButton: BackButton!
    // Navigation
    private let router: BackRouter = Router.shared
    // Presenter
    private var config: GameSettingsModel!
    private let gameSettingsPresenter = GameSettingsPresenter()
    weak private var gameSettingsOutputDelegate: GameSettingsOutputDelegate?
    private var records: [RecordModel]!
    private let recordsPresenter = RecordsPresenter()
    weak private var recordsOutputDelegate: RecordsOutputDelegate?
    
    private func setupPresenter() {
        gameSettingsPresenter.setGameSettingsInputDelegate(with: self)
        gameSettingsOutputDelegate = gameSettingsPresenter
        recordsPresenter.setRecordsInputDelegate(with: self)
        recordsOutputDelegate = recordsPresenter
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
    
    private func addTable() {
        tableView = UITableView(frame: CGRect(
            x: 0,
            y: 0,
            width: view.frame.width,
            height: view.frame.height
        ))
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = UIColor.clear
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.widthAnchor.constraint(equalToConstant: view.frame.width),
            tableView.heightAnchor.constraint(equalToConstant: view.frame.height),
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
        view.addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Constants.BackButton.shift),
            backButton.widthAnchor.constraint(equalToConstant: GlobalConstants.BackButton.width),
            backButton.heightAnchor.constraint(equalToConstant: GlobalConstants.BackButton.height),
        ])
    }
    
    private func addSwipeRightToGoBack() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(comeBack))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
    }
}

// MARK: - Extensions
extension RecordsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}


extension RecordsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = RecordTableViewCell(style: .default, reuseIdentifier: "record\(indexPath.item)")
        cell.setRecord(with: records[indexPath.item])
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        records.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constants.Cell.heightForRowAt
    }
    
}

extension RecordsViewController: BackButtonDelegate {
    @objc func comeBack() {
        router.comeBack(from: self)
    }
    
}

extension RecordsViewController: GameSettingsInputDelegate {
    func setupInitialState() {
        displayData()
    }
    
    func setupConfig(with gameSettings: GameSettingsModel) {
        config = gameSettings
    }
    
    func displayData() {
        road.setHindrances(index: config.hindranceIndex)
    }
    
}

extension RecordsViewController: RecordsInputDelegate {
    func setupInitialStateForRecords() {
        displayRecords()
    }
    
    func setupData(with records: [RecordModel]) {
        self.records = records
    }
    
    func displayRecords() {
        
    }
    
}
