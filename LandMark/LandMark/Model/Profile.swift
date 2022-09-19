//
//  Profile.swift
//  LandMark
//
//  Created by Minseop Kim on 2022/09/05.
//

import Foundation


struct Profile {
    var username: String
    var preferNotifications: Bool = true
    var seasonalPhoto = Season.winter
    var goalData = Date()
    
    static let `default` = Profile(username: "g_kumar")
    
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"

        var id: String { rawValue }
        
    }
}
