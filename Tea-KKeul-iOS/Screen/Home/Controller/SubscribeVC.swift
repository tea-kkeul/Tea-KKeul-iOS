//
//  SubscribeVC.swift
//  Tea-KKeul-iOS
//
//  Created by 이윤진 on 2022/01/19.
//

import UIKit

class SubscribeVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var tagValue: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setLayout()
        registerCell()
        setHeaderView()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension SubscribeVC {
    func setLayout() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
    }
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
    func registerCell() {
        let addressNib = UINib(nibName: "AddressTVC", bundle: nil)
        tableView.register(addressNib, forCellReuseIdentifier: Identifiers.addressTVC)
        let DeliveryNib = UINib(nibName: "DeliveryBoxTVC", bundle: nil)
        tableView.register(DeliveryNib, forCellReuseIdentifier: Identifiers.deliveryBoxTVC)
        let SubscribePeriodNib = UINib(nibName: "SubscribePeriodTVC", bundle: nil)
        tableView.register(SubscribePeriodNib, forCellReuseIdentifier: Identifiers.subscribePeriodTVC)
        let BlendOptionNib = UINib(nibName: "BlendOptionTVC", bundle: nil)
        tableView.register(BlendOptionNib, forCellReuseIdentifier: Identifiers.blendOptionTVC)
    }
    func setHeaderView() {
        let subTitleHeaderNib = UINib(nibName: "SubTitleHeaderView", bundle: nil)
        tableView.register(subTitleHeaderNib, forHeaderFooterViewReuseIdentifier: Identifiers.subTitleHeaderView)
    }
}

extension SubscribeVC: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        switch section {
        case 1:
            return 2
        case 2:
            return 3
        case 3:
            return 6
        default:
            return 1
        }

    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell: AddressTVC = tableView.dequeueReusableCell(withIdentifier: Identifiers.addressTVC, for: indexPath) as? AddressTVC else {
                return UITableViewCell()
            }
            return cell
        } else if indexPath.section == 1 {
            // 여기에 티끌박스 내차박스 cell 만들기!
            guard let cell: DeliveryBoxTVC = tableView.dequeueReusableCell(withIdentifier: Identifiers.deliveryBoxTVC, for: indexPath) as? DeliveryBoxTVC else {
                return UITableViewCell()
            }
            if indexPath.row == 0 {
                if cell.boxButton.isSelected {
                    cell.boxButton.setImage(UIImage(named: "Group 507"), for: .normal)
                    // 어떤 옵션인지 선택해서 tagValue에 값 저장
                } else {
                    cell.boxButton.setImage(UIImage(named: "Group 504"), for: .normal)
                    // 어떤 옵션인지 선택해서 tagValue에 값 저장
                }
            }
            if indexPath.row == 1 {
                if cell.boxButton.isSelected {
                    cell.boxButton.setImage(UIImage(named: "Group 490"), for: .normal)
                    // 어떤 옵션인지 선택해서 tagValue에 값 저장
                } else {
                    cell.boxButton.setImage(UIImage(named: "Group 508"), for: .normal)
                    // 어떤 옵션인지 선택해서 tagValue에 값 저장
                }
            }
            return cell
        } else if indexPath.section == 2 {
            guard let cell: SubscribePeriodTVC = tableView.dequeueReusableCell(withIdentifier: Identifiers.subscribePeriodTVC, for: indexPath) as? SubscribePeriodTVC else {
                return UITableViewCell()
            }
            if indexPath.row == 0 {
                cell.subscribeButton.setImage(UIImage(named:"Group 512"), for: .normal)
            }
            if indexPath.row == 1 {
                cell.subscribeButton.setImage(UIImage(named: "Group 513"), for: .normal)
            }
            if indexPath.row == 2 {
                cell.subscribeButton.setImage(UIImage(named: "Group 514"), for: .normal)
            }
            return cell
        } else {
            guard let cell: BlendOptionTVC = tableView.dequeueReusableCell(withIdentifier: Identifiers.blendOptionTVC, for: indexPath) as? BlendOptionTVC else {
                return UITableViewCell()
            }
            switch indexPath.row {
            case 1:
                cell.blendOptionLabel.text = "자몽"
            case 2:
                cell.blendOptionLabel.text = "사과"
            case 3:
                cell.blendOptionLabel.text = "오렌지"
            case 4:
                cell.blendOptionLabel.text = "키위"
            case 5:
                cell.blendOptionLabel.text = "파인애플"
            default:
                cell.blendOptionLabel.text = "안함"
            }
            return cell
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: Identifiers.subTitleHeaderView) as! SubTitleHeaderView
        view.backgroundColor = .white
        if section == 1 {
            view.sectionTitleLabel.text = "구독박스"
            view.cautionLabel.isHidden = true
        }
        if section == 2 {
            view.sectionTitleLabel.text = "구독기간"
            view.cautionLabel.isHidden = true
        }
        return view
    }

}

extension SubscribeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        // case 1...3
        case 1:
            return 58.0
        case 2:
            return 58.0
        case 3:
            return 58.0
        default:
            return 0.0
        }
    }
}