//
//  MagazineVC.swift
//  Tea-KKeul-iOS
//
//  Created by 황윤경 on 2022/01/18.
//

import UIKit

class MagazineVC: UIViewController {
    @IBOutlet weak var magazineCV: UICollectionView!
    
    let sectionInsets = UIEdgeInsets(top: 15, left: 20, bottom: 15, right: 20)
    
    override func viewDidLoad() {
        setMagazineCV()
    }
}
//MARK: Custom Method
extension MagazineVC {
    func setMagazineCV() {
        magazineCV.dataSource = self
        magazineCV.delegate = self
    }
}

//MARK: UICollectionViewDataSource
extension MagazineVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = magazineCV.dequeueReusableCell(withReuseIdentifier: Identifiers.magazineCVC, for: indexPath)
        
        return cell
    }
    
    
}

//MARK: UICollectionViewDelegate
extension MagazineVC: UICollectionViewDelegate {
    
}

//MARK:
extension MagazineVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        
        let widthPadding = sectionInsets.left * 2
        let cellWidth = width - widthPadding
        let cellHeight = cellWidth * 0.61
        
        print(cellWidth, cellHeight)
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
