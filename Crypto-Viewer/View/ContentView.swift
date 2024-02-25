//
//  ContentView.swift
//  Crypto-Viewer
//
//  Created by François-Xavier on 11/02/2024.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model = MainViewModel()
    @State private var showAlert = false
    
    private var isLoading: Bool {
        return model.token.isEmpty
    }
    
    var body: some View {
        VStack {
            
            Text("Crypto Viewer")
                .font(.title)
                .bold()
            
            if isLoading {
                LoadingView()
            } else {
                List {
                    ForEach(model.token) { token in
                        TokenRowView(token: token)
                            .onAppear {
                                if token.id == model.token.last?.id {
                                    model.loadNextPage()
                                }
                            }
                    }
                }
                .listStyle(.plain)
                .refreshable {
                    model.refreshData()
                }
            }
        }
        .onReceive(model.$error, perform: { _ in
            if model.error != nil {
                showAlert = true
            }
        })
        .alert("An error has occurred !",
               isPresented: $showAlert) {
            Button("Okay") {
                showAlert.toggle()
            }
        } message: {
            Text(model.error?.description ?? "Unknown error please try again")
        }
        .onAppear {
            model.loadData()
        }
    }
}

#Preview {
    ContentView()
}

struct TokenRowView: View {
    
    let token: TokenModel
    
    var body: some View {
        HStack(alignment: .center) {
            
            // Token Rank
            Text(token.marketCapRank.description)
            
            // Token Image
            AsyncImage(url: token.imageUrl) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
            } placeholder: {
                ProgressView()
            }
            .padding(.horizontal)
            
            // Token name
            VStack(alignment: .leading) {
                Text(token.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text(token.symbol.uppercased())
                    .font(.caption)
            }
            
            Spacer()
            
            // Token price info
            VStack(alignment: .leading) {
                Text("Price : \(token.currentPriceFormatted)$")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                HStack {
                    Text("24h High \n\(token.highPriceFormatted)$")
                        .foregroundStyle(.green)
                    Text("24h Low \n\(token.lowPriceFormatted)$")
                        .foregroundStyle(.red)
                }
                .font(.caption)
            }
            .padding(.trailing, 5)
        }
    }
}

struct LoadingView: View {
    var body: some View {
        Spacer()
        Text("Fetching data ...")
            .font(.title2)
            .fontWeight(.semibold)
            .fontDesign(.rounded)
            .padding(.bottom)
        ProgressView()
        Spacer()
    }
}
