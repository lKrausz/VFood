//
//  Configs.swift
//  VFood
//
//  Created by Виктория Козырева on 11.05.2021.
//

import Foundation
import VK_ios_sdk

struct Configs {
    static var shared = Configs()
    let VK_APP_ID = "7847397"
    let score = ["market"]
    var accessToken = VKAccessToken.init()

    private init() { }
    
    mutating func setToken(token: VKAccessToken) {
        accessToken = token
    }
    
}
