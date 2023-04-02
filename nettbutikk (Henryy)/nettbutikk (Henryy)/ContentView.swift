//
//  ContentView.swift
//  nettbutikk (Henryy)
//
//  Created by Henry Lai on 30/03/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ProductListViewModel()
    @StateObject var cart = Cart.shared
    @State private var showingCart = false
    @State private var showingLogin = false
    @State private var showingUserProfile = false
    @State private var isLoggedIn = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            List(viewModel.products) { product in
                NavigationLink(destination: ProductDetailView(product: product, cart: cart)) {
                    ProductRowView(product: product, cart: cart)
                }
            }
            .navigationTitle("Products")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    if showingLogin {
                        Button("Cancel") {
                            showingLogin = false
                        }
                    }
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: { showingCart = true }) {
                        Image(systemName: "cart")
                    }
                    .sheet(isPresented: $showingCart) {
                        CartView(cart: cart)
                    }
                    
                    if isLoggedIn {
                        Button(action: { showingUserProfile = true }) {
                            Image(systemName: "person.crop.circle")
                        }
                        Button(action: { isLoggedIn = false }) {
                            Image(systemName: "lock.open")
                        }
                    } else {
                        Button(action: { showingLogin = true }) {
                            Image(systemName: "person.circle.fill")
                        }
                        .sheet(isPresented: $showingLogin) {
                            LoginView(isLoggedIn: $isLoggedIn)
                                .onChange(of: isLoggedIn) { value in
                                    showingLogin = !value
                                }
                        }
                        .sheet(isPresented: $showingUserProfile) {
                            UserProfileView()
                        }
                    }
                }
            }
            .onAppear {
                viewModel.fetchProducts()
            }
            .environmentObject(cart)
        }
    }
}

                                  

