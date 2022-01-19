//
//  SubscribePeriodTVC.swift
//  Tea-KKeul-iOS
//
//  Created by 이윤진 on 2022/01/20.
//

import UIKit

class SubscribePeriodTVC: UITableViewCell {

    @IBOutlet weak var fourWeekSubscribeButton: UIButton!
    @IBOutlet weak var twoWeekSubscribeButton: UIButton!
    @IBOutlet weak var subscribeButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        subscribeButton.addTarget(self, action: #selector(didTapSubscribeButton), for: .touchUpInside)
        twoWeekSubscribeButton.addTarget(self, action: #selector(didTapTwoSubscribeButton), for: .touchUpInside)
        fourWeekSubscribeButton.addTarget(self, action: #selector(didTapFourSubscribeButton), for: .touchUpInside)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    @objc func didTapSubscribeButton() {
        subscribeButton.setImage(UIImage(named: "Group 515"), for: .normal)
    }

    @objc func didTapTwoSubscribeButton() {
        subscribeButton.setImage(UIImage(named: "Group 516"), for: .normal)
    }

    @objc func didTapFourSubscribeButton() {
        subscribeButton.setImage(UIImage(named: "Group518"), for: .normal)
    }
}
