//
//  RegisterViewController.swift
//  Medicare
//
//  Created by Abinab Dangi on 26/06/2022.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmTextField: UITextField!
    @IBOutlet weak var bloodGroupTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var contactTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()

        
    }


}

extension RegisterViewController{
    private func layout(){
        registerButton.isPrimaryButton(title: "Register")
        fullNameTextField.isPrimaryTextfield(placeholder: "Enter your fullname.")
        usernameTextField.isPrimaryTextfield(placeholder: "Enter your username")
        emailTextField.isPrimaryTextfield(placeholder: "Enter your email")
        passwordTextField.isPrimaryTextfield(placeholder: "Enter your password")
        confirmTextField.isPrimaryTextfield(placeholder: "Re-enter your password")
        bloodGroupTextField.isPrimaryTextfield(placeholder: "Enter your bloodgroup")
        weightTextField.isPrimaryTextfield(placeholder: "Enter your weight in kilogram")
        dateTextField.isPrimaryTextfield(placeholder: "Enter your date of birth")
        heightTextField.isPrimaryTextfield(placeholder: "Enter your height in cm")
        contactTextField.isPrimaryTextfield(placeholder: "Enter your contact number")
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        
//        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(hexString: "CC1C29")]
        
        
        
    }
}
