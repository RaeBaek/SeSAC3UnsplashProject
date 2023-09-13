//
//  PhotoViewModel.swift
//  SeSAC3UnsplashProject
//
//  Created by 백래훈 on 2023/09/12.
//

import Foundation

class PhotoViewModel {
    
    var list = Observable(Photo(total: 0, total_pages: 0, results: []))
    
    var rowCount: Int {
        return list.value.results?.count ?? 0
    }
    
    func fetchPhoto() {
        APIService.shared.callRequest(query: "sky") { photo in
            guard let photo = photo else { return }
            
            self.list.value = photo
            
        }
    }
    
    func cellForRowAt(at indexPath: IndexPath) -> PhotoResult {
        
        if let result = list.value.results?[indexPath.row] {
            return result
        }
        return PhotoResult(id: nil, created_at: nil, description: nil, urls: nil, links: nil, user: nil)
    }
    
}
