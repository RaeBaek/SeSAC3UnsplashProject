//
//  SettingViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by 백래훈 on 2023/09/15.
//

import UIKit
import SnapKit

// Section 열거형 선언
enum Section: Int, CaseIterable {
    case first
    case second
    case third
    case fourth
    
}

class SettingViewController: UIViewController {
    
    let list = ItemList()
    
    // 컬렉션 뷰 생성
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    
    // 컬렉션 뷰에 보여질 데이터 소스 선언
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        setConstraints()
        
    }
    
    func configureView() {
        view.addSubview(collectionView)
        
        configureDataSource()
        applyInitialSnapshots()
  
    }
    
    func setConstraints() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
    
    // 컬렉션 뷰 레이아웃 반환 함수
    static private func createLayout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        
        return layout
        
    }
    
    // 스냅샷 적용 함수
    func applyInitialSnapshots() {
        
        let sections = Section.allCases
        var snapShot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapShot.appendSections(sections)
        
        snapShot.appendItems(list.firstSection, toSection: .first)
        snapShot.appendItems(list.secondSection, toSection: .second)
        snapShot.appendItems(list.thirdSection, toSection: .third)
        snapShot.appendItems(list.fourthSection, toSection: .fourth)
        
//        dataSource.apply(snapShot)
        dataSource.apply(snapShot, animatingDifferences: false)
        
    }
    
    // 첫번째 CellRegistration을 반환하는 함수
    func createFirstCellRegistration() -> UICollectionView.CellRegistration<UICollectionViewListCell, Item> {
        return UICollectionView.CellRegistration<UICollectionViewListCell, Item> { cell, indexPath, itemIdentifier in
            
            var content = UIListContentConfiguration.valueCell()
            
            content.text = itemIdentifier.title
            content.textProperties.font = .systemFont(ofSize: 20, weight: .regular)
            content.secondaryText = itemIdentifier.detail
            content.secondaryTextProperties.font = .systemFont(ofSize: 13, weight: .regular)
            content.secondaryTextProperties.color = .black
            content.prefersSideBySideTextAndSecondaryText = false
            
            
            content.image = UIImage(named: itemIdentifier.image)
            guard let width = content.image?.size.width else { return }
            content.imageProperties.cornerRadius = width / 2
            
//            var backgroundConfig = UIBackgroundConfiguration.listPlainCell()
//            backgroundConfig.backgroundColor = .systemBackground
//            backgroundConfig.cornerRadius = 10
//            backgroundConfig.strokeWidth = 2
//            backgroundConfig.strokeColor = .systemCyan
            
//            cell.backgroundConfiguration = backgroundConfig
            cell.accessories = [.disclosureIndicator()]
            cell.contentConfiguration = content
        }
    }
    
    // 두번째 CellRegistration을 반환하는 함수
    func createSecondCellRegistration() -> UICollectionView.CellRegistration<UICollectionViewListCell, Item> {
        return UICollectionView.CellRegistration<UICollectionViewListCell, Item> { cell, indexPath, itemIdentifier in
            
            var content = UIListContentConfiguration.valueCell()
            
            content.text = itemIdentifier.title
            content.secondaryText = itemIdentifier.stateTitle
            content.image = UIImage(systemName: itemIdentifier.image)
            content.imageProperties.tintColor = .black
            content.imageProperties.cornerRadius = 10
            
            cell.accessories = [.disclosureIndicator()]
            cell.contentConfiguration = content
            
        }
    }
    
    // 세번째 CellRegistration을 반환하는 함수
    func createThirdCellRegistration() -> UICollectionView.CellRegistration<UICollectionViewListCell, Item> {
        return UICollectionView.CellRegistration<UICollectionViewListCell, Item> { cell, indexPath, itemIdentifier in
            
            var content = UIListContentConfiguration.valueCell()
            
            content.text = itemIdentifier.title
            content.image = UIImage(systemName: itemIdentifier.image)
            content.imageProperties.tintColor = .black
            content.imageProperties.cornerRadius = 10
            
            cell.accessories = [.disclosureIndicator()]
            cell.contentConfiguration = content
            
        }
    }
    
    // 네번째 CellRegistration을 반환하는 함수
    func createFourthCellRegistration() -> UICollectionView.CellRegistration<UICollectionViewListCell, Item> {
        return UICollectionView.CellRegistration<UICollectionViewListCell, Item> { cell, indexPath, itemIdentifier in
            
            var content = UIListContentConfiguration.valueCell()
            
            content.text = itemIdentifier.title
            content.image = UIImage(systemName: itemIdentifier.image)
            content.imageProperties.tintColor = .black
            content.imageProperties.cornerRadius = 10
            
            cell.accessories = [.disclosureIndicator()]
            cell.contentConfiguration = content
            
        }
    }
    
    // 데이터 소스 처리 함수
    private func configureDataSource() {
        
        let firstRegistration = createFirstCellRegistration()
        let secondRegistration = createSecondCellRegistration()
        let thirdRegistration = createThirdCellRegistration()
        let fourthRegistration = createFourthCellRegistration()
        
        //CellForItemAt
        dataSource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            guard let section = Section(rawValue: indexPath.section) else { fatalError("Unknown Section") }
            switch section {
            case .first:
                return collectionView.dequeueConfiguredReusableCell(using: firstRegistration, for: indexPath, item: itemIdentifier)
            case .second:
                return collectionView.dequeueConfiguredReusableCell(using: secondRegistration, for: indexPath, item: itemIdentifier)
            case .third:
                return collectionView.dequeueConfiguredReusableCell(using: thirdRegistration, for: indexPath, item: itemIdentifier)
            case .fourth:
                return collectionView.dequeueConfiguredReusableCell(using: fourthRegistration, for: indexPath, item: itemIdentifier)
            }
        })
            
    }
}
