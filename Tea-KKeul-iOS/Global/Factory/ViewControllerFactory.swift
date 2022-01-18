//
//  ViewControllerFactory.swift
//  Tea-KKeul-iOS
//
//  Created by 황윤경 on 2022/01/18.
//

import Foundation
import UIKit
class ViewControllerFactory: NSObject {
    static func viewController(for typeOfVC: TypeOfViewController) -> UIViewController {
        let metaData = typeOfVC.storyboardRepresentation()
        let sb = UIStoryboard(name: metaData.storyboardName, bundle: metaData.bundle)
        let vc = sb.instantiateViewController(withIdentifier: metaData.storyboardId)
        return vc
    }
}
