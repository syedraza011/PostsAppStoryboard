//
//  PostsService.swift
//  PostsDemo
//
//  Created by Syed Raza on 6/22/23.
//

import Foundation
import Combine

enum APIError: Error {
    case invalidUrl
    case invalidResponse
    case emptyData
    case serviceUnavailable
    case decodingError
    
    var description: String {
        switch self {
        case .invalidUrl:
            return "invalid url"
        case .invalidResponse:
            return "invalid response"
        case .emptyData:
            return "empty data"
        case .serviceUnavailable:
            return "service unavailable"
        case .decodingError:
            return "decoding error"
        }
    }
}

protocol PostsServiceProtocol {
    func fetchPosts() async throws -> [Post]

}

class PostsService: PostsServiceProtocol {
    
    struct Constants {
        static let baseURL = "https://jsonplaceholder.typicode.com/posts"
    }
    
    var cancellables = Set<AnyCancellable>()
    
    // Using Async await for GET call
    func fetchPosts() async throws -> [Post] {
        guard let url = URL(string: Constants.baseURL) else { throw APIError.invalidUrl }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let resp = response as? HTTPURLResponse, 200...299 ~= resp.statusCode else {
            throw APIError.invalidResponse
        }
        return try JSONDecoder().decode([Post].self, from: data)
    }
    
}

