//
//  HomeVC.swift
//  Tea-KKeul-iOS
//
//  Created by 황윤경 on 2022/01/18.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        setLayout()
        setButton()
        registerCell()
        setHeaderView()
    }
}

extension HomeVC {
    // MARK: - layout 설정
    func setLayout() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
    }
    // MARK: - button 설정
    func setButton() {

    }
    // MARK: - xib 추가
    func registerCell() {
        let conditionCheckNib = UINib(nibName: "ConditionCheckTVC", bundle: nil)
        tableView.register(conditionCheckNib, forCellReuseIdentifier: Identifiers.conditionCheckTVC)
        let subscribeNib = UINib(nibName: "SubscribeTVC", bundle: nil)
        tableView.register(subscribeNib, forCellReuseIdentifier: Identifiers.subscribeTVC)
        let teaListNib = UINib(nibName: "TeaListTVC", bundle: nil)
        tableView.register(teaListNib, forCellReuseIdentifier: Identifiers.teaListTVC)
//        let homeSectionHeaderNib = UINib(nibName: "HomeSectionHeaderView", bundle: nil)
//        tableView.register(homeSectionHeaderNib, forCellReuseIdentifier: Identifiers.homeSectionHeaderView)
    }
    // MARK: - section header view 추가
    func setHeaderView() {
        let homeTitleHeaderNib = UINib(nibName: "HomeTitleHeaderView", bundle: nil)
        tableView.register(homeTitleHeaderNib, forHeaderFooterViewReuseIdentifier: Identifiers.homeTitleHeaderView)
    }
}

extension HomeVC: UITableViewDataSource {
    // MARK: - 섹션개수 설정
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    // MARK: - 섹션 별 행 개수 (셀 개수)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    // MARK: - 셀 연결
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell: ConditionCheckTVC = tableView.dequeueReusableCell(withIdentifier: Identifiers.conditionCheckTVC, for: indexPath) as? ConditionCheckTVC else {
                return UITableViewCell()
            }
            return cell
        } else if indexPath.section == 1 {
            guard let cell: SubscribeTVC = tableView.dequeueReusableCell(withIdentifier: Identifiers.subscribeTVC, for: indexPath) as? SubscribeTVC else {
                return UITableViewCell()
            }
            return cell
        } else {
            guard let cell: TeaListTVC = tableView.dequeueReusableCell(withIdentifier: Identifiers.teaListTVC, for: indexPath) as? TeaListTVC else {
                return UITableViewCell()
            }
            return cell
        }
    }
    // MARK: - headerview 설정
    func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int
    ) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: Identifiers.homeTitleHeaderView) as! HomeTitleHeaderView
        if section == 2{
            view.backgroundColor = .white
            return view
        } else {
            view.isHidden = true
            return view
        }
    }
    // MARK: - 섹션 별 셀 높이 설정
    func tableview(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath)
    -> CGFloat {
        return 251
    }
}

extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: Identifiers.homeTitleHeaderView) as! HomeTitleHeaderView
        if section == 2{
            view.backgroundColor = .white
        }
    }
}
