//
//  DataManager.swift
//  jason-in-action
//
//  Created by Nonprawich I. on 30/12/2024.
//

import Foundation



class DataManager {
    
    //MARK: Local String
    func getUserFromLocalString() throws -> GitHubUser {
        let jsonString = """
        {
            "login": "npwitk",
            "avatar_url": "https://avatars.githubusercontent.com/u/40120130?v=4",
            "bio": "ษวัษดลีร์ครั๊ผผฒ | JamesXDO (This is local string)"
        }
        """
        
        guard let jsonData = jsonString.data(using: .utf8) else {
            throw GHError.invalidData
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(GitHubUser.self, from: jsonData)
    }
    
    
    //MARK: Local File
    func getUserFromLocalFile() throws -> GitHubUser {
            guard let fileURL = Bundle.main.url(forResource: "github_user", withExtension: "json") else {
                throw GHError.invalidURL
            }
            
            let jsonData = try Data(contentsOf: fileURL)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(GitHubUser.self, from: jsonData)
        }
}
