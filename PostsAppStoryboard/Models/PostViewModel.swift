//
//  PostViewModel.swift
//  PostsAppStoryboard
//
//  Created by Syed Raza on 8/13/23.
//

import Foundation
class PostsViewModel {
    
    let service: PostsServiceProtocol
    init(service: PostsServiceProtocol) {
        self.service = service
    }
    @MainActor func getPosts()-> [Post] {
      
                return try await service.fetchPostsUsingAsyncAwait()
       
    }
    
}
