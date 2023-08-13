//
//  PostViewModel.swift
//  PostsAppStoryboard
//
//  Created by Syed Raza on 8/13/23.
//

import Foundation
class PostsViewModel {
    
    let service: PostsServiceProtocol
    init(service: PostsServiceProtocol = PostsService()) {
        self.service = service
    }
    @MainActor func getPosts() async throws-> [Post] {
        
        return try await service.fetchPosts()
        
        
        
    }
}
