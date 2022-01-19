//
//  CALayer+.swift
//  Tea-KKeul-iOS
//
//  Created by 이윤진 on 2022/01/19.
//

import UIKit

extension CALayer {
  func applyShadow (
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
