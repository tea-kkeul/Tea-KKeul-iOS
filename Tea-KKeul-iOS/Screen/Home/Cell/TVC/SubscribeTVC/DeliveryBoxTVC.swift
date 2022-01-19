//
//  DeliveryBoxTVC.swift
//  Tea-KKeul-iOS
//
//  Created by 이윤진 on 2022/01/19.
//

import UIKit

class DeliveryBoxTVC: UITableViewCell {

    @IBOutlet weak var boxButton: UIButton!
    @IBOutlet weak var myBoxButton: UIButton!


    override func awakeFromNib() {
        super.awakeFromNib()
        boxButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        myBoxButton.addTarget(self, action: #selector(didTapMyBoxButton), for: .touchUpInside)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    @objc func didTapButton() {
        boxButton.setImage(UIImage(named: "Group 507"), for: .normal)
    }

    @objc func didTapMyBoxButton() {
        myBoxButton.setImage(UIImage(named: "Group 508"), for: .normal)
    }
    
}

