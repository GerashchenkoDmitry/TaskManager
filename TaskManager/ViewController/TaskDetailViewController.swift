//
//  TaskDetailScreen.swift
//  TaskManager
//
//  Created by Дмитрий Геращенко on 25.01.2022.
//

import UIKit

final class TaskDetailViewController: UIViewController {
    
    let nameLabel = UILabel()
    let nameTF = UITextField()
    
    let emailLabel = UILabel()
    let emailTF = UITextField()
    
    let phoneLabel = UILabel()
    let phoneTF = PhoneNumberTextField()
    
    let priceTFDelegate = PriceTextFieldDelegate()
    let priceLabel = UILabel()
    let priceTF = UITextField()
    
    let sendButton = UIButton(type: .system)
    
    
    
    // MARK:- viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set background color
        
        view.backgroundColor = .white
        
        // Call configureUI function
        
        configureUI()
        
        self.hideKeyboardOnTap()
    }
    
    // MARK:- viewDidlayoutSubviews
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        nameTF.setUnderLine()
        emailTF.setUnderLine()
        phoneTF.setUnderLine()
        priceTF.setUnderLine()
        
        DispatchQueue.main.async {
            self.sendButton.layer.cornerRadius = self.sendButton.bounds.midY
        }
    }
    
    // MARK:- configureUI
    // Call this function to create user interface
    // Include all setup interface functions
    
    private func configureUI() {
        setupNameLabel()
        setupNameTF()
        
        setupEmailLabel()
        setupEmailTF()
        
        setupPhoneLabel()
        setupPhoneTF()
        
        setupPriceLabel()
        setupPriceTF()
        
        setupSendButton()
    }
    
    // MARK:- Setup UI

    private func setupNameLabel() {
        view.addSubview(nameLabel)

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Name"
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        nameLabel.textColor = .systemTeal
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -16)
        ])
    }
        
    private func setupNameTF() {
        view.addSubview(nameTF)

        nameTF.translatesAutoresizingMaskIntoConstraints = false
        nameTF.placeholder = "Enter your name"
        nameTF.keyboardType = .alphabet
        nameTF.autocorrectionType = .no
        nameTF.autocapitalizationType = .words
        nameTF.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        nameTF.borderStyle = .none
        
        NSLayoutConstraint.activate([
            nameTF.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            nameTF.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 16),
            nameTF.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -16)
        ])
    }
    
    private func setupEmailLabel() {
        view.addSubview(emailLabel)

        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.text = "Email"
        emailLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        emailLabel.textColor = .systemTeal
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: nameTF.bottomAnchor, constant: 20),
            emailLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 16),
            emailLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -16)
        ])
    }
        
    private func setupEmailTF() {
        view.addSubview(emailTF)

        emailTF.translatesAutoresizingMaskIntoConstraints = false
        emailTF.placeholder = "example@mail.com"
        emailTF.keyboardType = .emailAddress
        emailTF.autocorrectionType = .no
        emailTF.autocapitalizationType = .none
        emailTF.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        emailTF.borderStyle = .none
        
        NSLayoutConstraint.activate([
            emailTF.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8),
            emailTF.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 16),
            emailTF.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -16)
        ])
    }
    
    private func setupPhoneLabel() {
        view.addSubview(phoneLabel)

        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneLabel.text = "Phone"
        phoneLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        phoneLabel.textColor = .systemTeal
        
        NSLayoutConstraint.activate([
            phoneLabel.topAnchor.constraint(equalTo: emailTF.bottomAnchor, constant: 20),
            phoneLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 16),
            phoneLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -16)
        ])
    }
        
    private func setupPhoneTF() {
        
        view.addSubview(phoneTF)
        
        phoneTF.translatesAutoresizingMaskIntoConstraints = false
        phoneTF.text = "+7"
        phoneTF.keyboardType = .numberPad
        phoneTF.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        phoneTF.borderStyle = .none
        
        NSLayoutConstraint.activate([
            phoneTF.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 8),
            phoneTF.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 16),
            phoneTF.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -16)
        ])
    }
    
    private func setupPriceLabel() {
        view.addSubview(priceLabel)

        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.text = "Price"
        priceLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        priceLabel.textColor = .systemTeal
        
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: phoneTF.bottomAnchor, constant: 20),
            priceLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 16),
            priceLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -16)
        ])
    }
        
    private func setupPriceTF() {
        view.addSubview(priceTF)

        priceTF.translatesAutoresizingMaskIntoConstraints = false
        priceTF.placeholder = "$"
        priceTF.keyboardType = .numberPad
        priceTF.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        priceTF.borderStyle = .none
        priceTF.delegate = priceTFDelegate
        
        NSLayoutConstraint.activate([
            priceTF.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 8),
            priceTF.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 16),
            priceTF.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -16)
        ])
    }
    
    private func setupSendButton() {
        view.addSubview(sendButton)
        
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.setTitle("Send", for: .normal)
        sendButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        sendButton.tintColor = .white
        sendButton.backgroundColor = .systemTeal
        sendButton.layer.masksToBounds = false
        sendButton.contentEdgeInsets = .init(top: 8, left: 8, bottom: 8, right: 8)
        sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            sendButton.topAnchor.constraint(equalTo: priceTF.bottomAnchor, constant: 50),
            sendButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 16),
            sendButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -16)
        ])
    }
    
    private func validateUserName() -> Bool {
        guard let name = nameTF.text else {
            return false
        }
        
        let regEx = "[A-Za-z'`~\\s]{2,64}"
        let test = NSPredicate(format:"SELF MATCHES %@", regEx)
        let result = test.evaluate(with: name)
        return result
    }
    
    private func validateUserEmail() -> Bool {
        
        guard let email = emailTF.text else {
            return false
        }
        
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let testEmail = NSPredicate(format:"SELF MATCHES %@", regEx)
        let result = testEmail.evaluate(with: email)
]
        return result
    }
    
    private func validateUserPhone() -> Bool {
        let phone = phoneTF.rawPhoneNumber
        
        let regEx = "^((\\+7|7|\\+8|8)([0-9]){3}([0-9]){3}([0-9]){2}([0-9]){2})$"
        
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", regEx)
        let result =  phoneTest.evaluate(with: phone)

        return result
    }
    
    private func validateUserPrice() -> Bool {
        guard let price = priceTF.text else {
            return false
        }
        
        let regEx = "[0-9]{1,7}"
        let priceTest = NSPredicate(format: "SELF MATCHES %@", regEx)
        let result = priceTest.evaluate(with: price)

        return result
    }
    
    private func validateUserInput() -> Bool {
        return validateUserName() && validateUserEmail() && validateUserPhone() && validateUserPrice()
    }
    
    @objc private func sendButtonTapped() {
        if validateUserInput() {
            navigationController?.popToRootViewController(animated: true)
        } else {
            let alertController = UIAlertController(title: "Invalid Input", message: "Invalid user input format", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
        }
    }
}
