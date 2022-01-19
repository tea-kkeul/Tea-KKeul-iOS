//
//  UITextView+.swift
//  Tea-KKeul-iOS
//
//  Created by 이윤진 on 2022/01/19.
//

import UIKit
extension UITextView {
    /// addLeftPadding - TextView에서 상하좌우 여백을 주는 함수
    func addPadding() {
        self.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10);
    }
}
