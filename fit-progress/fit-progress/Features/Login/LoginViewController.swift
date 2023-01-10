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
        loginView?.setupLoginViewDelegate(delegate: self)
//        loginView?.setupTextFielDelegate(delegate: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
}

//MARK: - LoginViewDelegate

extension LoginViewController: LoginViewDelegate {
    func actionForgotPasswordButton() {
        //implementar navegação
    }
    
    func actionSignInButton() {
        //implementar navegação
        print("BOLA")
    }
    
    func actionRegisterButton() {
        //implementar navegação
    }
}

//MARK: - UITextFieldDelegate

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 2.0
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 1.0
        loginView?.validateTextFieldToEnableButton()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginView?.emailTextField {
            loginView?.passwordTextField.becomeFirstResponder()
        } else if textField == loginView?.passwordTextField {
            textField.resignFirstResponder()
        }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
