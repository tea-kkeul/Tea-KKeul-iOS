//
//  CalendarVC.swift
//  Tea-KKeul-iOS
//
//  Created by 황윤경 on 2022/01/18.
//

import UIKit
import FSCalendar

class CalendarVC: UIViewController {
    @IBOutlet weak var calendarView: FSCalendar!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var eachDateView: UIView!
    @IBOutlet weak var dateDibButton: UIButton!
    @IBOutlet weak var datePurchaseButton: UIButton!
    @IBOutlet weak var monthView: UIView!
    @IBOutlet weak var monthDibButton: UIButton!
    @IBOutlet weak var monthPurchaseButton: UIButton!
    
    @IBOutlet weak var headerLabel: UILabel!
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCalendarView()
        setStatusView()
        setEachDateView()
        setMonthView()
        
    }
    
    
    // statusView 설정
    func setStatusView() {
        statusView.layer.cornerRadius = 13
        statusView.layer.borderWidth = 0.01
        statusView.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        statusView.layer.masksToBounds = false
        statusView.layer.shadowColor = UIColor.black.cgColor
        statusView.layer.shadowOffset = CGSize(width: 0, height: 2)
        statusView.layer.shadowOpacity = 0.1
        statusView.layer.shadowRadius = 1.5
        
    }
    
    // eachDateView 설정
    func setEachDateView() {
        eachDateView.layer.cornerRadius = 13
        eachDateView.layer.borderWidth = 0.01
        eachDateView.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        eachDateView.layer.masksToBounds = false
        eachDateView.layer.shadowColor = UIColor.black.cgColor
        eachDateView.layer.shadowOffset = CGSize(width: 0, height: 2)
        eachDateView.layer.shadowOpacity = 0.3
        eachDateView.layer.shadowRadius = 1.5
        
        dateDibButton.layer.cornerRadius = 14
        dateDibButton.titleLabel?.font = .systemFont(ofSize: 12)
        
        datePurchaseButton.layer.cornerRadius = 14
        datePurchaseButton.titleLabel?.font = .systemFont(ofSize: 12)
    }
    
    // monthView 설정
    func setMonthView() {
        monthView.layer.cornerRadius = 13
        monthView.layer.borderWidth = 0.01
        monthView.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        monthView.layer.masksToBounds = false
        monthView.layer.shadowColor = UIColor.black.cgColor
        monthView.layer.shadowOffset = CGSize(width: 0, height: 2)
        monthView.layer.shadowOpacity = 0.3
        monthView.layer.shadowRadius = 1.5
        
        monthDibButton.layer.cornerRadius = 14
        monthDibButton.titleLabel?.font = .systemFont(ofSize: 12)
        
        monthPurchaseButton.layer.cornerRadius = 14
        monthPurchaseButton.titleLabel?.font = .systemFont(ofSize: 12)
    }
    
    
    @IBAction func prevBtnTapped(_ sender: UIButton) {
        scrollCurrentPage(isPrev: true)
    }
    
    @IBAction func nextBtnTapped(_ sender: UIButton) {
        scrollCurrentPage(isPrev: false)
    }
    
    private var currentPage: Date?
    private lazy var today: Date = { return Date() }()
    private lazy var dateFormatter2: DateFormatter = {
        let df = DateFormatter()
        df.locale = Locale(identifier: "default")
        df.dateFormat = "MMM"
        return df
        
    }()
    
    private func scrollCurrentPage(isPrev: Bool) {
        let cal = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.month = isPrev ? -1 : 1
        
        self.currentPage = cal.date(byAdding: dateComponents, to: self.currentPage ?? self.today)
        self.calendarView.setCurrentPage(self.currentPage!, animated: true) }
    
    
    @IBAction func dibTea(_ sender: UIButton) {

    }
    
}

extension CalendarVC: FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
    
    // calendarView 설정
    func setCalendarView() {
        
        calendarView.delegate = self
        calendarView.dataSource = self
        
        // 한글로 바꾸기
        calendarView.locale = Locale(identifier: "ko_KR")
        
        // 평일 날짜 색상 설정
        calendarView.appearance.weekdayTextColor = .black

        // 흐릿한 문자 지우기
        calendarView.appearance.headerMinimumDissolvedAlpha = 0.0
        
        // 원래 캘린더뷰 헤더 없애기
        calendarView.headerHeight = 0
        
        // 이전 다음 날짜 없애기
        calendarView.placeholderType = .none
        
        // 선택된 날짜의 모서리 설정 ( 0으로 하면 사각형으로 표시 )
        calendarView.appearance.borderRadius = 0
        
        // 선택된 날짜 border 색깔 설정
        calendarView.appearance.borderSelectionColor = UIColor(red: 103/255, green: 126/255, blue: 96/255, alpha: 1.0)
        
        calendarView.appearance.selectionColor = .none
        calendarView.appearance.todaySelectionColor = .none
        
        //calendar.appearance.selectionColor = UIColor.blueColor
        calendarView.appearance.todayColor = .none
        //calendar.appearance.todaySelectionColor = UIColor.blackColor

        
        
    
        
        //        // 헤더 폰트 설정
        //        calendarView.appearance.headerTitleFont = UIFont(name: "NotoSansKR-Medium", size: 20)
        //
        //        // Weekday 폰트 설정
        //        calendarView.appearance.weekdayFont = UIFont(name: "NotoSansKR-Regular", size: 12)
        //
        //        // 각각의 일(날짜) 폰트 설정 (ex. 1 2 3 4 5 6 ...)
        //        calendarView.appearance.titleFont = UIFont(name: "NotoSansKR-Regular", size: 12)
        
        headerLabel.text = self.dateFormatter2.string(from: calendarView.currentPage)
        
    
    }
    
    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        self.headerLabel.text = self.dateFormatter2.string(from: calendar.currentPage)
        
    }
    
    
}
