//
//  VFoodModel.swift
//  VFood
//
//  Created by Виктория Козырева on 09.05.2021.
//

import Foundation

struct VKApiResponse : Decodable {
    let response: VKResponse
}

extension VKResponse: Decodable {
    private enum VKResponseCodingKeys: String, CodingKey {
        case count
        case items
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: VKResponseCodingKeys.self)
        count = try container.decode(Int.self, forKey: .count)
        items = try container.decode([VKItem].self, forKey: .items)

    }
}

struct VKResponse {
    let count: Int
    let items: [VKItem]
}

struct VKItem : Decodable {
    let description : String
    let id : Int
    let price : Price
    let title : String
    let thumb_photo : String
}

struct Price: Decodable {
    let text : String
}
