//
//  AddressCVC.swift
//  Tea-KKeul-iOS
//
//  Created by 황윤경 on 2022/01/19.
//

import UIKit

class AddressCVC: UICollectionViewCell {
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var isDefaultAddress: UILabel!
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var address1: UILabel!
    @IBOutlet weak var address2: UILabel!
    @IBOutlet weak var address3: UILabel!
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var phoneNum: UILabel!
    
    override func awakeFromNib() {
        setBackgroundColor()
    }
}
extension AddressCVC {
    func setBackgroundColor() {
        self.backgroundColor = .white
    }
    
    func setDefaultAddress() {
        isDefaultAddress.layer.borderWidth = 1
        isDefaultAddress.layer.borderColor = UIColor.darkGreen.cgColor
        
        isDefaultAddress.layer.cornerRadius = isDefaultAddress.frame.height / 2
        isDefaultAddress.textColor = UIColor.darkGreen
    }
}
