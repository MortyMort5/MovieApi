//
//  Movie.swift
//  Movie
//
//  Created by Sterling Mortensen on 2/17/17.
//  Copyright © 2017 Sterling Mortensen. All rights reserved.
//

import Foundation

class Movie {
    
    private let titleKey = "title"
    private let ratingKey = "vote_average"
    private let summaryKey = "overview"
    private let imageEndPointKey = "poster_path"
    
    let title: String
    let rating: Double
    let summary: String
    let imageEndPoint: String
    var image: String {
        return "https://image.tmdb.org/t/p/w500\(imageEndPoint)"
    }
    
    init?(jsonDictionary: [String: Any]) {
        guard let title = jsonDictionary[titleKey] as? String,
            let rating = jsonDictionary[ratingKey] as? Double,
            let summary = jsonDictionary[summaryKey] as? String,
            let imageEndPoint = jsonDictionary[imageEndPointKey] as? String else { return nil }
        
        self.title = title
        self.rating = rating
        self.summary = summary
        self.imageEndPoint = imageEndPoint
    }
}
