//
//  cart.swift
//  nettbutikk (Henryy)
//
//  Created by Henry Lai on 01/04/2023.
//

import Foundation
import Combine

class Cart: ObservableObject {
    static let shared = Cart()
    @Published var items = [Product]()

    func addItem(_ product: Product) {
        items.append(product)
    }
    
    func remove(_ product: Product) {
        if let index = items.firstIndex(of: product) {
            items.remove(at: index)
        }
    }
    
    func contains(_ product: Product) -> Bool {
        items.contains(where: { $0.id == product.id })
    }
    
    func total() -> Double {
        return items.reduce(0) { $0 + $1.price }
    }
}







