//
//  NewTaskVC.swift
//  Reminders
//
//  Created by Parth Pachauri on 27/05/24.
//

import UIKit

class NewTaskVC: UIViewController {
    @IBOutlet weak var descTextView: UITextView!
    @IBOutlet weak var titleField: UITextField!
    
    var delegate: NewTaskVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Add New Task"
        
        // Save button
        let saveBtn = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveBtnAction))
        self.navigationItem.rightBarButtonItem = saveBtn
    }
    
    @objc
    func saveBtnAction() {
        let title = titleField.text ?? ""
        let desc = descTextView.text ?? ""
        let creationDate = Date()
        
        guard !title.isEmpty else {
            return
        }
        
        let newTask = TodoTask(title: title, desc: desc, creationTime: creationDate)
        delegate?.didSaveNewTask(newTask)
        self.navigationController?.popViewController(animated: true)
    }

}

protocol NewTaskVCDelegate {
    func didSaveNewTask(_ task: TodoTask)
}
