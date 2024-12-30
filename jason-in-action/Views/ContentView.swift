//
//  ContentView.swift
//  jason-in-action
//
//  Created by Nonprawich I. on 30/12/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var user: GitHubUser?
    @State private var selectedSource = DataSource.network
    
    enum DataSource: String, CaseIterable {
        case network = "Network"
        case localString = "Local String"
        case localFile = "Local File"
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Picker("Data Source", selection: $selectedSource) {
                ForEach(DataSource.allCases, id: \.self) { source in
                    Text(source.rawValue)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            
            if let user = user {
                AsyncImage(url: URL(string: user.avatarUrl)) { image in
                    image
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 120, height: 120)
                } placeholder: {
                    Circle()
                        .foregroundColor(.secondary.opacity(0.2))
                        .frame(width: 120, height: 120)
                }
                
                Text(user.login)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(user.bio)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            
            Button("Load Data") {
                loadData()
            }
            .buttonStyle(.bordered)
            
            Spacer()
        }
        .padding()
    }
    
    private func loadData() {
        Task {
            do {
                let dataManager = DataManager()
                
                switch selectedSource {
                case .network:
                    let networkManager = NetworkManager()
                    user = try await networkManager.fetchGitHubUser()
                case .localString:
                    user = try dataManager.getUserFromLocalString()
                case .localFile:
                    user = try dataManager.getUserFromLocalFile()
                }
            } catch {
                print("Error: \(error)")
            }
        }
    }
}

#Preview {
    ContentView()
}
