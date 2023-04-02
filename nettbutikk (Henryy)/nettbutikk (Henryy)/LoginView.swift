//
//  LoginView.swift
//  nettbutikk (Henryy)
//
//  Created by Henry Lai on 02/04/2023.
//

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @Binding var isLoggedIn: Bool
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button("Log in") {

                
                if username == "H" && password == "H" {
                    isLoggedIn = true
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .padding()
            .disabled(username.isEmpty || password.isEmpty)
            
            if isLoggedIn {
                Text("Welcome, \(username)!")
            }
        }
    }
}

