//
//  userListView.swift
//  nettbutikk (Henryy)
//
//  Created by Henry Lai on 02/04/2023.
//

import SwiftUI

struct UserListView: View {
    @StateObject var viewModel = UserListViewModel()
    @State private var showingUserDetail = false
    @State private var selectedUser: User?
    
    var body: some View {
        NavigationView {
            List(viewModel.users) { user in
                Button(action: {
                    selectedUser = user
                    showingUserDetail = true
                }) {
                    UserRowView(user: user)
                }
            }
            .navigationTitle("Users")
            .sheet(isPresented: $showingUserDetail) {
                if let user = selectedUser {
                    UserDetailView(user: user)
                }
            }
        }
        .onAppear {
            viewModel.fetchUsers()
        }
    }
}

