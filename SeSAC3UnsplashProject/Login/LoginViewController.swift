//
//  LoginViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by 백래훈 on 2023/09/12.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var idTextField: UITextField!
    @IBOutlet var pwTextField: UITextField!
    @IBOutlet var loginButton : UIButton!
    
    var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
        
        idTextField.addTarget(self, action: #selector(idTextFieldChanged), for: .editingChanged)
        pwTextField.addTarget(self, action: #selector(pwTextFieldChanged), for: .editingChanged)
        
        viewModel.id.bind { text in
            self.idTextField.text = text
            print(text)
        }
        
        viewModel.pw.bind { text in
            self.pwTextField.text = text
            print(text)
        }
        
        viewModel.isValid.bind { bool in
            self.loginButton.isEnabled = bool
            self.loginButton.backgroundColor = bool ? .systemYellow : .lightGray
        }
        
    }
    
    @objc func idTextFieldChanged() {
        print(#function)
        viewModel.id.value = idTextField.text!
        viewModel.checkValidation()
    }
    
    @objc func pwTextFieldChanged() {
        print(#function)
        viewModel.pw.value = pwTextField.text!
        viewModel.checkValidation()
    }
    
    @objc func loginButtonClicked() {
        viewModel.signIn {
            print("로그인 성공했기 때문에 얼럿 띄우기")
        }
        
    }
    
}
