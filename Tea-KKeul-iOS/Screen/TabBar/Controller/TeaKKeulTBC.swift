//
//  TeaKKeulTBC.swift
//  Tea-KKeul-iOS
//
//  Created by 황윤경 on 2022/01/18.
//

import UIKit

class TeaKKeulTBC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
    
    //MARK: - Custom Method
    /// makeTabVC - 탭별 아이템 생성하는 함수
    func makeTabVC(vcType: TypeOfViewController, tabBarTitle: String, tabBarImage: String, tabBarSelectedImage: String) -> UIViewController {
        
        let tab = ViewControllerFactory.viewController(for: vcType)
        tab.tabBarItem = UITabBarItem(title: tabBarTitle, image: UIImage(named: tabBarImage), selectedImage: UIImage(named: tabBarSelectedImage))
        tab.tabBarItem.imageInsets = UIEdgeInsets(top: -0.5, left: -0.5, bottom: -0.5, right: -0.5)
        return tab
    }
    
    /// setTabBar - 탭바 Setting
    func setTabBar() {
        
        let homeTab = makeTabVC(vcType: .home, tabBarTitle: "", tabBarImage: "Tab_Home", tabBarSelectedImage: "Tab_Home_Selected")
        let magazineTab = makeTabVC(vcType: .magazine, tabBarTitle: "", tabBarImage: "Tab_Magazine", tabBarSelectedImage: "Tab_Magazine_Selected")
        let calendarTab = makeTabVC(vcType: .calendar, tabBarTitle: "", tabBarImage: "Tab_Calendar", tabBarSelectedImage: "Tab_Calendar_Selected")
        let mypageTab = makeTabVC(vcType: .mypage, tabBarTitle: "", tabBarImage: "Tab_Mypage", tabBarSelectedImage: "Tab_Mypage_Selected")
        
        // 탭바 스타일 설정
        tabBar.frame.size.height = 78
        tabBar.tintColor = .darkGreen
        tabBar.unselectedItemTintColor = .normalGreen
        
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 4)
        tabBar.layer.shadowRadius = 20
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.05

        tabBar.backgroundColor = .white
        tabBar.isTranslucent = false
        
        // 탭 구성
        let tabs =  [homeTab, magazineTab, calendarTab, mypageTab]
        
        // VC에 루트로 설정
        self.setViewControllers(tabs, animated: false)
    }
}
