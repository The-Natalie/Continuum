//
//  PostDetailTableViewController.swift
//  Continuum
//
//  Created by Natalie Hall on 8/10/21.
//  Copyright © 2021 trevorAdcock. All rights reserved.
//

import UIKit

class PostDetailTableViewController: UITableViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var photoImageView: UIImageView!
    
    var post: Post? {
        didSet {
            loadViewIfNeeded()
            updateViews()
        }
    }
    
    // MARK: - Actions
    @IBAction func commentButtonTapped(_ sender: Any) {
        presentCommentAlertController()
    }
    
    @IBAction func shareButtonTapped(_ sender: Any) {
        guard let image = post?.photo,
              let caption = post?.caption else { return }
        let sharableObjects = UIActivityViewController(activityItems: [image, caption], applicationActivities: nil)
        present(sharableObjects, animated: true, completion: nil)
    }
    
    @IBAction func followButtonTapped(_ sender: Any) {
        
    }
    
    func updateViews() {
        photoImageView.image = post?.photo
        tableView.reloadData()
    }
    
    func presentCommentAlertController() {
        let alertController = UIAlertController(title: "Add Comment", message: "Tell us what you REALLY think...", preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Your comment goes here"
            textField.autocorrectionType = .yes
            textField.autocapitalizationType = .sentences
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "Comment", style: .default) { _ in
            guard let comment = alertController.textFields?.first?.text, !comment.isEmpty,
                  let post = self.post else { return }
            PostController.shared.addComment(text: comment, post: post, completion: { comment in
                
            })
            self.tableView.reloadData()
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}  // End of Class


extension PostDetailTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return post?.comments.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
        let comment = post?.comments[indexPath.row]
        cell.textLabel?.text = comment?.text
        cell.detailTextLabel?.text = post?.timestamp.formatDate()
        return cell
    }
}
