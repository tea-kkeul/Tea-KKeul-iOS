//
//  TotalCostTVC.swift
//  Tea-KKeul-iOS
//
//  Created by 이윤진 on 2022/01/20.
//

import UIKit

class TotalCostTVC: UITableViewCell {

    @IBOutlet weak var DeliveryFeeLabel: UILabel!
    @IBOutlet weak var totalCostLabel: UILabel!
    @IBOutlet weak var totalTeaCostLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
