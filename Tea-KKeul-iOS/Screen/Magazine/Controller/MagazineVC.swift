//
//  MagazineVC.swift
//  Tea-KKeul-iOS
//
//  Created by 황윤경 on 2022/01/18.
//

import UIKit
import SafariServices

class MagazineVC: UIViewController {
    let DummyMagazineData = [
        ["magazine1", "지나친 기대도 실망도 없는 영국 차문화","https://brunch.co.kr/@beansj/228"],
        ["magazine2", "중국 Tea 파헤치기","https://brunch.co.kr/magazine/exploring-tea"],
        ["magazine3", "Tea 웨이의 브런치", "https://brunch.co.kr/@manitea#articles"],
        ["magazine4", "습식다법과 건식다법의 차이", "https://brunch.co.kr/@timetotea/51"],
        ["magazine5", "차를 오래 보관하려면", "https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=pko1127&logNo=220963488655"],
        ["magazine6", "차 제대로 마시는 법", "https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=nobia10004&logNo=220576482500"],
    ]
    
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var magazineCV: UICollectionView!
    
    let sectionInsets = UIEdgeInsets(top: 15, left: 20, bottom: 15, right: 20)
    
    override func viewDidLoad() {
        setTitleView()
        setMagazineCV()
    }
}
//MARK: Custom Method
extension MagazineVC {
    // titleView border Setting
    func setTitleView() {
        titleView.layer.borderWidth = 1
        titleView.layer.borderColor = UIColor.systemGray3.cgColor
    }
    // Magazine collectionView Setting
    func setMagazineCV() {
        magazineCV.dataSource = self
        magazineCV.delegate = self
        
        magazineCV.backgroundColor = .white
    }
    // 앱 내에서 Safari Open
    func openSafari(with url: URL?) {
      guard let url = url else { return }

      let config = SFSafariViewController.Configuration()
      let vc = SFSafariViewController(url: url, configuration: config)

      present(vc, animated: true)
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let url = URL(string: "\(DummyMagazineData[indexPath.row][2])")
        
        openSafari(with: url!)
    }
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
