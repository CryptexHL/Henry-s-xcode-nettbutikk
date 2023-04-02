//
//  CartView.swift
//  nettbutikk (Henryy)
//
//  Created by Henry Lai on 01/04/2023.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var cart: Cart
    
    var body: some View {
        NavigationView {
            List {
                ForEach(cart.items) { product in
                    Text(product.title)
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("Shopping Cart")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: { cart.items.removeAll() }) {
                        Image(systemName: "trash")
                    }
                }
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        cart.items.remove(atOffsets: offsets)
    }
}



