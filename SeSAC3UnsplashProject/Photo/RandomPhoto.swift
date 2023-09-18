//
//  RandomPhoto.swift
//  SeSAC3UnsplashProject
//
//  Created by 백래훈 on 2023/09/18.
//

import Foundation

// MARK: - RandomPhoto
struct RandomPhoto: Codable {
    let id: String?
    let urls: Urlss?
    let likes: Int?
    
}

// MARK: - Urls
struct Urlss: Codable {
    let raw, full, regular, small: String
    let thumb: String
}
