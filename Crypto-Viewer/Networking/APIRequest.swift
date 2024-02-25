//
//  APIRequest.swift
//  Crypto-Viewer
//
//  Created by François-Xavier on 12/02/2024.
//

import Foundation

struct APIRequest {
    
    let url: RequestURL
    let method: HTTPMethod
    let headers: [String:String]?
    
    enum RequestURL {
        case markets(comparaisonCurrency: String,itemPerPage: String, page: String, lang: String)
                
        var value: String {
            switch self {
            case .markets(let comparaisonCurrency, let itemPerPage, let page, let lang):
                return BaseUrl.coinGecko.rawValue + APIPath(itemPerPage: itemPerPage, page: page, comparaisonCurrency: comparaisonCurrency, lang: lang).path
            }
        }
    }
}

enum BaseUrl:String {
    case coinGecko = "https://api.coingecko.com/api/v3/coins/"
}

struct APIPath {
    let itemPerPage: String
    let page: String
    let comparaisonCurrency: String
    let lang: String
    
    var path: String {
        return "markets?vs_currency=\(comparaisonCurrency)&order=market_cap_desc&per_page=\(itemPerPage)&page=\(page)&sparkline=false&locale=\(lang)"
    }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "UPDATE"
    case patch = "PATCH"
    case delete = "DELETE"
}
