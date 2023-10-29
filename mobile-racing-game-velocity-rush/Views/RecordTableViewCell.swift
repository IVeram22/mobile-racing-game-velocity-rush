//
//  RecordTableViewCell.swift
//  mobile-racing-game-velocity-rush
//
//  Created by Ivan Veramyou on 25.10.23.
//

import UIKit

private enum Constants {
    static let duration: TimeInterval = 0.3
    static let font: CGFloat = 37
    static let heightAnchor: CGFloat = 101
    static let textHeightAnchor: CGFloat = 101
    
    enum DeleteView {
        static let widthAnchor: CGFloat = 91
        static let backgroundColor: UIColor = .red
        
        enum TrashIcon {
            static let size: CGFloat = 51
        }
    }
    
    enum PhotoView {
        static let size: CGFloat = 95
        static let constant: CGFloat = 5
    }
    
    enum NameLabel {
        static let leftAnchor: CGFloat = 105
        static let widthAnchor: CGFloat = 157
        static let textColor: UIColor = .white
    }
    
    enum PointsLabel {
        static let rightAnchor: CGFloat = -5
    }
    
    enum DateLabel {
        static let font: CGFloat = 21
        static let textColor: UIColor = .gray
        static let topAnchor: CGFloat = 75
        static let leftAnchor: CGFloat = 105
        static let rightAnchor: CGFloat = -5
    }
    
}

class RecordTableViewCell: UITableViewCell {
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        contentView.backgroundColor = UIColor.clear
        addDeleteView()
        addPhotoView()
        addNameLabel()
        addPointsLabel()
        addDateLabel()
        addLeftSwipe()
        addRightSwipe()
    }
    
    // MARK: - Public
    func setRecord(with record: RecordModel) {
        fotoImageView.image = record.user.foto
        nameLabel.text = record.user.name
        pointsLabel.text = "\(record.points) pt"
        dateLabel.text = record.date
        pointsLabel.textColor = GlobalConstants.Levels.colors[record.color]
    }
    
    func setRecordsViewControllerDelegate(with delegate: RecordsViewControllerDelegate) {
        recordsViewControllerDelegate = delegate
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
        label.font = UIFont.systemFont(ofSize: Constants.font)
        label.textColor = Constants.NameLabel.textColor
        return label
    }()
    
    private let pointsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: Constants.font)
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = Constants.DateLabel.textColor
        label.font = UIFont.systemFont(ofSize: Constants.DateLabel.font)
        return label
    }()
    
    private let deleteView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constants.DeleteView.backgroundColor
        return view
    }()
    
    private let deleteImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = Constants.DeleteView.backgroundColor
        return imageView
    }()
    
    private var isLeftSwipeDid: Bool = false
    private var recordsViewControllerDelegate: RecordsViewControllerDelegate?
    
    private func addDeleteView() {
        contentView.addSubview(deleteView)
        contentView.addSubview(deleteImageView)
        NSLayoutConstraint.activate([
            deleteView.topAnchor.constraint(equalTo: contentView.topAnchor),
            deleteView.rightAnchor.constraint(
                equalTo: contentView.rightAnchor,
                constant: Constants.DeleteView.widthAnchor),
            deleteView.widthAnchor.constraint(equalToConstant: Constants.DeleteView.widthAnchor),
            deleteView.heightAnchor.constraint(equalToConstant: Constants.heightAnchor),
            
            deleteImageView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: Constants.heightAnchor / 2 - Constants.DeleteView.TrashIcon.size / 2),
            deleteImageView.rightAnchor.constraint(
                equalTo: contentView.rightAnchor,
                constant: Constants.DeleteView.widthAnchor / 2 + Constants.DeleteView.TrashIcon.size / 2),
            deleteImageView.widthAnchor.constraint(equalToConstant: Constants.DeleteView.TrashIcon.size),
            deleteImageView.heightAnchor.constraint(equalToConstant: Constants.DeleteView.TrashIcon.size),
        ])
        deleteImageView.image = UIImage(named: "Trash")
        let tap = UITapGestureRecognizer(target: self, action: #selector(deleteButtonTapped))
//        deleteView.addGestureRecognizer(tap)
        contentView.addGestureRecognizer(tap)
    }
    
    private func addPhotoView() {
        contentView.addSubview(fotoImageView)
        NSLayoutConstraint.activate([
            fotoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.PhotoView.constant),
            fotoImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.PhotoView.constant),
            fotoImageView.widthAnchor.constraint(equalToConstant: Constants.PhotoView.size),
            fotoImageView.heightAnchor.constraint(equalToConstant: Constants.PhotoView.size),
        ])
    }
    
    private func addNameLabel() {
        contentView.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.NameLabel.leftAnchor),
            nameLabel.widthAnchor.constraint(equalToConstant: Constants.NameLabel.widthAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: Constants.textHeightAnchor),
        ])
    }
    
    private func addPointsLabel() {
        contentView.addSubview(pointsLabel)
        NSLayoutConstraint.activate([
            pointsLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            pointsLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: Constants.PointsLabel.rightAnchor),
            pointsLabel.leftAnchor.constraint(equalTo: nameLabel.rightAnchor),
            pointsLabel.heightAnchor.constraint(equalToConstant: Constants.textHeightAnchor),
        ])
    }
    
    private func addDateLabel() {
        contentView.addSubview(dateLabel)
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.DateLabel.topAnchor),
            dateLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.DateLabel.leftAnchor),
            dateLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: Constants.DateLabel.rightAnchor),
            pointsLabel.heightAnchor.constraint(equalToConstant: Constants.textHeightAnchor),
        ])
    }
    
    private func addLeftSwipe() {
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeLeft))
        swipe.direction = .left
        addGestureRecognizer(swipe)
    }
    
    private func addRightSwipe() {
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeRight))
        swipe.direction = .right
        addGestureRecognizer(swipe)
    }
    
    @objc private func didSwipeLeft() {
        guard !isLeftSwipeDid else { return }
        UIView.animate(withDuration: Constants.duration) { [self] in
            frame.origin.x -= Constants.DeleteView.widthAnchor
        }
        isLeftSwipeDid.toggle()
    }
    
    @objc private func didSwipeRight() {
        guard isLeftSwipeDid else { return }
        UIView.animate(withDuration: Constants.duration) { [self] in
            frame.origin.x += Constants.DeleteView.widthAnchor
        }
        isLeftSwipeDid.toggle()
    }
    
    @objc private func deleteButtonTapped() {
        print("deleteButtonTapped")
        recordsViewControllerDelegate?.deleteRecord()
    }
    
}
