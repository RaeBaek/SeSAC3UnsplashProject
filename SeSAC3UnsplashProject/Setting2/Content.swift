//
//  Setting.swift
//  SeSAC3UnsplashProject
//
//  Created by 백래훈 on 2023/09/17.
//

import UIKit

struct Content: Hashable {
    let image: String?
    let title: String
    let color: UIColor?
    let state: String?
}

struct Setting: Hashable {
    let title: String?
}
