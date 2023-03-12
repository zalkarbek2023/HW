//
//  FlashModel.swift
//  hwGET
//
//  Created by zalkarbek on 12/3/23.
//

import Foundation

struct FlashSale: Codable {
    let flash_sale: [FlashModel]
}

struct FlashModel: Codable {
    let name: String
    let price: Int
    let image_url: String
    
}
