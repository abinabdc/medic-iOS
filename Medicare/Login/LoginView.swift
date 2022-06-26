//
//  LoginView.swift
//  Medicare
//
//  Created by Abinab Dangi on 26/06/2022.
//

import Foundation
import UIKit

class LoginView : UIView{
    weak var stackView: UIStackView?
    weak var userNameLabel: UILabel?
    weak var usernameTextField: UITextField?
    weak var passwordLabel: UILabel?
    weak var passwordTextField: UITextField?
    
    weak var warningLabel: UILabel?
    
    
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
        userNameLabel?.isRegularLabel(text: "Username", fontSize: 14, bold: false, color: .black)
        passwordLabel?.isRegularLabel(text: "Password", fontSize: 14, bold: <#T##Bool#>, color: <#T##UIColor#>)
        
        
    }
    func layout(){
        
    }
    func tamic(){
        stackView?.translatesAutoresizingMaskIntoConstraints = false
        translatesAutoresizingMaskIntoConstraints = false
    }
}
