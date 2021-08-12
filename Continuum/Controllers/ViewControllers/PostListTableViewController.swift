//
//  PostListTableViewController.swift
//  Continuum
//
//  Created by Natalie Hall on 8/10/21.
//  Copyright © 2021 trevorAdcock. All rights reserved.
//

import UIKit

class PostListTableViewController: UITableViewController {

    @IBOutlet weak var postSearchBar: UISearchBar!
    
    var resultsArray: [SearchableRecord] = []
    var isSearching: Bool = false
    var dataSource: [SearchableRecord] {
        if isSearching {
            return resultsArray
        } else {
            return PostController.shared.posts
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postSearchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
        resultsArray = PostController.shared.posts
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
        let post = dataSource[indexPath.row] as? Post
        cell.post = post

        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPostDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                  let destination = segue.destination as? PostDetailTableViewController else { return }
            let post = dataSource[indexPath.row] as? Post
            destination.post = post
        }
    }
}  // End of Class


extension PostListTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchTerm: String) {
        if !searchTerm.isEmpty {
            resultsArray = PostController.shared.posts.filter { $0.matches(searchTerm: searchTerm) }
            tableView.reloadData()
        } else {
            resultsArray = PostController.shared.posts
            tableView.reloadData()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        resultsArray = PostController.shared.posts
        tableView.reloadData()
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        //          isSearching = false
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearching = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        isSearching = false
        searchBar.text = ""
    }
}
// nhall - go over search again
