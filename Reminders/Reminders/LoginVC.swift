//
//  LoginVC.swift
//  Reminders
//
//  Created by Parth Pachauri on 24/05/24.
//

import UIKit

struct Profile {
    let username: String
    let password: String
}


class LoginVC: UIViewController {
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    let profiles: [Profile] = [.init(username: "abcd", password: "123456")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func showHidePasswordAction(_ sender: UIButton) {
        passwordField.isSecureTextEntry.toggle()
        sender.isSelected = !passwordField.isSecureTextEntry
    }
    
    @IBAction func loginBtnAction(_ sender: UIButton) {
        if isValidLogin() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            guard let taskVC = storyboard.instantiateViewController(withIdentifier: "TasksVC") as? TasksVC else {
                return
            }
            
            navigationController?.pushViewController(taskVC, animated: true)
        }
    }
    
    private func isValidLogin() -> Bool {
        let username = usernameField.text ?? ""
        let password = passwordField.text ?? ""
        
        guard !username.isEmpty,
              !password.isEmpty else {
            return false
        }
        
        return profiles.contains(where: { $0.username == username && $0.password == password })
    }
}
