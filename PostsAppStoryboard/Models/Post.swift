//
//  Post.swift
//  PostsAppStoryboard
//
//  Created by Syed Raza on 8/13/23.
//


import Foundation
struct Post: Codable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
