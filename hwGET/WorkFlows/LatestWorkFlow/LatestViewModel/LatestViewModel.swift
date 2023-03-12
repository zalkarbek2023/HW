//
//  LatestViewModel.swift
//  hwGET
//
//  Created by zalkarbek on 11/3/23.
//

import Foundation

class LatestViewModel {
    
    private let networkService = NetworkService.shared
    
    var latest: [LatestModel] = []
    
    func fetchCarts() async throws -> [LatestModel] {
        return try await networkService.fetchLatest()
    }
}
