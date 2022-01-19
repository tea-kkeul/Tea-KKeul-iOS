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

// MARK: - 임시로 저장, merge이후 extension 파일에 추가하겠습니다!
extension CALayer {
  func applyShadow(
    color: UIColor = .black,
    alpha: Float = 0.5,
    shadowX: CGFloat = 0,
    shadowY: CGFloat = 10,
    blur: CGFloat = 4
  ) {
    shadowColor = color.cgColor
    shadowOpacity = alpha
    shadowOffset = CGSize(width: shadowX, height: shadowY)
    shadowRadius = blur / 1.0
  }
}
