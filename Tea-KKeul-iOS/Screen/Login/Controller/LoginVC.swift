//
//  LoginVC.swift
//  Tea-KKeul-iOS
//
//  Created by 김내림 on 2022/01/18.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var googleLoginBtn: UIButton!
    @IBOutlet weak var appleLoginBtn: UIButton!
    
    override func viewDidLoad() {
        setSocialLoginBtn()
    }
    
    @IBAction func googleLoginBtnClick(_ sender: Any) {
        print("google")
    }
    
    @IBAction func appleLoginBtnClick(_ sender: Any) {
        print("apple")
    }
    
}

// MARK: - custom Method
extension LoginVC {
    // 소셜 로그인 버튼
    func setSocialLoginBtn () {
        googleLoginBtn.layer.cornerRadius = 22
        googleLoginBtn.layer.borderWidth = 1
        googleLoginBtn.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.25)
        googleLoginBtn.layer.shadowOffset = CGSize(width: 0, height: 2)
        googleLoginBtn.layer.shadowRadius = 2
        googleLoginBtn.layer.shadowOpacity = 0.8
        appleLoginBtn.layer.cornerRadius = 22
        appleLoginBtn.layer.borderWidth = 1
        appleLoginBtn.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.25)
        appleLoginBtn.layer.shadowOffset = CGSize(width: 0, height: 2)
        appleLoginBtn.layer.shadowRadius = 2
        appleLoginBtn.layer.shadowOpacity = 0.8
    }
}

// MARK: - function for login
extension LoginVC {
    // 메인 페이지로 이동
    func goHome() {
        let homeVC = ViewControllerFactory.viewController(for: .tabBar)
        homeVC.modalPresentationStyle = .fullScreen
        self.present(homeVC, animated: false, completion: nil)
    }
}

// MARK: - inspecter
extension UIView {
    @IBInspectable var borderColor: UIColor {
        get {
            let color = self.layer.borderColor ?? UIColor.clear.cgColor
            return UIColor(cgColor: color)
        }
        set {
            self.layer.borderColor = newValue.cgColor
        }
    }
}

//        guard let homeVC = self.storyboard?.instantiateViewController(withIdentifier: Identifiers.tabBarSB) else {
//            return
//        }
//        self.navigationController?.pushViewController(homeVC, animated: false)
