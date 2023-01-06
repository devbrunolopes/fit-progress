//
//  LoginViewController.swift
//  fit-progress
//
//  Created by Bruno Lopes on 06/01/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    var loginView: LoginView?
    
    override func loadView() {
        loginView = LoginView()
        view = loginView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
}
