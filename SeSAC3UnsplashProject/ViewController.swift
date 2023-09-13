//
//  ViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by 백래훈 on 2023/09/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var nicknameTextField: UITextField!
    @IBOutlet var changeButton: UIButton!
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nicknameTextField.placeholder = "nickname_result".localized
        
//        let value = NSLocalizedString("nickname_result", comment: "")
//        resultLabel.text = String(format: value, "고래밥", "다마고치", "치토스")
        
        resultLabel.text = "age_result".localized(number: 55)
        
//        let searchBar = UISearchBar()
//        
//        searchBar.text = "asddsa"
//        searchBar.placeholder = "dadwad"
//        searchBar.delegate = self
//        searchBar.showsCancelButton = false
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function) // Ctrl + Shift + 클릭
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function) // Ctrl + Shift + 클릭
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print(#function) // Ctrl + Shift + 클릭
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#function) // Ctrl + Shift + 클릭
    }


}

