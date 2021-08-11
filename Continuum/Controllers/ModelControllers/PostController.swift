//
//  PostController.swift
//  Continuum
//
//  Created by Natalie Hall on 8/10/21.
//  Copyright © 2021 trevorAdcock. All rights reserved.
//

import Foundation
import UIKit

class PostController {
    
    static let shared = PostController()
    var posts: [Post] = []
    
    // MARK: - CRUD
    func addComment(text: String, post: Post, completion: @escaping (Result<Comment?, PostError>) -> Void) {
        let newComment = Comment(text: text)
        post.comments.append(newComment)
    }
    
    func createPostWith(image: UIImage, caption: String, completion: @escaping (Result<Post?, PostError>) -> Void) {
        let newPost = Post(caption: caption, photo: image)
        self.posts.append(newPost)
    }
}  // End of Class
