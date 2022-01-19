//
//  TeaListTVC.swift
//  Tea-KKeul-iOS
//
//  Created by 이윤진 on 2022/01/19.
//

import UIKit

class TeaListTVC: UITableViewCell {

    @IBOutlet weak var gradientView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setTeaListTVC()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}

extension TeaListTVC {
    func setTeaListTVC() {
        gradientView.layer.cornerRadius = 5
    }
}


