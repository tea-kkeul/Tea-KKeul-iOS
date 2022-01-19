//
//  OnboardingBaseVC.swift
//  Tea-KKeul-iOS
//
//  Created by 황윤경 on 2022/01/20.
//

import UIKit

class OnboardingBaseVC: UIViewController {
    override func viewDidLoad() {
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if Core.shared.isNewUser() {
            let vc = UIStoryboard(name: Identifiers.onboardingSB, bundle: nil).instantiateViewController(withIdentifier: Identifiers.onboardingVC) as! OnboardingVC
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        if Core.shared.isNewUser() {
//            let vc = UIStoryboard(name: Identifiers.onboardingSB, bundle: nil).instantiateViewController(withIdentifier: Identifiers.onboardingVC) as! OnboardingVC
//            vc.modalPresentationStyle = .fullScreen
//            present(vc, animated: true)
//        }
//    }
}

class Core {
    static let shared = Core()
    
    func isNewUser() -> Bool {
        return !UserDefaults.standard.bool(forKey: "isNewUser")
    }
    
    func setIsNotNewUser() {
        UserDefaults.standard.set(true, forKey: "isNewUser")
    }
}


