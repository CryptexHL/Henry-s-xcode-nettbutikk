//
//  userRowView.swift
//  nettbutikk (Henryy)
//
//  Created by Henry Lai on 02/04/2023.
//

import SwiftUI

struct UserRowView: View {
    let user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(user.name)
                .font(.headline)
            Text(user.email)
                .font(.subheadline)
        }
    }
}
