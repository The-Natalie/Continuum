//
//  AddPostTableViewController.swift
//  Continuum
//
//  Created by Natalie Hall on 8/10/21.
//  Copyright © 2021 trevorAdcock. All rights reserved.
//

import UIKit

class AddPostTableViewController: UITableViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var selectPhotoButton: UIButton!
    @IBOutlet weak var captionTextField: UITextField!
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        photoImageView.image = nil
        captionTextField.text = ""
        selectPhotoButton.setTitle("Select Image", for: .normal)

    }
    
    // MARK: - Actions
    @IBAction func selectPhotoButtonTapped(_ sender: Any) {
        photoImageView.image = #imageLiteral(resourceName: "spaceEmptyState")
    }
    
    @IBAction func addPostButtonTapped(_ sender: Any) {
        guard let photo = photoImageView.image,
              let caption = captionTextField.text else { return }
        PostController.shared.createPostWith(image: photo, caption: caption, completion: { post in
        })
        self.tabBarController?.selectedIndex = 0
    }

    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.tabBarController?.selectedIndex = 0
    }
}
