//
//  FlashViewModel.swift
//  hwGET
//
//  Created by zalkarbek on 12/3/23.
//

import Foundation

class FlashViewModel {
    
    private let networkService = NetworkService.shared
    
    var flash: [FlashModel] = []
    
    func fetchFlshSale() async throws -> [FlashModel] {
        return try await networkService.fetchFlashSale()
    }
}
