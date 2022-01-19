//
//  LoginVC.swift
//  Tea-KKeul-iOS
//
//  Created by 김내림 on 2022/01/18.
//

import AuthenticationServices
import CryptoKit
import Firebase
import FirebaseAuth
import GoogleSignIn
import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var googleLoginBtn: GIDSignInButton!
    @IBOutlet weak var appleLoginBtn: UIButton!

    private var currentNonce: String?
    
    let db = Firestore.firestore()
        
    override func viewDidLoad() {
        setSocialLoginBtn()
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
    }
    
    @IBAction func googleLoginBtnClick(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
        print("google")
    }
    
    @IBAction func appleLoginBtnClick(_ sender: Any) {
        startSignInWithAppleFlow()
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

// MARK: - google for login
extension LoginVC : GIDSignInDelegate{
    // 구글 로그인
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print(error)
            return
        }
        guard let auth = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: auth.idToken, accessToken: auth.accessToken)
        
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                let uid = authResult!.user.uid
                let email = authResult?.user.email
                self.db.collection("users").document(uid).setData([
                    "uid" : uid,
                    "email" : email as Any
                ])
                self.goHome()
            }
        }
    }
}

// MARK: - function for apple login
@available(iOS 13.0, *)
extension LoginVC : ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            guard let nonce = currentNonce else {fatalError("error - no login request")}
            guard let appleIDToken = appleIDCredential.identityToken else {
                print("unable to fetch token")
                return
            }
            guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else { return }
            let credential = OAuthProvider.credential(withProviderID: "apple.com", idToken: idTokenString, rawNonce: nonce)
            // Signin with firebase
            Auth.auth().signIn(with: credential) { (authResult, error) in
                if (error != nil) {
                    print(error!)
                    return
                }
                let email = Auth.auth().currentUser?.email
                let uid = authResult!.user.uid
                print(uid)
                self.db.collection("users").document(uid).setData([
                    "uid" : uid,
                    "email" : email as Any
                ])
                print(email!)
                // goHome()
                
            }
        }
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

// MARK: - Apple sign in
extension LoginVC :  ASAuthorizationControllerPresentationContextProviding{
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return view.window!
    }
    
    // 메인 페이지로 이동
    func goHome() {
        let homeVC = ViewControllerFactory.viewController(for: .tabBar)
        homeVC.modalPresentationStyle = .fullScreen
        self.present(homeVC, animated: false, completion: nil)
    }
    
    func startSignInWithAppleFlow() {
        let nonce = randomNonceString()
        currentNonce = nonce
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        request.nonce = sha256(nonce)
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    
    }
    
    private func sha256(_ input: String) -> String {
      let inputData = Data(input.utf8)
      let hashedData = SHA256.hash(data: inputData)
      let hashString = hashedData.compactMap {
        String(format: "%02x", $0)
      }.joined()
      return hashString
    }
    
    private func randomNonceString(length: Int = 32) -> String {
      precondition(length > 0)
      let charset: [Character] =
        Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
      var result = ""
      var remainingLength = length
      while remainingLength > 0 {
        let randoms: [UInt8] = (0 ..< 16).map { _ in
          var random: UInt8 = 0
          let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
          if errorCode != errSecSuccess {
            fatalError(
              "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
            )
          }
          return random
        }
        randoms.forEach { random in
          if remainingLength == 0 {
            return
          }

          if random < charset.count {
            result.append(charset[Int(random)])
            remainingLength -= 1
          }
        }
      }
      return result
    }

}

//        guard let homeVC = self.storyboard?.instantiateViewController(withIdentifier: Identifiers.tabBarSB) else {
//            return
//        }
//        self.navigationController?.pushViewController(homeVC, animated: false)
