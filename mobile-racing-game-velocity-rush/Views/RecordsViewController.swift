//
//  RecordsViewController.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 25.10.23.
//

import UIKit

class RecordsViewController: UIViewController {
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addRoad()
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 291, height: view.frame.height))
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.backgroundColor = UIColor.clear
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.widthAnchor.constraint(equalToConstant: 291),
            tableView.heightAnchor.constraint(equalToConstant: view.frame.height),
        ])
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        road.setHindrances(index: gameSettings.hindranceIndex)
        road.runAllAnimation()
    }
    
    // MARK: - Private
    private var road: RoadView!
    private var tableView: UITableView!
    
    private var gameSettings: GameSettingsModel = GameSettingsManager.shared.getGameSettingsModel()
    private var records: [RecordModel] = RecordsManager.shared.getAllRecords()
    
    private func addRoad() {
        road = RoadView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        
        view.addSubview(road)
        view.addBlackBackground()
        
        
    }
    
    
}

// MARK: - Extensions
extension RecordsViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//    }
    
}


extension RecordsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = RecordTableViewCell(style: .default, reuseIdentifier: "")
        cell.setRecord(with: records[IndexPath.Index()])
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        records.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
}





