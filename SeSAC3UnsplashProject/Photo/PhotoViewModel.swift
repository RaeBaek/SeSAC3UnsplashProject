//
//  PhotoViewModel.swift
//  SeSAC3UnsplashProject
//
//  Created by 백래훈 on 2023/09/12.
//

import Foundation

class PhotoViewModel {
    
    var list = Observable(Photo(total: 0, total_pages: 0, results: []))
    
    func fetchPhoto(text: String) {
        APIService.shared.callRequest(query: text) { photo in
            
            guard let photo = photo else { return }
            
            self.list.value = photo
            
        }
    }
    
    var rowCount: Int {
        return list.value.results.count
    }
    
    func cellForRowAt(at indexPath: IndexPath) -> PhotoResult {
        return list.value.results[indexPath.row]
    }
    
}
