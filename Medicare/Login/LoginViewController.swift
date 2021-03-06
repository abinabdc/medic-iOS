//
//  LoginViewController.swift
//  Medicare
//
//  Created by Abinab Dangi on 26/06/2022.
//

import UIKit
class LoginViewController: UIViewController{
    let loginView = LoginView()
    let loginMessageLabel = UILabel()
    let bodyView = UIView()
    let loginGreetingsLabel = UILabel()
    let greetStack = UIStackView()
    let newHereLabel = UILabel()
    let createNewLabel = UILabel()
    let signUpStack = UIStackView()
    let loginButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.signUpTapped(_:)))
        self.createNewLabel.isUserInteractionEnabled = true
        self.createNewLabel.addGestureRecognizer(labelTap)
        style()
        layout()
        buttonActions()
    }
}

extension LoginViewController{
    private func style(){
        tamic()
        loginButton.isPrimaryButton(title: "Login")
        loginGreetingsLabel.isRegularLabel(text: "Hey", fontSize: 28, bold: true, color: .black)
        loginMessageLabel.isRegularLabel(text: "Login Now.", fontSize: 28, bold: true, color: .black)
        newHereLabel.isRegularLabel(text: "New here?", fontSize: 14, bold: false, color: .gray)
        createNewLabel.isRegularLabel(text: "Create New", fontSize: 14, bold: true, color: .black)
    }
    private func layout(){
        greetStack.addArrangedSubview(loginGreetingsLabel)
        greetStack.addArrangedSubview(loginMessageLabel)
        greetStack.axis = .vertical
        greetStack.spacing = 0
        
        signUpStack.addArrangedSubview(newHereLabel)
        signUpStack.addArrangedSubview(createNewLabel)
        signUpStack.axis = .horizontal
        signUpStack.spacing = 2
        signUpStack.alignment = .leading
        constraintsDefination()
    }
    private func tamic(){
        loginView.translatesAutoresizingMaskIntoConstraints = false
        loginMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        bodyView.translatesAutoresizingMaskIntoConstraints = false
        loginGreetingsLabel.translatesAutoresizingMaskIntoConstraints = false
        newHereLabel.translatesAutoresizingMaskIntoConstraints = false
        createNewLabel.translatesAutoresizingMaskIntoConstraints = false
        signUpStack.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        greetStack.translatesAutoresizingMaskIntoConstraints = false
        
    }
    private func constraintsDefination(){
        self.view.addSubview(greetStack)
        NSLayoutConstraint.activate([
            greetStack.topAnchor.constraint(equalToSystemSpacingBelow: self.view.topAnchor, multiplier: 10),
            greetStack.leadingAnchor.constraint(equalToSystemSpacingAfter: self.view.leadingAnchor, multiplier: 2),
            greetStack.heightAnchor.constraint(equalToConstant: 80),
            self.view.trailingAnchor.constraint(equalToSystemSpacingAfter: greetStack.trailingAnchor, multiplier: 2)
        ])
        self.view.addSubview(signUpStack)
        NSLayoutConstraint.activate([
            signUpStack.topAnchor.constraint(equalToSystemSpacingBelow: greetStack.bottomAnchor, multiplier: 1),
            signUpStack.leadingAnchor.constraint(equalToSystemSpacingAfter: self.view.leadingAnchor, multiplier: 2),
            signUpStack.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        self.view.addSubview(loginView)
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: signUpStack.bottomAnchor, multiplier: 2),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: self.view.leadingAnchor, multiplier: 2),
            self.view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 2),
        ])
        
        self.view.addSubview(loginButton)
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            loginButton.leadingAnchor.constraint(equalToSystemSpacingAfter: self.view.leadingAnchor, multiplier: 2),
            self.view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginButton.trailingAnchor, multiplier: 2),
        ])
    }
    private func buttonActions(){
        loginButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
    }
    @objc func signInButtonTapped(){
        Spinner.start()
        if loginView.usernameTextField.text == "" || loginView.usernameTextField.text == "" {
            self.loginView.warningLabel.text = "Empty fields detected."
            self.loginView.warningLabel.isHidden = false
        }else{
            self.loginView.warningLabel.isHidden = true
            loginApiCall(username: loginView.usernameTextField.text ?? "", password: loginView.passwordTextField.text ?? "")
        }
    }
    @objc func signUpTapped(_ sender: UITapGestureRecognizer){
        let vc = UIStoryboard(name: "Register", bundle: nil).instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
extension LoginViewController{
    private func loginApiCall(username: String, password: String){
        LoginViewModel().requestForLogin(Username: username, Password: password) { apiResponse in
            print(apiResponse)
            Spinner.stop()
            
            if (apiResponse.status ?? false){
                let userDefault = UserDefaults.standard
                userDefault.set(apiResponse.data?.token ?? "NA", forKey: "access_token")
                LoginViewController.loginSuccessHandler()
            }else{
                self.customAlerView(title: "Oops, Something went wrong.", message: apiResponse.message ?? "")
                
            }
        } fail: { msg in
            self.customAlerView(title: "Error", message: msg)
            
        }
        
        
    }
}

extension LoginViewController{
    static func loginSuccessHandler(){
        let vc1 = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(identifier: "HomeViewController") as! HomeViewController
        vc1.title = "Home"
        let vc2 = UIStoryboard(name: "Cart", bundle: nil).instantiateViewController(identifier: "CartViewController") as! CartViewController
        vc2.title = "Cart"
        let vc3 = UIStoryboard(name: "Search", bundle: nil).instantiateViewController(identifier: "SearchViewController") as! SearchViewController
        vc3.title = "Search"
        let vc4 = UIStoryboard(name: "More", bundle: nil).instantiateViewController(identifier: "MoreViewController") as! MoreViewController
        vc4.title = "More"
        
        let tabBarVC = UITabBarController()
        tabBarVC.setViewControllers([vc1,vc2,vc3,vc4], animated: false)
        
        guard let items = tabBarVC.tabBar.items else{
            return
        }
        let images = ["house","cart","magnifyingglass","list.dash"]
        
        for x in 0..<items.count {
            items[x].image = UIImage(systemName: images[x])
            
        }
        
        let nav2 = UINavigationController()
        let mainViewForNav2 = tabBarVC
        nav2.viewControllers = [mainViewForNav2]
        UIApplication.shared.windows.first?.rootViewController = nav2
        UIApplication.shared.windows.first?.makeKeyAndVisible()
        
    }
    
}



