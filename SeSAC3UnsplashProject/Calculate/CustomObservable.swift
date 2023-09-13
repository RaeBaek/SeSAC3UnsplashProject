//
//  CustomObservable.swift
//  SeSAC3UnsplashProject
//
//  Created by 백래훈 on 2023/09/13.
//

import Foundation

class CustomObservable<T> {
    
    private var listener: ((T) -> Void)?
    
    var value: T {
        didSet {
            listener?(value)
            print("값이 \(value)(으)로 변경되었습니다.")
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ sample: @escaping (T) -> Void) {
        print("저는 \(value)입니다!")
        sample(value)
        listener = sample
    }
    
}


