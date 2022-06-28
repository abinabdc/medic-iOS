//
//  LoginView.swift
//  Medicare
//
//  Created by Abinab Dangi on 26/06/2022.
//

import Foundation
import UIKit

class LoginView : UIView{
    let stackView = UIStackView()
    let userNameLabel = UILabel()
    let usernameTextField = UITextField()
    let passwordLabel = UILabel()
    let passwordTextField = UITextField()
    
    let warningLabel = UILabel()
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        style()
        layout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(code:) has not been implemented")
    }
    
}

extension LoginView {
    func style(){
        userNameLabel.isRegularLabel(text: "Username", fontSize: 14, bold: true, color: .black)
        passwordLabel.isRegularLabel(text: "Password", fontSize: 14, bold: true, color: .black)
        warningLabel.isRegularLabel(text: "Incorrect username or password.", fontSize: 14, bold: false, color: .systemRed)
        usernameTextField.isPrimaryTextfield(placeholder: "Enter your username")
        passwordTextField.isPrimaryTextfield(placeholder: "Enter your password")
        passwordTextField.isSecureTextEntry = true
        stackView.axis = .vertical
        stackView.spacing = 8
        
        
    }
    func layout(){
        stackView.addArrangedSubview(userNameLabel)
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(passwordLabel)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(warningLabel)
        warningLabel.isHidden = true
        tamic()
        addSubview(stackView)
        constraintDefination()
    }
    func tamic(){
        translatesAutoresizingMaskIntoConstraints = false
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    func constraintDefination(){
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 0),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 0),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 0),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 0)
            
        ])
        
    }
}
