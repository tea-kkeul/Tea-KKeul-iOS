//
//  ConditionCheckTVC.swift
//  Tea-KKeul-iOS
//
//  Created by 이윤진 on 2022/01/18.
//

import UIKit

struct MyState : Codable {
    let idx: Int
    let state: String
}

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
    
    var myLeaf: Int = 0
    var myState:[MyState] = []
    
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
        submitButton.addTarget(self, action: #selector(didTapSubmitButton), for: .touchUpInside)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @objc func didTapSubmitButton() {
        print("leaf", myLeaf)
        print("state", myState[0].state)
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
        myLeaf = 1
    }
    
    @objc func didTapSecondButton() {
        button1.setImage(UIImage(named: "Rectangle 40"), for: .normal)
        button2.setImage(UIImage(named: "Rectangle 40"), for: .normal)
        button3.setImage(UIImage(named: "button_empty-1"), for: .normal)
        button4.setImage(UIImage(named: "button_empty-1"), for: .normal)
        button5.setImage(UIImage(named: "button_empty-1"), for: .normal)
        myLeaf = 2
    }
    
    @objc func didTapThirdButton() {
        button1.setImage(UIImage(named: "Rectangle 40"), for: .normal)
        button2.setImage(UIImage(named: "Rectangle 40"), for: .normal)
        button3.setImage(UIImage(named: "Rectangle 40"), for: .normal)
        button4.setImage(UIImage(named: "button_empty-1"), for: .normal)
        button5.setImage(UIImage(named: "button_empty-1"), for: .normal)
        myLeaf = 3
    }
    
    @objc func didTapForthButton() {
        button1.setImage(UIImage(named: "Rectangle 40"), for: .normal)
        button2.setImage(UIImage(named: "Rectangle 40"), for: .normal)
        button3.setImage(UIImage(named: "Rectangle 40"), for: .normal)
        button4.setImage(UIImage(named: "Rectangle 40"), for: .normal)
        button5.setImage(UIImage(named: "button_empty-1"), for: .normal)
        myLeaf = 4
    }
    
    @objc func didTapFifthButton() {
        button1.setImage(UIImage(named: "Rectangle 40"), for: .normal)
        button2.setImage(UIImage(named: "Rectangle 40"), for: .normal)
        button3.setImage(UIImage(named: "Rectangle 40"), for: .normal)
        button4.setImage(UIImage(named: "Rectangle 40"), for: .normal)
        button5.setImage(UIImage(named: "Rectangle 40"), for: .normal)
        myLeaf = 5
    }
}

// MARK: - didState() 상태 태그 버튼
extension ConditionCheckTVC {
    @objc func didTapState1() {
        let idx = findStateIndex(state: "피곤함")
        if (idx != -1) {
            state1.setImage(UIImage(named: "state1_empty"), for: .normal)
            myState.remove(at: idx)
        }
        else {
            if(myState.count != 3) {
                state1.setImage(UIImage(named: "state1_fill"), for: .normal)
                myState.append(MyState(idx:0 ,state:"피곤함"))
            }
        }
    }
    
    @objc func didTapState2() {
        let idx = findStateIndex(state: "스트레스")
        if (idx != -1) {
            state2.setImage(UIImage(named: "state2_empty"), for: .normal)
            myState.remove(at: idx)
        }
        else {
            if(myState.count != 3) {
                state2.setImage(UIImage(named: "state2_fill"), for: .normal)
                myState.append(MyState(idx:1 ,state:"스트레스"))
            }
        }
    }
    
    @objc func didTapState11() {
        state2.setImage(UIImage(named: "c"), for: .normal)
    }
    
    // myState 배열에서 해당하는 index 찾는 함수
    func findStateIndex(state: String) -> Int {
        let idx = self.myState.firstIndex { array in
            array.state == state
        }
        return idx ?? -1
    }
}
