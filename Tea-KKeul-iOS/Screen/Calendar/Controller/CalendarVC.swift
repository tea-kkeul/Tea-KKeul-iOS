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
    @IBOutlet weak var statusDate: UILabel!
    
    @IBOutlet weak var eachDateView: UIView!
    @IBOutlet weak var eachDate: UILabel!
    
    @IBOutlet weak var dateDibButton: UIButton!
    @IBOutlet weak var datePurchaseButton: UIButton!
    
    @IBOutlet weak var monthView: UIView!
    @IBOutlet weak var monthDate: UILabel!
    
    @IBOutlet weak var monthDibButton: UIButton!
    @IBOutlet weak var monthPurchaseButton: UIButton!
    
    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var prevBtn: UIButton!
    
    @IBOutlet weak var eachDateTag: UILabel!
    @IBOutlet weak var eachDateImage: UIImageView!
    @IBOutlet weak var eachDateTea: UILabel!
    @IBOutlet weak var eachDateEffect: UILabel!
    
    @IBOutlet weak var monthTea: UILabel!
    @IBOutlet weak var monthImage: UIImageView!
    @IBOutlet weak var monthEffect: UILabel!
    
    
    
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //calendarView.register(FSCalendarCell.self, forCellReuseIdentifier: "CELL")
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
        
        dateDibButton.layer.cornerRadius = dateDibButton.frame.height/2
        
        datePurchaseButton.layer.cornerRadius = dateDibButton.frame.height/2
 
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
        
        monthDibButton.layer.cornerRadius = monthDibButton.frame.height/2
        
        monthPurchaseButton.layer.cornerRadius = monthPurchaseButton.frame.height/2
        
    }

    // 이전 버튼 누르면 이전 달이 나오게 하는 함수
    @IBAction func prevBtnTapped(_ sender: UIButton) {
        scrollCurrentPage(isPrev: true)
    }
    
    // 다음 버튼 누르면 다음 달이 나오게 하는 함수
    @IBAction func nextBtnTapped(_ sender: UIButton) {
        scrollCurrentPage(isPrev: false)
    }
    
    //
    private var currentPage: Date?
    private lazy var today: Date = { return Date() }()
    private lazy var dateFormatter2: DateFormatter = {
        let df = DateFormatter()
        df.locale = Locale(identifier: "default")
        df.dateFormat = "MMM"
        return df
        
    }()

    
    // 이전 & 다음 버튼 누르면 호출되는 함수
    private func scrollCurrentPage(isPrev: Bool) {
        let cal = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.month = isPrev ? -1 : 1
        
        self.currentPage = cal.date(byAdding: dateComponents, to: self.currentPage ?? self.today)
        self.calendarView.setCurrentPage(self.currentPage!, animated: true)
        
    }
    
    // 찜하기 버튼 누르면 호출되는 함수
    @IBAction func dibTea(_ sender: UIButton) {
        // 글자만 바뀌게

    }
    
}

extension CalendarVC: FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
    
    // calendarView 설정
    func setCalendarView() {
        
        calendarView.delegate = self
        calendarView.dataSource = self
        
        
        // 한글로 바꾸기
        calendarView.locale = Locale(identifier: "ko_KR")
        
        // 헤더 버튼 이미지 설정
        prevBtn.setImage(UIImage(named: "PrevBtn.png"), for: .normal)
        
        // 평일 날짜 색상 설정 (월 ~ 금)
        calendarView.appearance.weekdayTextColor = .black

        // 흐릿한 문자 지우기
        calendarView.appearance.headerMinimumDissolvedAlpha = 0.0
        
        // 원래 캘린더뷰 헤더 없애기
        calendarView.headerHeight = 0
        
        // 이전 다음 날짜 없애기
        calendarView.placeholderType = .none
        
        // 선택된 날짜의 모서리 설정 ( 0으로 하면 사각형으로 표시 )
        calendarView.appearance.borderRadius = 0.5
        
        // 선택된 날짜 border 색깔 설정
        calendarView.appearance.borderSelectionColor = UIColor(red: 103/255, green: 126/255, blue: 96/255, alpha: 1.0)
        
        // 선택되는 날짜 배경 없애기
        calendarView.appearance.selectionColor = .none
        
        // 오늘 날짜는 표시 안 되게 설정
        calendarView.today = nil
     
        // 처음에 monthDate, statusDate, eachDate에 현재 날짜의 월과 일이 표시되도록 시도중...
        let current = Date()
        let dateFormatter6: DateFormatter = {
            let df = DateFormatter()
            df.locale = Locale(identifier: "default")
            df.dateFormat = "MMM"
            return df
            
        }()
        
        headerLabel.text = dateFormatter6.string(from: current).uppercased()
        headerLabel.font = UIFont(name: "NotoSans-Bold", size: 20)
        
        let dateFormatter3 = DateFormatter()
        dateFormatter3.dateFormat = "MM" // 월
        let month:String = dateFormatter3.string(from: current)
        monthDate.text = month + "월의 차"
        
        let dateFormatter4 = DateFormatter()
        dateFormatter4.dateFormat = "dd" // 일
        let day:String = dateFormatter3.string(from: current)
        statusDate.text = day + "일"
        eachDate.text = day + "일의 차"
        // 처음에 monthDate, statusDate, eachDate에 현재 날짜의 월과 일이 표시되도록 시도중...
        
        
        
        //        // 헤더 폰트 설정
        //        calendarView.appearance.headerTitleFont = UIFont(name: "NotoSansKR-Medium", size: 20)
        //
        //        // Weekday 폰트 설정
        //        calendarView.appearance.weekdayFont = UIFont(name: "NotoSansKR-Regular", size: 12)
        //
        //        // 각각의 일(날짜) 폰트 설정 (ex. 1 2 3 4 5 6 ...)
        //        calendarView.appearance.titleFont = UIFont(name: "NotoSansKR-Regular", size: 12)
    
    }
    
    // FSCalendarDataSource
    func calendar(_ calendar: FSCalendar, imageFor date: Date) -> UIImage? {
        
        // 상태 나타내는 나뭇잎 이미지들
        let status0: UIImage = UIImage(named: "button_empty-1")!
        let status1: UIImage = UIImage(named: "Status_1")!
        let status2: UIImage = UIImage(named: "Status_2")!
        let status3: UIImage = UIImage(named: "Status_3")!
        let status4: UIImage = UIImage(named: "Status_4")!
        let status5: UIImage = UIImage(named: "Status_5")!
        
        // 해당 date에 입력했던 상태에 따른 이미지를 반환해야함
        // 특정 date만 이미지가 다르게 나오는지 테스트해보기
        
        var leaf: Int = 0

//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yy-MM-dd"
//
//        if dateFormatter.string(from: date) == "22-01-05" {
//            return status1
//        }
//        if dateFormatter.string(from: date) == "22-01-06" {
//            return status2
//        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy-MM-dd"
        
        if dateFormatter.string(from: date) == "22-01-01" {
            leaf = 5
        }
        if dateFormatter.string(from: date) == "22-01-02" {
            leaf = 4
        }
        if dateFormatter.string(from: date) == "22-01-03" {
            leaf = 4
        }
        if dateFormatter.string(from: date) == "22-01-04" {
            leaf = 3
        }
        if dateFormatter.string(from: date) == "22-01-05" {
            leaf = 3
        }
        if dateFormatter.string(from: date) == "22-01-06" {
            leaf = 3
        }
        if dateFormatter.string(from: date) == "22-01-07" {
            leaf = 2
        }
        if dateFormatter.string(from: date) == "22-01-08" {
            leaf = 1
        }
        if dateFormatter.string(from: date) == "22-01-09" {
            leaf = 1
        }
        if dateFormatter.string(from: date) == "22-01-10" {
            leaf = 2
        }
        if dateFormatter.string(from: date) == "22-01-11" {
            leaf = 2
        }
        if dateFormatter.string(from: date) == "22-01-12" {
            leaf = 3
        }
        if dateFormatter.string(from: date) == "22-01-13" {
            leaf = 4
        }
        if dateFormatter.string(from: date) == "22-01-14" {
            leaf = 4
        }
        if dateFormatter.string(from: date) == "22-01-15" {
            leaf = 3
        }
        if dateFormatter.string(from: date) == "22-01-16" {
            leaf = 1
        }
        if dateFormatter.string(from: date) == "22-01-17" {
            leaf = 2
        }
        if dateFormatter.string(from: date) == "22-01-18" {
            leaf = 3
        }
        if dateFormatter.string(from: date) == "22-01-19" {
            leaf = 3
        }
        if dateFormatter.string(from: date) == "22-01-20" {
            leaf = 2
        }
        
        switch (leaf) {
        case 1 : return status1
        case 2 : return status2
        case 3 : return status3
        case 4 : return status4
        case 5 : return status5
        default:
            
            return status0
        }
        
    }
    
    // 기본 날짜 글자 색깔 설정
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        
        return .black
                
    }
    
    // 선택된 날짜 글자 색깔 설정
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleSelectionColorFor date: Date) -> UIColor? {
        
        return UIColor(red: 103/255, green: 126/255, blue: 96/255, alpha: 1.0)
    }
    
    // 캘린더 페이지가 변하면 호출되는 함수
    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        
        // 헤더라벨을 JAN 형식으로 표시하기
        self.headerLabel.text = dateFormatter2.string(from: calendar.currentPage).uppercased()
        headerLabel.font = UIFont(name: "NotoSans-Bold", size: 20)
    
        // month 변수에 MM형태로 날짜 저장하기
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM"
        let month:String = dateFormatter.string(from: calendar.currentPage)
        
        // 현재 달의 라벨 변경하기
        monthDate.text = month + "월의 차"
        
        // currentDate 변수에 dd형태로 날짜 저장하기
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "dd"
        let currentDate:String = dateFormatter2.string(from: calendar.currentPage)
        
        // 상태뷰의 날짜 라벨 변경하기
        statusDate.text = currentDate + "일"
        
        // 해당 날짜 추천차 뷰의 날짜 라벨 변경하기
        eachDate.text = currentDate + "일의 차"
        
    }
    
    // 캘린더에 날짜를 클릭하면 호출되는 함수
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        // clickedDate 변수에 dd형태로 날짜 저장하기
        dateFormatter.dateFormat = "dd"
        let clickedDate:String = dateFormatter.string(from: date)
        
        // 날짜가 클릭되면 상태뷰의 날짜 라벨 변경하기
        statusDate.text = clickedDate + "일"
        
        // 날짜가 클릭되면 해당 날짜 추천차 뷰의 날짜 라벨 변경하기
        eachDate.text = clickedDate + "일의 차"
        
        if clickedDate == "20" {
            eachDateImage.image = UIImage(named: "LikeList_CV2.png")
            eachDateTea.text = "대추차"
            eachDateEffect.text = "식욕증진, 심신안정"
            eachDateTag.text = "#피곤함, #스트레스, #식욕부진"
        }
        
    }
    
    
//    func calendar(_ calendar: FSCalendar, cellFor date: Date, at position: FSCalendarMonthPosition) -> FSCalendarCell {
//
//        let cell: FSCalendarCell = calendar.dequeueReusableCell(withIdentifier: "CELL", for: date, at: position)
//        cell.frame.size.height = 50
//        //cell.frame.size.width = 20
//
//
//        return cell;
//
//     }
    
    func calendar(_ calendar: FSCalendar, willDisplay cell: FSCalendarCell, for date: Date, at monthPosition: FSCalendarMonthPosition) {
        cell.bounds.size.height = 50
        cell.bounds.size.width = 20
    }
    
    
}
