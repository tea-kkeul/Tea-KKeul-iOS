//
//  MypageVC.swift
//  Tea-KKeul-iOS
//
//  Created by 황윤경 on 2022/01/18.
//

import UIKit

class MypageVC: UIViewController {
    let UserData = ["김슈니", "서울시 공릉 1동 20번길 15-3"]
    let settingCellData = [
        ["티끌 가이드", "Mypage_TV1"],
        ["배송지 관리", "Mypage_TV2"],
        ["관심 카테고리 설정", "Mypage_TV3"],
        ["받은 쿠폰함", "Mypage_TV4"],
        ["포인트 관리", "Mypage_TV5"],
        ["알림 설정", "Mypage_TV6"],
        ["고객센터", "Mypage_TV7"]
    ]
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userAddress: UILabel!
    
    @IBOutlet weak var boxView: UIView!
    @IBOutlet weak var settingTV: UITableView!
    
    override func viewDidLoad() {
        setTitleView()
        setSettingTV()
    }
}
//MARK: Custom Method
extension MypageVC {
    func setTitleView() {
        userName.text = UserData[0]
        userAddress.text = UserData[1]
        
        boxView.layer.cornerRadius = 10
    }
    
    func setSettingTV() {
        settingTV.dataSource = self
        settingTV.delegate = self
        
        settingTV.separatorStyle = .none
        settingTV.isScrollEnabled = false
    }
}
//MARK: UITableViewDataSource
extension MypageVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = settingTV.dequeueReusableCell(withIdentifier: Identifiers.settingTVC, for: indexPath) as! SettingTVC
        
        cell.cellTitle.text = "\(settingCellData[indexPath.row][0])"
        cell.cellImg.image = UIImage(named: "\(settingCellData[indexPath.row][1])")
        
        return cell
    }
    
    
}
//MARK: UITableViewDelegate
extension MypageVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
