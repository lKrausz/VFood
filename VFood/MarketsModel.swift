//
//  MarketsModel.swift
//  VFood
//
//  Created by Виктория Козырева on 10.05.2021.
//

import Foundation

typealias Market = [[String: String]]

func initMarketList() -> Market {
    var marketList : Market = []
    marketList.append(["owner_id" : "-57011898"])
    marketList.append(["owner_id" : "-111953733"])
    marketList.append(["owner_id" : "-16580516"])
    marketList.append(["owner_id" : "-201213845"])
    marketList.append(["owner_id" : "-90385667"])
    marketList.append(["owner_id" : "-90220212"])
    marketList.append(["owner_id" : "-75829328"])

    return marketList
}
