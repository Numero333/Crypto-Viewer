//
//  MainViewModel.swift
//  Crypto-Viewer
//
//  Created by François-Xavier on 11/02/2024.
//

import Foundation


final class MainViewModel: ObservableObject {
    
    @Published var token = [TokenModel]()
    @Published var error: APIError?
    @Published var currency: CurrencyModel = .usd
    
    var page: Int = 1
    var itemPerPage: Int = 10
    var language = "en"
    
    private let apiService = APIService<[TokenModel]>()
    
    func loadNextPage() {
        page += 1
        loadData()
    }
    
    func loadData() {
        Task(priority: .medium) {
            await fetchingToken()
        }
    }
    
    func refreshData() {
        token.removeAll()
        page = 1
        loadData()
    }
    
    @MainActor
    private func fetchingToken() async {
        do {
            let data = try await apiService.performRequest(apiRequest: APIRequest(url: .markets(comparaisonCurrency: currency.rawValue, itemPerPage: itemPerPage.description, page: page.description, lang: language),
                                                                                  method: .get,
                                                                                  headers: ["x-cg-demo-api-key" : APIKey.coinGeckoApi]))
            token.append(contentsOf: data)
        } catch {
            self.error = error as? APIError
        }
    }
}
