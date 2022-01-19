//
//  MypageVC.swift
//  Tea-KKeul-iOS
//
//  Created by 황윤경 on 2022/01/18.
//

import UIKit

class MypageVC: UIViewController {
    let UserData = ["김슈니", "서울시 공릉 1동 20번길 15-3"]
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userAddress: UILabel!
    
    @IBOutlet weak var boxView: UIView!
    
    override func viewDidLoad() {
        setTitleView()
    }
}
//MARK: Custom Method
extension MypageVC {
    func setTitleView() {
        userName.text = UserData[0]
        userAddress.text = UserData[1]
        
        boxView.layer.cornerRadius = 10
    }
}
