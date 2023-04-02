//
//  ProductListViewModel.swift
//  nettbutikk (Henryy)
//
//  Created by Henry Lai on 30/03/2023.
//

import Foundation

class ProductListViewModel: ObservableObject {
    @Published var products = [Product]()
    
    
    func fetchProducts() {
        guard let url = URL(string: "https://fakestoreapi.com/products") else {
            fatalError("Invalid URL")
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                fatalError("Unable to fetch data")
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            guard let products = try? decoder.decode([Product].self, from: data) else {
                fatalError("Unable to decode JSON")
            }
            DispatchQueue.main.async {
                self.products = products
            }
        }.resume()
    }
}
