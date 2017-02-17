//
//  MovieListTableViewController.swift
//  Movie
//
//  Created by Sterling Mortensen on 2/17/17.
//  Copyright © 2017 Sterling Mortensen. All rights reserved.
//

import UIKit

class MovieListTableViewController: UITableViewController, UISearchBarDelegate {
    
    //==============================================================
    // MARK: - Outlets
    //==============================================================
    
    @IBOutlet weak var movieSearchBar: UISearchBar!

    var movies: [Movie] = []{
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //==============================================================
    // MARK: - TableView Functions
    //==============================================================
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieListCell", for: indexPath) as? MovieTableViewCell else { return UITableViewCell() }
        
        let movie = movies[indexPath.row]
        cell.movie = movie
        
        return cell
    }
    
    //==============================================================
    // MARK: - SearchBar Function
    //==============================================================

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let movieTitle = movieSearchBar.text, !movieTitle.isEmpty else { return }
     
        MovieController.fetchMovies(byMovieTitle: movieTitle) { (movies) in
            self.movies = movies
        }
    }
}
