//
//  LikeListVC.swift
//  Tea-KKeul-iOS
//
//  Created by 황윤경 on 2022/01/19.
//

import UIKit

class LikeListVC: UIViewController {
    override func viewDidLoad() {
        setNaviBar()
    }
}
//MARK: Custom Method
extension LikeListVC {
    func setNaviBar() {
        navigationItem.title = "찜 목록"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.darkGreen]
    }
}
