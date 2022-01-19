//
//  TypeOfViewController.swift
//  Tea-KKeul-iOS
//
//  Created by 황윤경 on 2022/01/18.
//

import Foundation
enum TypeOfViewController {
    case tabBar
    case home
    case magazine
    case calendar
    case mypage
}

extension TypeOfViewController {
    func storyboardRepresentation() -> StoryboardRepresentation {
        switch self {
        case .tabBar:
            return StoryboardRepresentation(bundle: nil, storyboardName: Identifiers.tabBarSB, storyboardId: Identifiers.teaKKeulTBC)
        case .home:
            return StoryboardRepresentation(bundle: nil, storyboardName: Identifiers.homeSB, storyboardId: Identifiers.homeNC)
        case .magazine:
            return StoryboardRepresentation(bundle: nil, storyboardName: Identifiers.magazineSB, storyboardId: Identifiers.magazineVC)
        case .calendar:
            return StoryboardRepresentation(bundle: nil, storyboardName: Identifiers.calendarSB, storyboardId: Identifiers.calendarVC)
        case .mypage:
            return StoryboardRepresentation(bundle: nil, storyboardName: Identifiers.mypageSB, storyboardId: Identifiers.mypageNC)
        }
    }
}
