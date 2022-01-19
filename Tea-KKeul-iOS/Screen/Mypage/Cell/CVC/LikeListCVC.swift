//
//  LikeListCVC.swift
//  Tea-KKeul-iOS
//
//  Created by 황윤경 on 2022/01/19.
//

import UIKit

class LikeListCVC: UICollectionViewCell {
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var teaName: UILabel!
    @IBOutlet weak var teaEffects: UILabel!
    @IBOutlet weak var teaPrice: UILabel!
    @IBOutlet weak var originCost: UILabel!
    
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    
    override func awakeFromNib() {
        setCancelLine()
        setLikeListCVC()
    }
}
//MARK: Custom Method
extension LikeListCVC {
    func setCancelLine() {
        let attributeString =  NSMutableAttributedString(string: originCost.text ?? "")
            
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
    }

    func setLikeListCVC() {
        layer.masksToBounds = false
        layer.shadowOpacity = 0.15
        layer.shadowRadius = 1
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowColor = UIColor.black.cgColor

        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 16
    }
    
    func setStars(_ count : Int) {
        if count == 1 {
            star2.image = UIImage()
            star3.image = UIImage()
            star4.image = UIImage()
            star5.image = UIImage()
        } else if count == 2 {
            star3.image = UIImage()
            star4.image = UIImage()
            star5.image = UIImage()
        } else if count == 3 {
            star4.image = UIImage()
            star5.image = UIImage()
        } else if count == 4 {
            star5.image = UIImage()
        }
    }
}
