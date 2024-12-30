//
//  NetworkManager.swift
//  jason-in-action
//
//  Created by Nonprawich I. on 30/12/2024.
//

import Foundation

//MARK: Network Calls

class NetworkManager {
    
    func fetchGitHubUser() async throws -> GitHubUser {
        let endpoint = "https://api.github.com/users/npwitk"
        
        guard let url = URL(string: endpoint) else {
            throw GHError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw GHError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(GitHubUser.self, from: data)
        } catch {
            throw GHError.invalidData
        }
    }
}
