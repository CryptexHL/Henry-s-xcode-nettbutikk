//
//  UserListViewModel.swift
//  nettbutikk (Henryy)
//
//  Created by Henry Lai on 02/04/2023.
//

import Foundation
import Combine

class UserListViewModel: ObservableObject {
    @Published var users = [User]()
    
    func fetchUsers() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            fatalError("Invalid URL")
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                fatalError("Unable to fetch data")
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            guard let users = try? decoder.decode([User].self, from: data) else {
                fatalError("Unable to decode JSON")
            }
            DispatchQueue.main.async {
                self.users = users
            }
        }.resume()
    }
}
