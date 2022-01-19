//
//  AddressEnrollCVC.swift
//  Tea-KKeul-iOS
//
//  Created by 황윤경 on 2022/01/19.
//

import UIKit

class AddressEnrollCVC: UICollectionViewCell {
    @IBOutlet weak var enrollBtn: UIButton!
    
    override func awakeFromNib() {
        setEnrollBtnLayout()
    }
}
extension AddressEnrollCVC {
    func setEnrollBtnLayout() {
        enrollBtn.layer.cornerRadius = 10
        enrollBtn.backgroundColor = .normalGreen
        enrollBtn.tintColor = .white
    }
}