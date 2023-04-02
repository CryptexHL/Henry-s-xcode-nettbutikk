//
//  ProductRowView.swift
//  nettbutikk (Henryy)
//
//  Created by Henry Lai on 30/03/2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductRowView: View {
    let product: Product
    @ObservedObject var cart: Cart
    
    var body: some View {
        HStack {
            WebImage(url: URL(string: product.image))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .cornerRadius(8)
            VStack(alignment: .leading) {
                Text(product.title)
                    .font(.headline)
                Text("$\(product.price)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            Button(action: {
                cart.addItem(product)
            }) {
                Image(systemName: cart.contains(product) ? "checkmark.circle.fill" : "plus.circle")
            }
            .foregroundColor(cart.contains(product) ? .green : .blue)
        }
    }
} 

