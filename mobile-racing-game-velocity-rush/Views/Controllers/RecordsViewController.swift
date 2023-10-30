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
        static let widthForRowAt: CGFloat = 501
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
        displayMessageAboutEmptyRecords()
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
    
    private func displayMessageAboutEmptyRecords() {
        guard let records, records.isEmpty else { return }
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 47)
        label.text = "No records"
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.widthAnchor.constraint(equalToConstant: view.frame.width),
            label.heightAnchor.constraint(equalToConstant: view.frame.width),
        ])
    }
    
    private func displayDeleteAlert(with index: Int) {
        let alert = UIAlertController(
            title: "Delete the Record",
            message: "Are you sure you want to delete the record? This action cannot be undone.",
            preferredStyle: .alert
        )
        
        let deleteAction = UIAlertAction(title: "Delete", style: .default) { [self] _ in
            recordsOutputDelegate?.deleteRecord(with: index)
            recordsOutputDelegate?.getRecords()
            tableView.deleteRows(at: [IndexPath(row: index, section: 0)], with: .fade)

        }
        alert.addAction(deleteAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
}

// MARK: - Extensions
extension RecordsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}


extension RecordsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = RecordTableViewCell(style: .default, reuseIdentifier: "\(indexPath.item)")
        cell.setRecord(with: records[indexPath.item])
        cell.backgroundColor = .clear
        cell.setRecordsViewControllerDelegate(with: self)
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

extension RecordsViewController: RecordsViewControllerDelegate {
    func deleteRecord(index: Int) {
        print("delete")
        print(index)
        displayDeleteAlert(with: index)
    }
    
}
