# GitHub User Profile App - JSON & Network Learning Project

A simple iOS app demonstrating different methods of working with JSON data in Swift, including network calls, local strings, and JSON files.

## Features

- Fetch GitHub user profile data from:
  - GitHub API (Network call)
  - Local JSON string
  - Local JSON file
- Toggle between different data sources using a segmented control
- Display user profile image, login name, and bio

## Project Structure

```
jason-in-action/
├── Error/
│   └── GHError.swift            # Error enum for the app
├── Models/
│   └── GitHubUser.swift         # User data model
├── Managers/
│   ├── NetworkManager.swift     # Network call handling
│   └── DataManager.swift        # Local data handling
├── Views/
│   └── ContentView.swift        # Main view
└── Resources/
    └── github_user.json         # Sample JSON data
```

## Code Examples

### Loading Data from Different Sources

```swift
// Network Call
let networkManager = NetworkManager()
let user = try await networkManager.fetchGitHubUser()

// Local String
let dataManager = DataManager()
let user = try dataManager.getUserFromLocalString()

// Local File
let user = try dataManager.getUserFromLocalFile()
```

## JSON Data Format

```json
{
    "login": "username",
    "avatar_url": "https://example.com/avatar.jpg",
    "bio": "User bio"
}
```

## Additional Notes

This is a learning project focused on JSON handling and networking basics in Swift. It's intentionally kept simple to demonstrate core concepts.
