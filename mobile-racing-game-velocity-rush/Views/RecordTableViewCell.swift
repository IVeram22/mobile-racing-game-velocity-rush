//
//  RecordTableViewCell.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 25.10.23.
//

import UIKit

class RecordTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        contentView.backgroundColor = UIColor.clear
        setupUI()
    }
    
    // MARK: - Public
    func setRecord(with record: RecordModel) {
        fotoImageView.image = record.user.foto
        nameLabel.text = record.user.name
        pointsLabel.text = "\(record.points) pt"
        dateLabel.text = record.date
    }
    
    // MARK: - Private
    private let fotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 37)
        label.textColor = .white
        return label
    }()
    
    private let pointsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 37)
        label.textColor = .systemGray5
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .systemGray3
        return label
    }()
    
    private func setupUI() {
        contentView.addSubview(fotoImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(pointsLabel)
        contentView.addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            fotoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            fotoImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            fotoImageView.widthAnchor.constraint(equalToConstant: 95),
            fotoImageView.heightAnchor.constraint(equalToConstant: 95),
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 105),
            nameLabel.widthAnchor.constraint(equalToConstant: 100),
            nameLabel.heightAnchor.constraint(equalToConstant: 35),
            
            pointsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
            pointsLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            pointsLabel.widthAnchor.constraint(equalToConstant: 100),
            pointsLabel.heightAnchor.constraint(equalToConstant: 35),
            
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 75),
            dateLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 105),
            dateLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            pointsLabel.heightAnchor.constraint(equalToConstant: 35),
            
        ])
    }
    
}
