//
//  UserDetailView.swift
//  nettbutikk (Henryy)
//
//  Created by Henry Lai on 02/04/2023.
//

import SwiftUI

struct UserDetailView: View {
    let user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(user.name)
                .font(.title)
            Text(user.email)
                .font(.subheadline)
            Text(user.address.street)
            Text("\(user.address.city), \(user.address.zipCode)")
            Spacer()
        }
        .padding()
    }
}
