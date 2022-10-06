//
//  AchievementViewModel.swift
//  DemoMedalcase

import Foundation
import UIKit


struct HeaderItem: Hashable {
    let title: String
    let count: String
    let symbols: [MedalDetails]
}

struct MedalDetails: Hashable {
    let name: String
    let image: String
    let score: String
    
    init(name: String, image: String, score: String) {
        self.name = name
        self.image = image
        self.score = score
    }
}

enum ListItem: Hashable {
    case header(HeaderItem)
    case symbol(MedalDetails)
}


//MARK: - UICollectionViewDelegate & UICollectionViewDataSource Extension
extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataItems[section].symbols.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CellIdentifiers.kAchievementCVC,
            for: indexPath) as? AchievementCVC
        else {
            preconditionFailure("Invalid cell type")
        }
        cell.imgMedal.image = UIImage(named: self.dataItems[indexPath.section].symbols[indexPath.row].image)
        cell.lblMedalName.text = self.dataItems[indexPath.section].symbols[indexPath.row].name
        cell.lblScore.text = self.dataItems[indexPath.section].symbols[indexPath.row].score
        cell.vwLayer.isHidden = true
        if cell.lblMedalName.text == "Marathon"{cell.vwLayer.isHidden = false }
        
        return cell
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CellIdentifiers.kSectionHeader, for: indexPath) as? SectionHeader{
            sectionHeader.sectionHeaderlabel.text = self.dataItems[indexPath.section].title
            sectionHeader.lblCount.text = self.dataItems[indexPath.section].count
            return sectionHeader
        }
        return UICollectionReusableView()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let noOfCellsInRow = 2
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
        + flowLayout.sectionInset.right
        + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
        
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        return CGSize(width: size, height: 200)
    }
    
}
