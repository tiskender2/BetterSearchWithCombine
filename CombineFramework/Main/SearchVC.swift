//
//  SearchVC.swift
//  CombineFramework
//
//  Created by Tolga İskender on 18.04.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import UIKit

class SearchVC: UITableViewController {
    
    var movies : MovieModel?
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        setupSearchBarListener()
        setupTableView()
        getMovies(searchText: "Batman")
    }

    
    func setupSearchBar(){
        navigationItem.searchController = searchController
        navigationController?.navigationBar.prefersLargeTitles = true
        searchController.obscuresBackgroundDuringPresentation = false
    }
    func setupSearchBarListener(){
        let publisher = NotificationCenter.default.publisher(for: UISearchTextField.textDidChangeNotification, object: searchController.searchBar.searchTextField)
        publisher
        .map {
            ($0.object as! UISearchTextField).text
        }
        .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
        .sink { (searchText) in
            if searchText?.count != 0 {
                self.getMovies(searchText: searchText ?? "")
            } else {
                self.getMovies(searchText: "Batman")
            }
            
        }
    }
    func setupTableView(){
        tableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "MovieCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44.0
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.movies?.search?.count ?? 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        if let search = movies?.search {
            cell.setupCell(movie:search[indexPath.row])
        }
       
        return cell
    }
   
   

}
extension SearchVC {
    
    func getMovies(searchText:String){
        Network.shared.fetchSearchMovies(searchText: searchText) {  [weak self] (movies) in
            self?.movies = movies
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
            
        }
    }
}
