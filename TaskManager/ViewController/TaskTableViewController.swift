//
//  ViewController.swift
//  TaskManager
//
//  Created by Дмитрий Геращенко on 25.01.2022.
//

import UIKit

final class TaskTableViewController: UIViewController {
    
    private let tasks = [Task(title: "Task 1"), Task(title: "Task 2"), Task(title: "Task 3"), Task(title: "Task4"), Task(title: "Task 5")]
    
    private let taskTableView = UITableView()
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set title
        
        self.title = "Tasks"
        
        // Set background color
        
        view.backgroundColor = .white
        
        // Call setupTableView
        
        setupTableView()
    }
    
    // MARK: Setup task tableView function
    // Configure table view
    
    private func setupTableView() {
        view.addSubview(taskTableView)
        
        taskTableView.dataSource = self
        
        taskTableView.register(TaskTableViewCell.self, forCellReuseIdentifier: TaskTableViewCell.reuseId)
        
        taskTableView.translatesAutoresizingMaskIntoConstraints = false
        taskTableView.rowHeight = UITableView.automaticDimension
        taskTableView.estimatedRowHeight = 44
        
        NSLayoutConstraint.activate([
            taskTableView.topAnchor.constraint(equalTo: view.topAnchor),
            taskTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            taskTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            taskTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

// MARK:- UITableViewDataSource

extension TaskTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.reuseId, for: indexPath)
        guard let taskCell = cell as? TaskTableViewCell else {
            return cell
        }
        
        let currentTask = tasks[indexPath.row]
        
        taskCell.configureWithTask(currentTask) {
            
            let taskDetailVC = TaskDetailViewController()
            taskDetailVC.title = currentTask.title
            self.navigationController?.pushViewController(taskDetailVC, animated: true)
        }
        return cell
    }
    
    
}
