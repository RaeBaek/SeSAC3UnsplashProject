//
//  NumberViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by 백래훈 on 2023/09/18.
//

import UIKit

class NumberViewController: UIViewController {
    
    @IBOutlet var numberTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    
    let viewModel = NumberViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindData()
        numberTextField.addTarget(self, action: #selector(numberTextFieldChanged), for: .editingChanged)
 
    }
    
    func bindData() {
        viewModel.number.bind { number in
            self.numberTextField.text = number
        }
        
        viewModel.result.bind { result in
            self.resultLabel.text = result
        }
    }
    
    @objc func numberTextFieldChanged() {
        viewModel.number.value = numberTextField.text
        viewModel.convertNumber()
        
    }
    
}
