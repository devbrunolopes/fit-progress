//
//  LoginView.swift
//  fit-progress
//
//  Created by Bruno Lopes on 06/01/23.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
    func actionForgotPasswordButton()
    func actionSignInButton()
    func actionRegisterButton()
}

class LoginView: UIView {

    weak private var delegate: LoginViewDelegate?
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 55/255, green: 67/255, blue: 91/255, alpha: 1.0)
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.text = "Fit Progress"
        return label
    }()
    
    lazy var logoAppImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "figure.surfing")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 7
        textField.layer.borderColor = CGColor(red: 55/255, green: 67/255, blue: 91/255, alpha: 1.0)
        textField.layer.borderWidth = 1.0
        textField.keyboardType = .emailAddress
        textField.placeholder = "Digite seu email:"
        textField.text = "brunolopes0203@gmail.com" //deletar
        textField.textColor = .darkGray
        textField.autocapitalizationType = .none
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 7
        textField.layer.borderColor = CGColor(red: 55/255, green: 67/255, blue: 91/255, alpha: 1.0)
        textField.layer.borderWidth = 1.0
        textField.keyboardType = .default
        textField.placeholder = "Digite sua senha:"
        textField.textColor = .darkGray
        textField.autocapitalizationType = .none
        textField.text = "123456789" //deletar
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Esqueceu a senha?", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(UIColor(red: 55/255, green: 67/255, blue: 91/255, alpha: 1.0), for: .normal)
        button.addTarget(self, action: #selector(didTapforgotPasswordButton), for: .touchUpInside)
        return button
    }()
    
    lazy var signInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 55/255, green: 67/255, blue: 91/255, alpha: 1.0)
        button.layer.cornerRadius = 7
        button.clipsToBounds = true
        button.setTitle("Entrar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapSignInButton), for: .touchUpInside)
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Ainda não tem conta? Cadastre-se", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(UIColor(red: 55/255, green: 67/255, blue: 91/255, alpha: 1.0), for: .normal)
        button.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - OBJC Functions
    
    @objc private func didTapforgotPasswordButton() {
        delegate?.actionForgotPasswordButton()
    }
    
    @objc private func didTapSignInButton() {
        delegate?.actionSignInButton()
    }
    
    @objc private func didTapSignUpButton() {
        delegate?.actionRegisterButton()
    }
    
    //MARK: - Public Functions
    
    public func setupLoginViewDelegate(delegate: LoginViewDelegate?) {
        self.delegate = delegate
    }
}
