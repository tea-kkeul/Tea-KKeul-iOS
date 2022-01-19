//
//  DeliveryBoxTVC.swift
//  Tea-KKeul-iOS
//
//  Created by 이윤진 on 2022/01/19.
//

import UIKit

class DeliveryBoxTVC: UITableViewCell {

    @IBOutlet weak var boxButton: UIButton!
    var cellDelegate: DeliveryBoxTapDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    @objc func didTapButton() {
        cellDelegate?.didTapDeliveryBox()
    }
    
}

protocol DeliveryBoxTapDelegate: AnyObject {
    func didTapDeliveryBox()
}
