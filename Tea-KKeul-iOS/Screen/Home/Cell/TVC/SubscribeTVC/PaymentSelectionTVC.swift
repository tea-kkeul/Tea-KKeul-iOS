//
//  PaymentSelectionTVC.swift
//  Tea-KKeul-iOS
//
//  Created by 이윤진 on 2022/01/20.
//

import UIKit

class PaymentSelectionTVC: UITableViewCell {

    @IBOutlet weak var phonePayButton: UIButton!
    @IBOutlet weak var accountPayButton: UIButton!
    @IBOutlet weak var cardPayButton: UIButton!
    @IBOutlet weak var easyPayButton: UIButton!
    @IBOutlet weak var cautionLabel: UILabel!
    @IBOutlet weak var subscribeButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
