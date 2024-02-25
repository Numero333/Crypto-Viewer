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
    let currentPrice: Double
    let marketCapRank: Int
    let high24hPrice: Double
    let low24hPrice: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case symbol
        case name
        case image
        case currentPrice = "current_price"
        case marketCapRank = "market_cap_rank"
        case high24hPrice = "high_24h"
        case low24hPrice = "low_24h"
    }
    
    var imageUrl: URL? {
        return URL(string: image)
    }
    
    var currentPriceFormatted: String {
        return currentPrice.asStringWithTwoDecimals
    }
    
    var highPriceFormatted: String {
        return high24hPrice.asStringWithTwoDecimals
    }
    
    var lowPriceFormatted: String {
        return low24hPrice.asStringWithTwoDecimals
    }
}

extension TokenModel {
    static var mockToken = TokenModel(id: "001", symbol: "btc", name: "Bitcoin", image: "", currentPrice: 40000, marketCapRank: 1, high24hPrice: 41000, low24hPrice: 39000)
}

extension Double {
    var asStringWithTwoDecimals: String {
        let formatter = NumberFormatter()
                formatter.minimumFractionDigits = 0
                formatter.maximumFractionDigits = 2
                return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}
