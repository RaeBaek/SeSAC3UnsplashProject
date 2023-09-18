//
//  RandomPhotoViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by 백래훈 on 2023/09/18.
//

import UIKit

class RandomPhotoViewController: UIViewController {
    
    let viewModel = RandomPhotoViewModel()
    
    let randomImage = {
        let view = UIImageView()
        view.backgroundColor = .systemGray5
        return view
    }()
    
    lazy var requestButton = {
        let view = UIButton()
        view.setTitle("랜덤 이미지 가져오기", for: .normal)
        view.layer.cornerRadius = 5
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setConstraints()
        
        viewModel.randomPhoto.bind { randomPhoto in
            
            guard let urls = randomPhoto.urls else { return }
            guard let url = URL(string: urls.full) else { return }
            
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        self.randomImage.image = UIImage(data: data)
                    }
                }
            }
        }
    }
    
    func configureView() {
        view.backgroundColor = .systemBackground
        view.addSubview(randomImage)
        view.addSubview(requestButton)
        
    }
    
    func setConstraints() {
        randomImage.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.height.equalTo(randomImage.snp.width)
        }
        
        requestButton.snp.makeConstraints {
            $0.top.equalTo(randomImage.snp.bottom).offset(20)
            $0.horizontalEdges.equalTo(randomImage.snp.horizontalEdges)
            $0.height.equalTo(50)
        }
        
    }
    
    @objc func buttonClicked() {
        viewModel.fetchPhoto()
    }
    
    
}
