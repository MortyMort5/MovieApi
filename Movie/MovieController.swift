//
//  MovieController.swift
//  Movie
//
//  Created by Sterling Mortensen on 2/17/17.
//  Copyright © 2017 Sterling Mortensen. All rights reserved.
//

import Foundation

class MovieController {
    
    static let baseURL = URL(string: "https://api.themoviedb.org/3/search/movie")
    
    static let apiKey = "aaaa6caa748670a61846fa3cac93f89c"
    
    //==============================================================
    // MARK: - Fetch Movie Function
    //==============================================================
    
    static func fetchMovies(byMovieTitle title: String, completion: @escaping([Movie]) -> Void) {
        
        guard let url = baseURL else { print(fatalError("Error with unwrapping the baseURL")); completion([]); return }
        
        let urlParameters = ["api_key":apiKey, "query": title]
        
        NetworkController.performRequest(for: url, httpMethod: .Get, urlParameters: urlParameters) { (data, error) in
            if let error = error {
                print(error.localizedDescription)
                completion([])
                return
            }
         
            guard let data = data,
                    let responseStringData = String(data: data, encoding: .utf8) else { print("Error with responseStringData"); completion([]); return }
            
            guard let jsonDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String: Any],
                let movieDictionary = jsonDictionary["results"] as? [[String: Any]] else { print("Error with serializing data. Response: \(responseStringData)"); completion([]); return }
            
            let movies = movieDictionary.flatMap({ Movie(jsonDictionary: $0) })
            completion(movies)
            
        }
    }
}
