//
//  Item.swift
//  SeSAC3UnsplashProject
//
//  Created by 백래훈 on 2023/09/15.
//

import UIKit

struct Item: Hashable {
    let image: String
    let title: String
    let detail: String?
    let mode: UISwitch?
    let stateTitle: String?
}
