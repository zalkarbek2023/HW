//
//  latestModel.swift
//  hwGET
//
//  Created by zalkarbek on 11/3/23.
//

import Foundation

struct Latest: Codable {
    let latest: [LatestModel]
}

struct LatestModel: Codable {
    let category: String
    let name: String
    let price: Int
    let image_url: String
}
