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
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.text = "Progressão de Carga"
        return label
    }()
    
    lazy var logoAppImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "figure.surfing")
        image.tintColor = .black
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var emailTextField: TextField = {
        let textField = TextField(placeholderText: "Digite seu email:")
        return textField
    }()
    
    lazy var passwordTextField: TextField = {
        let textField = TextField(placeholderText: "Digite sua senha:")
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Esqueceu a senha?", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(didTapforgotPasswordButton), for: .touchUpInside)
        return button
    }()
    
    lazy var signInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
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
        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.black, .font: UIFont.systemFont(ofSize: 16)]
        let boldAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.black, .font: UIFont.boldSystemFont(ofSize: 16)]
        let attributedTitle = NSMutableAttributedString(string: "Ainda não tem conta?", attributes: attributes)
        attributedTitle.append(NSAttributedString(string: " Cadastre-se", attributes: boldAttributes))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewcode()
        configBackgroundColor()
        enableButton(false)
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
    
    public func setupTextFielDelegate(delegate: UITextFieldDelegate) {
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
    
    public func validateTextFieldToEnableButton() {
        if emailTextField.text != "" && passwordTextField.text != "" {
            enableButton(true)
        } else {
            enableButton(false)
        }
    }
    
    public func getEmail() -> String {
        return emailTextField.text ?? ""
    }
    
    public func getPassword() -> String {
        return passwordTextField.text ?? ""
    }
    
    //MARK: - Private Functions
    
    private func enableButton(_ enable: Bool) {
        if enable {
            signInButton.isEnabled = true
            signInButton.setTitleColor(.white, for: .normal)
        } else {
            signInButton.isEnabled = false
            signInButton.setTitleColor(.lightGray, for: .normal)
        }
    }
    
    private func configBackgroundColor() {
        backgroundColor = .green
    }
}

//MARK: - Viewcode

extension LoginView: Viewcode {
    
    internal func addElements() {
        addSubview(loginLabel)
        addSubview(logoAppImageView)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(forgotPasswordButton)
        addSubview(signInButton)
        addSubview(registerButton)
    }
    
    internal func setupConstraints() {
        NSLayoutConstraint.activate([
            
            loginLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            loginLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            logoAppImageView.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 20),
            logoAppImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            logoAppImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            logoAppImageView.heightAnchor.constraint(equalToConstant: 150),
            
            emailTextField.topAnchor.constraint(equalTo: logoAppImageView.bottomAnchor, constant: 30),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            forgotPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 5),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            signInButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 40),
            signInButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            signInButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            registerButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            registerButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            registerButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor)
        ])
    }
}
