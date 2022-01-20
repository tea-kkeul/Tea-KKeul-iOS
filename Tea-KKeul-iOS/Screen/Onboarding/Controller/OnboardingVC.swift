//
//  OnboardingVC.swift
//  Tea-KKeul-iOS
//
//  Created by 황윤경 on 2022/01/20.
//

import UIKit

class OnboardingVC: UIViewController {

    @IBOutlet var holderView: UIView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var button: UIButton!
    let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configure()
        setScrollView()
        setPageController()
        setButton()
    }
}
//MARK: Custom Method
extension OnboardingVC {
    func setScrollView() {
        scrollView.delegate = self
        
        scrollView.frame = holderView.bounds
        scrollView.showsHorizontalScrollIndicator = false
        
        scrollView.contentSize = CGSize(width: holderView.frame.size.width * 5, height: 0)
        scrollView.isPagingEnabled = true
    }
    
    func setPageController() {
        pageController.numberOfPages = 5
        pageController.currentPage = 0
        pageController.pageIndicatorTintColor = .systemGray3
        pageController.currentPageIndicatorTintColor = UIColor.darkGreen
    }
    
    func setButton() {
        button.layer.cornerRadius = button.frame.height / 2
        
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.darkGreen
        button.setTitle("다음", for: .normal)
        
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        button.tag = 1
    }
    
    func configure() {
        holderView.addSubview(scrollView)
        
        let titles = ["차 캘린더", "차 매거진", "티박스 정기구독", "차 큐레이션", "티끌"]
        let explanations = [
            "매일 몸 상태를 달력에 기록하고\n오늘의 차, 이달의 차를 추천받을 수 있어요",
        "차에 관심이 있지만 입문하기 어렵다면\n티끌 매거진을 통해 차에 대한 상식을\n쉽고 재미있게 알 수 있어요",
        "티끌 인기 판매 순위 차를 모은 '티끌 박스',\n내가 직접 선택하는 '내 차 박스'를 배송받아\n매일 하루 한 잔 차와 함께하는 일상을 즐겨보세요",
        "몸의 체질, 상태를 바탕으로\n증상을 완화하는 효능을 가진\n나를 위한 차를 맞춤 추천 받을 수 있어요",
        "커지는 이너뷰티\n나를 위한 소비 트렌드\n이젠 차(茶)에서도"]
        for i in 0..<5 {
            let pageView = UIView(frame: CGRect(x: CGFloat(i) * holderView.frame.size.width, y: 0, width: holderView.frame.size.width, height: holderView.frame.size.height))
            scrollView.addSubview(pageView)
            
            let imageView = UIImageView(frame: CGRect(x: 65, y: 100, width: pageView.frame.size.width - 130, height: 276))
            let title = UILabel(frame: CGRect(x: 10, y: 430, width: pageView.frame.size.width - 20, height: 34))
            let explanation = UITextView(frame: CGRect(x: 10, y: 430 + 34 + 25, width: pageView.frame.size.width - 20, height: 70))
            
            title.textAlignment = .center
            title.font = UIFont(name: "NotoSansKR-Bold", size: 25)
            pageView.addSubview(title)
            title.text = titles[i]
            
            explanation.textAlignment = .center
            explanation.font = UIFont(name: "NotoSansKR-Regular", size: 15)
            pageView.addSubview(explanation)
            explanation.text = explanations[i]
            
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(named: "Onboarding_\(i+1)")
            pageView.addSubview(imageView)
        }
    }
    
    @objc func didTapButton(_ button: UIButton) {
        guard button.tag < 5 else {
//            Core.shared.setIsNotNewUser()
            dismiss(animated: true, completion: nil)

            guard let pvc = self.presentingViewController else { return }

            self.dismiss(animated: true) {
                guard let vc = UIStoryboard(name: Identifiers.tabBarSB, bundle: nil).instantiateViewController(withIdentifier: Identifiers.teaKKeulTBC) as? TeaKKeulTBC else { return }
                vc.modalPresentationStyle = .fullScreen
                
                pvc.present(vc, animated: true, completion: nil)
            }
            
            return
        }
        
        if button.tag == 4{
            let btnTitle = NSAttributedString(string: "시작하기")
            button.setAttributedTitle(btnTitle, for: .normal)
        }
        scrollView.setContentOffset(CGPoint(x: holderView.frame.size.width * CGFloat(button.tag), y: 0), animated: true)
    }
}
extension OnboardingVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentIndex = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
        pageController.currentPage = currentIndex
        button.tag = pageController.currentPage + 1
        print(pageController.currentPage)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if button.tag == 4 {
            let btnTitle = NSAttributedString(string: "시작하기")
            button.setAttributedTitle(btnTitle, for: .normal)
        } else {
            let btnTitle = NSAttributedString(string: "다음")
            button.setAttributedTitle(btnTitle, for: .normal)
        }
    }
}
