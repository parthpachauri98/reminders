//
//  TasksVC.swift
//  Reminders
//
//  Created by Parth Pachauri on 24/05/24.
//

import UIKit

class TasksVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    let tasks: [String] = ["Task1", "Task2", "Task3", "Task4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Tasks"
    }

    // MARK: - TableView method's
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskId", for: indexPath) 
        var config = cell.defaultContentConfiguration()
        config.text = tasks[indexPath.row]
        cell.contentConfiguration = config
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
