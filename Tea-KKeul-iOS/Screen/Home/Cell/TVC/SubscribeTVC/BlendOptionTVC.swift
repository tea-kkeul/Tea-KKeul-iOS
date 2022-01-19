//
//  BlendOptionTVC.swift
//  Tea-KKeul-iOS
//
//  Created by 이윤진 on 2022/01/20.
//

import UIKit

class BlendOptionTVC: UITableViewCell {
    @IBOutlet weak var blendOptionLabel: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var pomCheckButton: UIButton!
    @IBOutlet weak var pomLabel: UILabel!
    @IBOutlet weak var appleButton: UIButton!
    @IBOutlet weak var appleLabel: UILabel!
    @IBOutlet weak var orangeButton: UIButton!
    @IBOutlet weak var orangeLabel: UILabel!
    @IBOutlet weak var kiwiButton: UIButton!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var pineButton: UIButton!
    @IBOutlet weak var pineLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        checkButton.addTarget(self, action: #selector(didTapNoneOption), for: .touchUpInside)
        pomCheckButton.addTarget(self, action: #selector(didTapPomOption), for: .touchUpInside)
        appleButton.addTarget(self, action: #selector(didTapAppleOption), for: .touchUpInside)
        orangeButton.addTarget(self, action: #selector(didTapOrangeOption), for: .touchUpInside)
        kiwiButton.addTarget(self, action: #selector(didTapKiwiOption), for: .touchUpInside)
        pineButton.addTarget(self, action: #selector(didTapPineOption), for: .touchUpInside)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @objc func didTapNoneOption() {
        checkButton.setImage(UIImage(named: "check_selected"), for: .normal)
    }

    @objc func didTapPomOption() {
        pomCheckButton.setImage(UIImage(named: "check_selected"), for: .normal)
    }

    @objc func didTapAppleOption() {
        appleButton.setImage(UIImage(named: "check_selected"), for: .normal)
    }

    @objc func didTapOrangeOption() {
        orangeButton.setImage(UIImage(named: "check_selected"), for: .normal)
    }

    @objc func didTapKiwiOption() {
        kiwiButton.setImage(UIImage(named: "check_selected"), for: .normal)
    }

    @objc func didTapPineOption() {
        pineButton.setImage(UIImage(named: "check_selected"), for: .normal)
    }
    
}
