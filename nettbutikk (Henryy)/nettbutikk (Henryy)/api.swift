//
//  api.swift
//  nettbutikk (Henryy)
//
//  Created by Henry Lai on 30/03/2023.
//


import Foundation

class API {
    static let shared = API()
    
    private init() {}
    
    func fetchProducts(completion: @escaping ([Product]) -> Void) {
        let urlString = "https://fakestoreapi.com/products"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            let products = try? JSONDecoder().decode([Product].self, from: data)
            completion(products ?? [])
        }.resume()
    }
} 
