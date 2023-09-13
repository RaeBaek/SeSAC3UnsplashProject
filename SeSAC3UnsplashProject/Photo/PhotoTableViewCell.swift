//
//  PhotoTableViewCell.swift
//  SeSAC3UnsplashProject
//
//  Created by 백래훈 on 2023/09/13.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {
    
    @IBOutlet var photoImage: UIImageView!
    
    let identifier = "PhotoTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.photoImage.image = nil
    }
    
    func configure(data: PhotoResult) {
        
        // cell도 하나의 ViewController라고 볼 수 있다.
        // 그러므로 cell에 대한 cell Model을 만들어 cell에 보여질 데이터를 cell Model 에서 가공할 수 있도록 추후에 수정해보자.
        guard let link = data.urls?.full else { return }
        guard let url = URL(string: link) else { return }
        
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.photoImage.image = image
                    }
                }
            }
        }
    }
}

