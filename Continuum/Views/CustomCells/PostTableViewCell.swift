//
//  PostTableViewCell.swift
//  Continuum
//
//  Created by Natalie Hall on 8/10/21.
//  Copyright © 2021 trevorAdcock. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var captionTextLabel: UILabel!
    @IBOutlet weak var commentTextLabel: UILabel!
    
    var post: Post? {
        didSet {
            updateViews()
        }
    }

    func updateViews() {
        postImageView.image = post?.photo
        captionTextLabel.text = post?.caption
        commentTextLabel.text = "Number of comments: \(post?.comments.count ?? 0)"
    }
    
}  // End of Class
