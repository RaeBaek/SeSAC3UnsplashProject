//
//  SetModeViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by 백래훈 on 2023/09/17.
//

import UIKit

class SetModeViewController: BaseViewController {
    
    enum Title: Int, CaseIterable {
        case first
        case second
        case third
    }
    
    class DataSource: UITableViewDiffableDataSource<Title, Setting> {
        override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            
            let errorString = "섹션 테이블 오류!"
            
            guard let section = Title(rawValue: section) else { return errorString }
            
            switch section {
            case .first: return "전체 설정"
            case .second: return "개인 설정"
            case .third: return "기타"
            }
            
        }
    }
    
    let list = SettingList()
    
    var tableView = UITableView()
    
    var dataSource: DataSource?
    
    override func configureView() {
        super.configureView()
        
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = dataSource
        
        title = "설정"
        
        configureDataSource()
        applyInitialSnapshots()
        
    }
    
    override func setConstaints() {
        super.setConstaints()
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func applyInitialSnapshots() {
        let sections = Title.allCases
        var snapShot = NSDiffableDataSourceSnapshot<Title, Setting>()
        
        snapShot.appendSections(sections)
        
        snapShot.appendItems(list.allSet, toSection: .first)
        snapShot.appendItems(list.personalSet, toSection: .second)
        snapShot.appendItems(list.etc, toSection: .third)
        
        dataSource?.apply(snapShot, animatingDifferences: false)
        
    }
    
    func configureDataSource() {
        dataSource = DataSource(tableView: tableView, cellProvider: { tableView, indexPath, itemIdentifier in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
            var content = cell.defaultContentConfiguration()
            
            content.text = itemIdentifier.title
            cell.contentConfiguration = content
            
            return cell
        })
    }
    
}
