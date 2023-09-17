//
//  MancityViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by 백래훈 on 2023/09/15.
//

import UIKit
import SnapKit

class MancityViewController: UIViewController {
    
    let tableView = UITableView()
    let collectionView = UICollectionView()
    let mancity = PlayerList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        setConstraints()
        
    }
    
    func configureView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func setConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
    
}

extension MancityViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mancity.forwards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
        
        cell.textLabel?.text = mancity.forwards[indexPath.row].name
        cell.detailTextLabel?.text = "\(mancity.forwards[indexPath.row].backNumber)"
        
        return cell
    }
    
    
}
