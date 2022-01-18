//
//  MagazineVC.swift
//  Tea-KKeul-iOS
//
//  Created by 황윤경 on 2022/01/18.
//

import UIKit

class MagazineVC: UIViewController {
    let DummyMagazineData = [
        ["magazine1", "지나친 기대도 실망도 없는 영국 차문화"],
        ["magazine2", "중국 Tea 파헤치기"],
        ["magazine3", "Tea 웨이의 브런치"],
        ["magazine4", "습식다법과 건식다법의 차이"],
        ["magazine5", "차를 오래 보관하려면"],
        ["magazine6", "차 제대로 마시는 법"],
    ]
    
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
        
        magazineCV.backgroundColor = .systemGray4
    }
}

//MARK: UICollectionViewDataSource
extension MagazineVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = magazineCV.dequeueReusableCell(withReuseIdentifier: Identifiers.magazineCVC, for: indexPath) as! MagazineCVC
        cell.thumbnail.image = UIImage(named: "\(DummyMagazineData[indexPath.row][0])")
        cell.title.text = "\(DummyMagazineData[indexPath.row][1])"

        cell.contentView.layer.masksToBounds = true
        
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
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
