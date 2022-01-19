//
//  LikeListVC.swift
//  Tea-KKeul-iOS
//
//  Created by 황윤경 on 2022/01/19.
//

import UIKit

class LikeListVC: UIViewController {
    let LikeListData = [
        ["LikeList_CV1", "귤껍질차", "피로회복, 식욕증진", "12,900원", "15,900원", 5],
        ["LikeList_CV2", "대추차", "식욕증진, 심신안정", "12,900원", "15,900원", 4],
        ["LikeList_CV3", "페퍼민트차", "혈액순환, 해독효과, 숙면", "12,900원", "15,900원", 5],
        ["LikeList_CV4", "메밀차", "장운동, 간기능 강화", "12,900원", "15,900원", 3]
    ]
    let sectionInsets = UIEdgeInsets(top: 24, left: 20, bottom: 24, right: 20)
    
    @IBOutlet weak var likeListCV: UICollectionView!
    override func viewDidLoad() {
        setNaviBar()
        setLikeListCV()
    }
}
//MARK: Custom Method
extension LikeListVC {
    func setNaviBar() {
        navigationItem.title = "찜 목록"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.darkGreen]
    }
    
    func setLikeListCV() {
        likeListCV.dataSource = self
        likeListCV.delegate = self
    }
}
//MARK: UICollectionViewDataSource
extension LikeListVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return LikeListData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = likeListCV.dequeueReusableCell(withReuseIdentifier: Identifiers.likeListCVC, for: indexPath) as! LikeListCVC
        
        cell.photo.image = UIImage(named: "\(LikeListData[indexPath.row][0])")
        cell.teaName.text = "\(LikeListData[indexPath.row][1])"
        cell.teaEffects.text = "\(LikeListData[indexPath.row][2])"
        cell.teaPrice.text = "\(LikeListData[indexPath.row][3])"
        cell.originCost.text = "\(LikeListData[indexPath.row][4])"
        cell.setStars(LikeListData[indexPath.row][5] as! Int)
        
        cell.contentView.layer.masksToBounds = true
        
        return cell
    }
    
    
}
//MARK: UICollectionViewDelegate
extension LikeListVC: UICollectionViewDelegate {
    
}
//MARK: UICollectionViewDelegateFlowLayout
extension LikeListVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 159, height: 261)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
