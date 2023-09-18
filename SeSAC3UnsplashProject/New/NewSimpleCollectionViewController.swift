//
//  NewSimpleCollectionViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by 백래훈 on 2023/09/14.
//

import UIKit
import SnapKit

class NewSimpleCollectionViewController: UIViewController {
    
    enum Section: Int, CaseIterable {
        case first = 2000
        case second = 1
    }
    
    let viewModel = NewSimpleViewModel()
    
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    
    var dataSource: UICollectionViewDiffableDataSource<String, User>!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        
        configureDataSource()
        
        viewModel.list.bind { data in
            self.updateSnapshot()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.viewModel.append()
        }
        
    }
    
    func configureView() {
        let searchBar = UISearchBar()
        searchBar.delegate = self
        navigationItem.titleView = searchBar
        
        view.addSubview(collectionView)
        collectionView.delegate = self
        
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func updateSnapshot() {
        var snapShot = NSDiffableDataSourceSnapshot<String, User>()
        
        snapShot.appendSections(["고래밥" , "RB"]) // 섹션은 1개
        snapShot.appendItems(viewModel.list.value, toSection: "고래밥")
        snapShot.appendItems(viewModel.list2, toSection: "RB")
        
        dataSource.apply(snapShot) // snapShot을 찰칵 찍어두고 dataSource에 apply(적용) 할게~
        
    }
    
    static private func createLayout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.showsSeparators = false
        configuration.backgroundColor = .systemGreen
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }
    
    private func configureDataSource() {
        
        // UICollectionView.CellRegistration: iOS14, 메서드 대신 제네릭을 사용, 셀이 생성될 때마다 클로저가 호출
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, User>(handler: { cell, indexPath, itemIdentifier in
            // 샐 디자인 및 데이터 처리
            var content = UIListContentConfiguration.valueCell()
            content.text = itemIdentifier.name
            content.textProperties.color = .brown
            content.secondaryText = "\(itemIdentifier.age)살"
            content.image = UIImage(systemName: "star.fill")
            content.imageProperties.tintColor = .systemRed
            content.prefersSideBySideTextAndSecondaryText = false
            content.textToSecondaryTextVerticalPadding = 10
            cell.contentConfiguration = content
            
            var backgroundConfig = UIBackgroundConfiguration.listPlainCell()
            backgroundConfig.backgroundColor = .systemGray5
            backgroundConfig.cornerRadius = 10
            backgroundConfig.strokeWidth = 2
            backgroundConfig.strokeColor = .systemPink
            cell.backgroundConfiguration = backgroundConfig
            
        })
        
        //CellForItemAt
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
            
            return cell
            
        })
    }
}

extension NewSimpleCollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        let user = viewModel.list.value[indexPath.item]
        
        guard let item = dataSource.itemIdentifier(for: indexPath) else { return }
        dump(item)
        
        
//        viewModel.removeUser(idx: indexPath.item)
    }
}

extension NewSimpleCollectionViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        viewModel.insertUser(name: text)
    }
}

//extension NewSimpleCollectionViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return list.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: list[indexPath.item])
//        return cell
//    }
//}
