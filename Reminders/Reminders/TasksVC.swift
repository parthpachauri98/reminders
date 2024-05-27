//
//  TasksVC.swift
//  Reminders
//
//  Created by Parth Pachauri on 24/05/24.
//

import UIKit

class TasksVC: UIViewController, UITableViewDataSource, UITableViewDelegate, NewTaskVCDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    var tasks: [TodoTask] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Tasks"
        // Adding Plus button on the navigation bar.
        let addTaskBtn = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addTaskBtnAction))
        self.navigationItem.rightBarButtonItem  = addTaskBtn
    }
    
    @objc
    func addTaskBtnAction() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let newTaskVC = storyboard.instantiateViewController(withIdentifier: "NewTaskVC") as? NewTaskVC else {
            return
        }
        newTaskVC.delegate = self
        navigationController?.pushViewController(newTaskVC, animated: true)
    }
    
    // MARK: - NewTaskVCDelegate method's
    
    func didSaveNewTask(_ task: TodoTask) {
        tasks.append(task)
        tableView.reloadData()
    }
    

    // MARK: - TableView method's
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = tasks[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskId", for: indexPath)
        var config = cell.defaultContentConfiguration()
        config.text = task.title
        config.secondaryText = task.desc
        cell.contentConfiguration = config
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
