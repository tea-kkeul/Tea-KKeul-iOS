//
//  HomeVC.swift
//  Tea-KKeul-iOS
//
//  Created by 황윤경 on 2022/01/18.
//

import UIKit
import Firebase

struct Tea : Codable{
    let name: String?
    let tagList: String?
    let imgPath: String?
}

class HomeVC: UIViewController {
    var listData = [
        ["LikeList_CV1", "귤껍질차", "피로회복, 식욕증진"],
        ["LikeList_CV2", "대추차", "식욕증진, 심신안정"],
        ["LikeList_CV3", "페퍼민트차", "혈액순환, 숙면"]
    ]


    @IBOutlet weak var tableView: UITableView!
    let db = Firestore.firestore()
    var likestTeaList:[Tea] = []

    override func viewDidLoad() {
        fetchLikestList()
        setLayout()
        setButton()
        registerCell()
        setHeaderView()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
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
    }
    // MARK: - section header view 추가
    func setHeaderView() {
        let homeTitleHeaderNib = UINib(nibName: "HomeTitleHeaderView", bundle: nil)
        tableView.register(homeTitleHeaderNib, forHeaderFooterViewReuseIdentifier: Identifiers.homeTitleHeaderView)
    }
    // MARK: - cell button action 설정
    @objc func didTapSubscribeButton() {
        guard let nvc = UIStoryboard(name: Identifiers.subscribeSB, bundle: nil).instantiateViewController(identifier: Identifiers.subscribeVC) as? SubscribeVC else {
            return
        }
        navigationController?.pushViewController(nvc, animated: true)
        nvc.navigationItem.title = "구독하기"
        nvc.navigationItem.leftBarButtonItem?.tintColor = .black

        print("test")
    }
}

extension HomeVC: UITableViewDataSource {
    // MARK: - 섹션개수 설정
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    // MARK: - 섹션 별 행 개수 (셀 개수)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 2:
            // return listData.count
            return likestTeaList.count
        default:
            return 1
        }

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
            cell.subscribeButton.addTarget(self, action: #selector(didTapSubscribeButton), for: .touchUpInside)
            return cell
        } else {
//            guard let cell: TeaListTVC = tableView.dequeueReusableCell(withIdentifier: Identifiers.teaListTVC, for: indexPath) as? TeaListTVC else {
//                return UITableViewCell()
//            }
//            cell.imageView?.image = UIImage(named: "\(listData[indexPath.row][0])")
//            cell.teaNameLabel.text = "\(listData[indexPath.row][1])"
//            cell.profitLabel.text = "\(listData[indexPath.row][2])"
//            cell.contentView.layer.masksToBounds = true
            let teaInfo = likestTeaList[indexPath.row]
            print(teaInfo)
            guard let cell: TeaListTVC = tableView.dequeueReusableCell(withIdentifier: Identifiers.teaListTVC, for: indexPath) as? TeaListTVC else {
                return UITableViewCell()
            }
            cell.teaNameLabel.text = teaInfo.name
            cell.profitLabel.text = teaInfo.tagList
            cell.imageView?.image = UIImage(named: setImageToName(teaName: teaInfo.name ?? "default"))
            cell.contentView.layer.masksToBounds = true
            return cell
        }
    }
    // MARK: - headerview 설정
    func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int
    ) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: Identifiers.homeTitleHeaderView) as! HomeTitleHeaderView
        if section == 2 {
            view.backgroundColor = .white
            return view
        } else {
            view.isHidden = true
            return view
        }
    }
}
extension HomeVC: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        willDisplayHeaderView view: UIView,
        forSection section: Int
    ) {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: Identifiers.homeTitleHeaderView) as! HomeTitleHeaderView
        if section == 2{
            view.backgroundColor = .white
        }
    }
    func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int
    ) -> CGFloat {
        // MARK: - 개인 몸 상태 입력에 따라 섹션 개수 재설정되어야함.
        switch section {
        case 2:
            return 30.0
        default:
            return 0.0
        }
    }
}

// MARK: - firebase 설정
extension HomeVC {
    func fetchLikestList() {
        db.collection("tea").order(by: "scrap", descending: true).limit(to: 3).addSnapshotListener() { [self] (querySnapshot, err) in
            self.likestTeaList = []
            if let e = err {
                print(e.localizedDescription)
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    snapshotDocuments.forEach { (doc) in
                        let data = doc.data()
                        let id = data["id"] as? String
                        let imgPath = data["img"] as? String

                        db.collection("tea").document(id!).collection("tag").addSnapshotListener() { (querySnapshot, err) in
                            if let err = err {
                                print("Error getting documents: \(err)")
                            } else {
                                var tag: String = ""
                                if let snapshotDocuments = querySnapshot?.documents {
                                    print("갯수", snapshotDocuments.count)
                                    snapshotDocuments.forEach { (doc) in
                                        let data = doc.data()
                                        if let name = data["name"] as? String {
                                            tag += name + ", "
                                        }
                                    }
                                }
                                if let name = data["name"] as? String {
                                    self.likestTeaList.append(Tea(name: name, tagList: String(tag.dropLast(2)), imgPath: imgPath))
                                    DispatchQueue.main.async {
                                        self.tableView.reloadData()
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

// MARK: - 차 이름에 따라 이미지 불러오기
extension HomeVC {
    func setImageToName(teaName: String) -> String {
        switch (teaName) {
        case "귤껍질차" : return "LikeList_CV1"
        case "대추차" : return "LikeList_CV2"
        case "페퍼민트차" : return "LikeList_CV3"
        case "메밀차" : return "LikeList_CV4"
        default:
            return "LikeList_CV1"
        }
    }
}
