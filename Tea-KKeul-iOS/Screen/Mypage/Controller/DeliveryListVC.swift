//
//  DeliveryListVC.swift
//  Tea-KKeul-iOS
//
//  Created by 황윤경 on 2022/01/19.
//

import UIKit

class DeliveryListVC: UIViewController {
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
        return 1
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
