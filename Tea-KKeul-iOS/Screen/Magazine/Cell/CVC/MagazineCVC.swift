//
//  MagazineCVC.swift
//  Tea-KKeul-iOS
//
//  Created by 황윤경 on 2022/01/18.
//

import UIKit

class MagazineCVC: UICollectionViewCell {
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        setMagazineCVC()
    }
}

extension MagazineCVC {
    func setMagazineCVC() {
        layer.masksToBounds = false
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 3
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowColor = UIColor.black.cgColor

        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 15
    }
}
