//
//  PurchaseCompleteVC.swift
//  Tea-KKeul-iOS
//
//  Created by 황윤경 on 2022/01/20.
//

import UIKit

class PurchaseCompleteVC: UIViewController {
    @IBOutlet weak var doneLabel: UILabel!
    @IBOutlet weak var purchaseNum: UILabel!
    @IBOutlet weak var gotoHomeBtn: UIButton!
    @IBOutlet weak var showListBtn: UIButton!
    
    var isSubscribe: Bool!
    
    override func viewDidLoad() {
        setBtn(gotoHomeBtn)
        setBtn(showListBtn)
        setString(isSubscribe)
    }
}

extension PurchaseCompleteVC {
    func setBtn(_ button: UIButton) {
        button.layer.cornerRadius = button.frame.height / 2
        button.backgroundColor = UIColor.darkGreen
        button.setTitleColor(UIColor.white, for: .normal)
    }
    
    func setString(_ isSubscribe: Bool) {
        if isSubscribe {
            doneLabel.text = "구독이 완료되었습니다."
            purchaseNum.text = "주문번호 : ABC123456DF"
            showListBtn.setTitle("구독내역 확인하기", for: .normal)
        } else {
            doneLabel.text = "구매가 완료되었습니다."
            purchaseNum.text = "주문번호 : ABC123456DF"
            showListBtn.setTitle("구매내역 확인하기", for: .normal)
        }
    }
}
