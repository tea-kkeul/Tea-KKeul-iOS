//
//  ConditionCheckTVC.swift
//  Tea-KKeul-iOS
//
//  Created by 이윤진 on 2022/01/18.
//

import UIKit

class ConditionCheckTVC: UITableViewCell {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!

    @IBOutlet weak var state1: UIButton!
    @IBOutlet weak var state2: UIButton!
    @IBOutlet weak var state3: UIButton!
    @IBOutlet weak var state4: UIButton!
    @IBOutlet weak var state5: UIButton!
    @IBOutlet weak var state6: UIButton!
    @IBOutlet weak var state7: UIButton!
    @IBOutlet weak var state8: UIButton!
    @IBOutlet weak var state9: UIButton!
    @IBOutlet weak var state10: UIButton!
    @IBOutlet weak var state11: UIButton!
    @IBOutlet weak var state12: UIButton!

    @IBOutlet weak var submitButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        button1.addTarget(self, action: #selector(didTapFirstButton), for: .touchUpInside)
        button2.addTarget(self, action: #selector(didTapSecondButton), for: .touchUpInside)
        button3.addTarget(self, action: #selector(didTapThirdButton), for: .touchUpInside)
        button4.addTarget(self, action: #selector(didTapForthButton), for: .touchUpInside)
        button5.addTarget(self, action: #selector(didTapFifthButton), for: .touchUpInside)
        // Initialization code
        state1.addTarget(self, action: #selector(didTapState1), for: .touchUpInside)
        state2.addTarget(self, action: #selector(didTapState2), for: .touchUpInside)
        state11.addTarget(self, action: #selector(didTapState11), for: .touchUpInside)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @objc func didTapSubmitButton() {

    }

    @objc func didTapState1() {
        state1.setImage(UIImage(named: "a"), for: .normal)
    }
    @objc func didTapState2() {
        state2.setImage(UIImage(named: "b"), for: .normal)
    }
    @objc func didTapState11() {
        state2.setImage(UIImage(named: "c"), for: .normal)
    }

}

// MARK: - didTapButton() 나뭇잎 버튼
extension ConditionCheckTVC {
    @objc func didTapFirstButton() {
        button1.setImage(UIImage(named: "Rectangle 40"), for: .normal)
        button2.setImage(UIImage(named: "button_empty-1"), for: .normal)
        button3.setImage(UIImage(named: "button_empty-1"), for: .normal)
        button4.setImage(UIImage(named: "button_empty-1"), for: .normal)
        button5.setImage(UIImage(named: "button_empty-1"), for: .normal)
    }
    
    @objc func didTapSecondButton() {
        button1.setImage(UIImage(named: "Rectangle 40"), for: .normal)
        button2.setImage(UIImage(named: "Rectangle 40"), for: .normal)
        button3.setImage(UIImage(named: "button_empty-1"), for: .normal)
        button4.setImage(UIImage(named: "button_empty-1"), for: .normal)
        button5.setImage(UIImage(named: "button_empty-1"), for: .normal)
    }
    
    @objc func didTapThirdButton() {
        button1.setImage(UIImage(named: "Rectangle 40"), for: .normal)
        button2.setImage(UIImage(named: "Rectangle 40"), for: .normal)
        button3.setImage(UIImage(named: "Rectangle 40"), for: .normal)
        button4.setImage(UIImage(named: "button_empty-1"), for: .normal)
        button5.setImage(UIImage(named: "button_empty-1"), for: .normal)
    }
    
    @objc func didTapForthButton() {
        button1.setImage(UIImage(named: "Rectangle 40"), for: .normal)
        button2.setImage(UIImage(named: "Rectangle 40"), for: .normal)
        button3.setImage(UIImage(named: "Rectangle 40"), for: .normal)
        button4.setImage(UIImage(named: "Rectangle 40"), for: .normal)
        button5.setImage(UIImage(named: "button_empty-1"), for: .normal)
    }
    
    @objc func didTapFifthButton() {
        button1.setImage(UIImage(named: "Rectangle 40"), for: .normal)
        button2.setImage(UIImage(named: "Rectangle 40"), for: .normal)
        button3.setImage(UIImage(named: "Rectangle 40"), for: .normal)
        button4.setImage(UIImage(named: "Rectangle 40"), for: .normal)
        button5.setImage(UIImage(named: "Rectangle 40"), for: .normal)
    }
}
