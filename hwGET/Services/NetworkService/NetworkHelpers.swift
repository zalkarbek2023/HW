//
//  NetworkHelpers.swift
//  hwGET
//
//  Created by zalkarbek on 11/3/23.
//

import Foundation

struct NetworkHelpers {
    static func decode<T: Decodable>(with data: Data) throws -> T {
        try JSONDecoder().decode(T.self, from: data)
    }
}
