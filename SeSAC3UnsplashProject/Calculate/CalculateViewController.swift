//
//  CalculateViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by 백래훈 on 2023/09/13.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet var firstTextField: UITextField!
    @IBOutlet var secondTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var tempLabel: UILabel!
    
    let viewModel = CalculateViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstTextField.addTarget(self, action: #selector(firstTextFieldChanged), for: .editingChanged)
        secondTextField.addTarget(self, action: #selector(secondTextFieldChanged), for: .editingChanged)
        
        viewModel.firstNumber.bind { number in
            self.firstTextField.text = number
            print("firstNumber changed \(number)")
        }
        
        viewModel.secondNumber.bind { number in
            self.secondTextField.text = number
            print("secondNumber changed \(number)")
        }
        
        viewModel.resultText.bind { text in
            self.resultLabel.text = text
        }
        
        viewModel.tempText.bind { text in
            self.tempLabel.text = text
        }
    }
    
    @objc func firstTextFieldChanged() {
        viewModel.firstNumber.value = firstTextField.text
        viewModel.calculate()
        viewModel.presentNumberFormat()
    }
    
    @objc func secondTextFieldChanged() {
        viewModel.secondNumber.value = secondTextField.text
        viewModel.calculate()
    }
}

/*
 
 let person = Person("새싹이")
 
 person.name = "카더가든"
 
 person.name = "카스타드"
 
 person.introduce { value in
     self.resultLabel.text = value
     self.view.backgroundColor = [UIColor.systemOrange, UIColor.systemGray, UIColor.systemMint].randomElement()!
 }
 
 DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
     person.name = "나무"
     print("===1초뒤===")
 }
 
 DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
     person.name = "키위"
     print("===3초뒤===")
 }
 
 firstTextField.text = viewModel.firstNumber.value
 secondTextField.text = viewModel.secondNumber.value
 
 */
