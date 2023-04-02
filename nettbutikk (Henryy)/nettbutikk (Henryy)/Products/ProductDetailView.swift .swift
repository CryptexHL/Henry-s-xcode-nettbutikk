//
//  ProductDetailView.swift .swift
//  nettbutikk (Henryy)
//
//  Created by Henry Lai on 30/03/2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductDetailView: View {
    let product: Product
    @ObservedObject var cart: Cart
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                WebImage(url: URL(string: product.image))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                Text(product.title)
                    .font(.title)
                Text("$\(product.price)")
                    .font(.headline)
                    .padding(.top, 8)
                Button(action: {
                    cart.addItem(product)
                }, label: {
                    Text("Add to Cart")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                })
                .padding(.top, 16)
            }
            .padding()
        }
    }
} 



