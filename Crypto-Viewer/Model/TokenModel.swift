//
//  TokenModel.swift
//  Crypto-Viewer
//
//  Created by François-Xavier on 11/02/2024.
//

import Foundation

struct TokenModel: Codable, Identifiable {
    let id: String
    let symbol: String
    let name: String
    let image: String
    let current_price: Double
    let market_cap: Double
    let market_cap_rank: Int
    let total_volume: Double
    let high_24h: Double
    let low_24h: Double
    let price_change_24h: Double
    let price_change_percentage_24h: Double
    
    var imageUrl: URL? {
        return URL(string: image)
    }
    
    var currentPriceFormatted: String {
        return current_price.formattedWithTwoDecimals
    }
    
    var highPriceFormatted: String {
        return high_24h.formattedWithTwoDecimals
    }
    
    var lowPriceFormatted: String {
        return low_24h.formattedWithTwoDecimals
    }
}

extension TokenModel {
    static var mockToken = TokenModel(id: "001", symbol: "btc", name: "Bitcoin", image: "", current_price: 40000, market_cap: 680000, market_cap_rank: 1, total_volume: 200000, high_24h: 41000, low_24h: 39000, price_change_24h: 10, price_change_percentage_24h: 10)
}

extension Double {
    var formattedWithTwoDecimals: String {
        let formatter = NumberFormatter()
                formatter.minimumFractionDigits = 0
                formatter.maximumFractionDigits = 2
                return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}
