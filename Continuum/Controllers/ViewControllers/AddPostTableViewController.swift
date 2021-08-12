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
    @IBOutlet weak var captionTextField: UITextField!
    
    var selectedImage: UIImage?

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        captionTextField.text = ""
    }
    
    // MARK: - Actions
    @IBAction func addPostButtonTapped(_ sender: Any) {
        guard let photo = selectedImage,
              let caption = captionTextField.text else { return }
        PostController.shared.createPostWith(image: photo, caption: caption, completion: { post in
        })
        self.tabBarController?.selectedIndex = 0
    }

    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.tabBarController?.selectedIndex = 0
    }
    
    // toImageContainer
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segue.identifier == "toImageContainer" {
        let imageSelect = segue.destination as? PhotoSelectorViewController
        imageSelect?.delegate = self
      }
    }
    
}  // End of Class


extension AddPostTableViewController: PhotoSelectorViewControllerDelegate {
  func photoSelectorViewControllerSelected(image: UIImage) {
    selectedImage = image
  }
}
