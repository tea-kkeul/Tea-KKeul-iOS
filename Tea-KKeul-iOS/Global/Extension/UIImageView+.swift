//
//  UIImageView+.swift
//  Tea-KKeul-iOS
//
//  Created by 이윤진 on 2022/01/19.
//

import UIKit.UIImageView

import Kingfisher

extension UIImageView {
    /// Kingfisher 이미지 처리
    /// - Parameters:
    /// - url: 이미지 URL
    /// - defaultImage: 디폴트 이미지!!
    /// - imageview에서 image함수 호출하셔서 파라미터값으로 url넣어주시면 사진이미지 불러오기 가능합니다.
    func image(url: String, defaultImage: UIImage = UIImage()) {
        kf.indicatorType = .activity
        backgroundColor = .black.withAlphaComponent(0.05)
        guard let url = URL(string: url) else {
            image = defaultImage
            return
        }
        kf.setImage(
            with: url,
            placeholder: .none,
            options: [
                .transition(ImageTransition.fade(0.5)),
                .backgroundDecode,
                .alsoPrefetchToMemory,
                .cacheMemoryOnly
            ]
        )
    }
}
