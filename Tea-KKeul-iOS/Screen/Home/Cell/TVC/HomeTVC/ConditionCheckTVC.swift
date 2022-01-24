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
    @IBOutlet weak var todayMonthLabel: UILabel!
    @IBOutlet weak var todayLabel: UILabel!
    
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
        setCurrentDate()
        button1.addTarget(self, action: #selector(didTapFirstButton), for: .touchUpInside)
        button2.addTarget(self, action: #selector(didTapSecondButton), for: .touchUpInside)
        button3.addTarget(self, action: #selector(didTapThirdButton), for: .touchUpInside)
        button4.addTarget(self, action: #selector(didTapForthButton), for: .touchUpInside)
        button5.addTarget(self, action: #selector(didTapFifthButton), for: .touchUpInside)
        // Initialization code
        state1.addTarget(self, action: #selector(didTapState1), for: .touchUpInside)
        state2.addTarget(self, action: #selector(didTapState2), for: .touchUpInside)
        state3.addTarget(self, action: #selector(didTapState3), for: .touchUpInside)
        state4.addTarget(self, action: #selector(didTapState4), for: .touchUpInside)
        state5.addTarget(self, action: #selector(didTapState5), for: .touchUpInside)
        state6.addTarget(self, action: #selector(didTapState6), for: .touchUpInside)
        state7.addTarget(self, action: #selector(didTapState7), for: .touchUpInside)
        state8.addTarget(self, action: #selector(didTapState8), for: .touchUpInside)
        state9.addTarget(self, action: #selector(didTapState9), for: .touchUpInside)
        state10.addTarget(self, action: #selector(didTapState10), for: .touchUpInside)
        state11.addTarget(self, action: #selector(didTapState11), for: .touchUpInside)
        state12.addTarget(self, action: #selector(didTapState12), for: .touchUpInside)
        submitButton.addTarget(self, action: #selector(didTapSubmitButton), for: .touchUpInside)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func didTapSubmitButton() {
        print("leaf", myLeaf)
        print("state", myState)
    }

}
// MARK: - 현재 날짜로 설정하는 함수
extension ConditionCheckTVC {
    func setCurrentDate() {
        let nowDate = Date()
        let dateFormatter = DateFormatter()
        // 달
        dateFormatter.dateFormat = "MMM"
        todayMonthLabel.text = dateFormatter.string(from: nowDate).uppercased()
        todayMonthLabel.textAlignment = .right
        // 일
        dateFormatter.dateFormat = "dd"
        todayLabel.text = dateFormatter.string(from: nowDate)
        todayLabel.textAlignment = .right
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
    @objc func didTapState3() {
        let idx = findStateIndex(state: "두통")
        if (idx != -1) {
            state3.setImage(UIImage(named: "state3_empty"), for: .normal)
            myState.remove(at: idx)
        }
        else {
            if(myState.count != 3) {
                state3.setImage(UIImage(named: "state3_fill"), for: .normal)
                myState.append(MyState(idx:2 ,state:"두통"))
            }
        }
    }
    @objc func didTapState4() {
        let idx = findStateIndex(state: "감기기운")
        if (idx != -1) {
            state4.setImage(UIImage(named: "state4_empty"), for: .normal)
            myState.remove(at: idx)
        }
        else {
            if(myState.count != 3) {
                state4.setImage(UIImage(named: "state4_fill"), for: .normal)
                myState.append(MyState(idx:3 ,state:"감기기운"))
            }
        }
    }
    @objc func didTapState5() {
        let idx = findStateIndex(state: "변비")
        if (idx != -1) {
            state5.setImage(UIImage(named: "state5_empty"), for: .normal)
            myState.remove(at: idx)
        }
        else {
            if(myState.count != 3) {
                state5.setImage(UIImage(named: "state5_fill"), for: .normal)
                myState.append(MyState(idx:4 ,state:"변비"))
            }
        }
    }
    @objc func didTapState6() {
        let idx = findStateIndex(state: "붓기")
        if (idx != -1) {
            state6.setImage(UIImage(named: "state6_empty"), for: .normal)
            myState.remove(at: idx)
        }
        else {
            if(myState.count != 3) {
                state6.setImage(UIImage(named: "state6_fill"), for: .normal)
                myState.append(MyState(idx:5 ,state:"붓기"))
            }
        }
    }
    @objc func didTapState7() {
        let idx = findStateIndex(state: "불면증")
        if (idx != -1) {
            state7.setImage(UIImage(named: "state7_empty"), for: .normal)
            myState.remove(at: idx)
        }
        else {
            if(myState.count != 3) {
                state7.setImage(UIImage(named: "state7_fill"), for: .normal)
                myState.append(MyState(idx:6 ,state:"불면증"))
            }
        }
    }
    @objc func didTapState8() {
        let idx = findStateIndex(state: "소화불량")
        if (idx != -1) {
            state8.setImage(UIImage(named: "state8_empty"), for: .normal)
            myState.remove(at: idx)
        }
        else {
            if(myState.count != 3) {
                state8.setImage(UIImage(named: "state8_fill"), for: .normal)
                myState.append(MyState(idx:7 ,state:"소화불량"))
            }
        }
    }
    @objc func didTapState9() {
        let idx = findStateIndex(state: "불안감")
        if (idx != -1) {
            state9.setImage(UIImage(named: "state9_empty"), for: .normal)
            myState.remove(at: idx)
        }
        else {
            if(myState.count != 3) {
                state9.setImage(UIImage(named: "state9_fill"), for: .normal)
                myState.append(MyState(idx:8 ,state:"불안감"))
            }
        }
    }
    @objc func didTapState10() {
        let idx = findStateIndex(state: "빈혈")
        if (idx != -1) {
            state10.setImage(UIImage(named: "state10_empty"), for: .normal)
            myState.remove(at: idx)
        }
        else {
            if(myState.count != 3) {
                state10.setImage(UIImage(named: "state10_fill"), for: .normal)
                myState.append(MyState(idx:9 ,state:"빈혈"))
            }
        }
    }
    @objc func didTapState11() {
        let idx = findStateIndex(state: "식욕부진")
        if (idx != -1) {
            state11.setImage(UIImage(named: "state11_empty"), for: .normal)
            myState.remove(at: idx)
        }
        else {
            if(myState.count != 3) {
                state11.setImage(UIImage(named: "state11_fill"), for: .normal)
                myState.append(MyState(idx:10 ,state:"식욕부진"))
            }
        }
    }
    @objc func didTapState12() {
        let idx = findStateIndex(state: "무증상")
        if (idx != -1) {
            state12.setImage(UIImage(named: "state12_empty"), for: .normal)
            myState.remove(at: idx)
        }
        else {
            if(myState.count != 3) {
                state12.setImage(UIImage(named: "state12_fill"), for: .normal)
                myState.append(MyState(idx:11 ,state:"무증상"))
            }
        }
    }
    // myState 배열에서 해당하는 index 찾는 함수
    func findStateIndex(state: String) -> Int {
        let idx = self.myState.firstIndex { array in
            array.state == state
        }
        return idx ?? -1
    }
}
