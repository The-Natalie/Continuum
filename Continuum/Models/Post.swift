//
//  Post.swift
//  Continuum
//
//  Created by Natalie Hall on 8/10/21.
//  Copyright © 2021 trevorAdcock. All rights reserved.
//

import UIKit

class Post {
    var photoData: Data?
    var timestamp: Date
    var caption: String
    var comments: [Comment]
    var photo: UIImage? {
        get {
            guard let photoData = photoData else { return nil }
            return UIImage(data: photoData)
        } set {
            photoData = newValue?.jpegData(compressionQuality: 0.5)
        }
    }
    
    init(timestamp: Date = Date(), caption: String, comments: [Comment] = [], photo: UIImage?) {
        self.timestamp = timestamp
        self.caption = caption
        self.comments = comments
        self.photo = photo
    }
    
}  // End of Class

extension Post: SearchableRecord {
    func matches(searchTerm: String) -> Bool {
        if caption.lowercased().contains(searchTerm.lowercased()) {
            return true
        } else {
            return false
        }
    }
}
