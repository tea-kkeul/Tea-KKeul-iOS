//
//  DeliveryListVC.swift
//  Tea-KKeul-iOS
//
//  Created by 황윤경 on 2022/01/19.
//

import UIKit

class DeliveryListVC: UIViewController {
    let AddressData = [
        ["집", ["서울특별시 노원구 공릉로 20번길 15-3(공릉동)", "티끌아파트 506동 1203호", "(02708)"], "김슈니", "010-1234-5678"],
        ["회사", ["서울특별시 종로구 세종대로 178(종로3가동)", "트윈빌딩 A동 605호", "(04509)"], "김슈니", "010-1234-5678"]
    ]
    @IBOutlet weak var addressListCV: UICollectionView!
    override func viewDidLoad() {
        setNaviBar()
        setAddressListCV()
    }
}
//MARK: Custom Method
extension DeliveryListVC {
    func setNaviBar() {
        navigationItem.title = "배송지 관리"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.normalGreen]
    }
    
    func setAddressListCV() {
        addressListCV.dataSource = self
        addressListCV.delegate = self
    }
}
//MARK: UICollectionViewDataSource
extension DeliveryListVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AddressData.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = addressListCV.dequeueReusableCell(withReuseIdentifier: Identifiers.addressEnrollCVC, for: indexPath) as! AddressEnrollCVC
        
        return cell
    }
    
    
}
//MARK: UICollectionViewDelegate
extension DeliveryListVC: UICollectionViewDelegate {
    
}

extension DeliveryListVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 375, height: 128)
    }
}
