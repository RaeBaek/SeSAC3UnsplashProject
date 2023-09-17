//
//  AttentionModeViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by 백래훈 on 2023/09/17.
//

import UIKit

enum Mode: Int, CaseIterable {
    case first
    case second
}

class AttentionModeViewController: BaseViewController {
    
    let list = AttentionList()
    
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    
    var dataSource: UICollectionViewDiffableDataSource<Mode, Content>!
    
    // UICollectionView는 UITableView와 다르게 titleForHeaderInSection 과 titleForFooterInSection 함수가 없는 것 같다.
    // title을 구현하려면 UICollectionViewDiffableDataSource가 아닌 UITableViewDiffableDataSource을 사용해야할 것 같다!
    class DataSource: UICollectionViewDiffableDataSource<Mode, Content> {
        
    }
    
    override func configureView() {
        super.configureView()
        
        view.addSubview(collectionView)
        
        title = "집중 모드"
        
        configureDataSource()
        applyInitialSnapshots()
        
    }
    
    override func setConstaints() {
        super.setConstaints()
        
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
    
    static private func createLayout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        
        return layout
    }
    
    func applyInitialSnapshots() {
        let sections = Mode.allCases
        var snapShot = NSDiffableDataSourceSnapshot<Mode, Content>()
        snapShot.appendSections(sections)
        
        snapShot.appendItems(list.fistList, toSection: .first)
        snapShot.appendItems(list.secondList, toSection: .second)
        
        dataSource.apply(snapShot, animatingDifferences: false, completion: nil)
    }
    
    // 첫번째 CellRegistration을 반환하는 함수
    func createFirstCellRegistration() -> UICollectionView.CellRegistration<UICollectionViewListCell, Content> {
        return UICollectionView.CellRegistration<UICollectionViewListCell, Content> { cell, indexPath, itemIdentifier in
            
            var content = UIListContentConfiguration.valueCell()
            
            content.text = itemIdentifier.title
            content.secondaryText = itemIdentifier.state
            content.secondaryTextProperties.color = .black
            content.image = UIImage(systemName: itemIdentifier.image ?? "")
            content.imageProperties.tintColor = itemIdentifier.color
            
            if indexPath.row == 2 {
                content.prefersSideBySideTextAndSecondaryText = false
                content.secondaryTextProperties.font = .systemFont(ofSize: 12, weight: .regular)
            }
            
            cell.accessories = [.disclosureIndicator()]
            cell.contentConfiguration = content
        }
    }
    
    
    // 두번째 CellRegistration을 반환하는 함수
    func createSecondCellRegistation() -> UICollectionView.CellRegistration<UICollectionViewListCell, Content> {
        return UICollectionView.CellRegistration<UICollectionViewListCell, Content> { cell, indexPath, itemIdentifier in
        
            var content = UIListContentConfiguration.valueCell()
        
            content.text = itemIdentifier.title
            
            cell.accessories = [.disclosureIndicator()]
            cell.contentConfiguration = content
            
        }
    }
    
    // 데이터 소스 처리 함수
    private func configureDataSource() {
        
        let firstRegistration = createFirstCellRegistration()
        let secondRegistration = createSecondCellRegistation()
        
        dataSource = UICollectionViewDiffableDataSource<Mode, Content>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            guard let section = Mode(rawValue: indexPath.section) else { fatalError("Unknown Section") }
            switch section {
            case .first:
                return collectionView.dequeueConfiguredReusableCell(using: firstRegistration, for: indexPath, item: itemIdentifier)
            case .second:
                return collectionView.dequeueConfiguredReusableCell(using: secondRegistration, for: indexPath, item: itemIdentifier)
            }
            
        })
    }
    
}
