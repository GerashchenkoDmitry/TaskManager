//
//  TaskTableViewCell.swift
//  TaskManager
//
//  Created by Дмитрий Геращенко on 25.01.2022.
//

import UIKit

final class TaskTableViewCell: UITableViewCell {
    
    static var reuseId: String {
        String(describing: Self.self)
    }
    
    private var acceptAction: (() -> Void)?
    
    private let taskLabel = UILabel()
    private let acceptButton = UIButton(type: .system)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        DispatchQueue.main.async {
            self.acceptButton.layer.cornerRadius = self.acceptButton.bounds.midY
        }
    }
    
    private func setupUI() {
        setupTaskLabel()
        setupAcceptButton()
    }
    
    private func setupTaskLabel() {
        contentView.addSubview(taskLabel)
        
        taskLabel.translatesAutoresizingMaskIntoConstraints = false
        taskLabel.numberOfLines = 0
        taskLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        NSLayoutConstraint.activate([
            taskLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            taskLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            taskLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    private func setupAcceptButton() {
        contentView.addSubview(acceptButton)
        
        acceptButton.translatesAutoresizingMaskIntoConstraints = false
        acceptButton.setTitle("Accept", for: .normal)
        acceptButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        acceptButton.tintColor = .white
        acceptButton.backgroundColor = .systemTeal
        acceptButton.layer.masksToBounds = false
        acceptButton.contentEdgeInsets = .init(top: 6, left: 8, bottom: 6, right: 8)
        acceptButton.addTarget(self, action: #selector(acceptButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            acceptButton.topAnchor.constraint(equalTo: taskLabel.bottomAnchor, constant: 8),
            acceptButton.leadingAnchor.constraint(greaterThanOrEqualTo: contentView.leadingAnchor, constant: 16),
            acceptButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            acceptButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    func configureWithTask(_ task: Task, acceptAction: (() -> Void)?) {
        taskLabel.text = task.title
        
        self.acceptAction = acceptAction
    }
    
    @objc private func acceptButtonTapped() {
        acceptAction?()
    }
}
