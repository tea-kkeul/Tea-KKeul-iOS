//
//  SubscribeVC.swift
//  Tea-KKeul-iOS
//
//  Created by 이윤진 on 2022/01/19.
//

import UIKit

class SubscribeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension SubscribeVC {
    func setNavigationBar() {
        let backImage = UIImage(systemName: "chevron.backward")?
          .withTintColor(.black)
          .withRenderingMode(.alwaysOriginal)
        let backButton = UIBarButtonItem(image: backImage,
                                         style: .plain,
                                         target: self,
                                         action: #selector(didBack))
        navigationItem.leftBarButtonItem = backButton
    }
    @objc func didBack() {
      navigationController?.popViewController(animated: true)
    }
}
