//
//  ReviewViewModel.swift
//  SeSAC3UnsplashProject
//
//  Created by 백래훈 on 2023/09/13.
//

import Foundation

class ReviewViewModel {
    
    var idValue = ReviewObserver("")
    var pwValue = ReviewObserver("")
    var isValid = ReviewObserver(false)
    
    func checkValidation() {
        if idValue.value.count >= 6 {
            isValid.value = true
        } else {
            isValid.value = false
        }
    }
    
    func signIn(completion: @escaping () -> Void) {
        // 서버, 닉네임, id
        UserDefaults.standard.set(idValue.value, forKey: "idValue")
        
        completion()
    }
    
}
