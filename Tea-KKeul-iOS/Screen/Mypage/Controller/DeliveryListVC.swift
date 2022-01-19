//
//  DeliveryListVC.swift
//  Tea-KKeul-iOS
//
//  Created by 황윤경 on 2022/01/19.
//

import UIKit

class DeliveryListVC: UIViewController {
    override func viewDidLoad() {
        setNaviBar()
    }
}
//MARK: Custom Method
extension DeliveryListVC {
    func setNaviBar() {
        navigationItem.title = "배송지 관리"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.normalGreen]
    }
}
