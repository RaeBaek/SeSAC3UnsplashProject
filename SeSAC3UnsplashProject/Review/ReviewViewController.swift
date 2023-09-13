//
//  ReviewViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by 백래훈 on 2023/09/13.
//

import UIKit

class ReviewViewController: UIViewController {

    @IBOutlet var idValueTextField: UITextField!
    @IBOutlet var pwValueTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var loginStateLabel: UILabel!
    
    var viewModel = ReviewViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        idValueTextField.addTarget(self, action: #selector(idValueTextFieldChanged), for: .editingChanged)
        pwValueTextField.addTarget(self, action: #selector(pwValueTextFieldChanged), for: .editingChanged)
        loginButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
        
        viewModel.idValue.bind { text in
            self.idValueTextField.text = text
            print("idValue: \(text)")
        }
        
        viewModel.pwValue.bind { text in
            self.pwValueTextField.text = text
            print("pwValue: \(text)")
        }
        
        viewModel.isValid.bind { bool in
            self.loginButton.isEnabled = bool
        }
        
    }
    
    @objc func idValueTextFieldChanged() {
        guard let text = idValueTextField.text else { return }
        viewModel.idValue.value = text
        viewModel.checkValidation()
    }
    
    @objc func pwValueTextFieldChanged() {
        guard let text = pwValueTextField.text else { return }
        viewModel.pwValue.value = text
        viewModel.checkValidation()
    }
    
    @objc func loginButtonClicked() {
        viewModel.signIn {
            print("로그인을 성공했으므로 통과!")
            self.loginStateLabel.text = UserDefaults.standard.string(forKey: "idValue")
        }
    }

}
