//
//  Movies.swift
//  Kotha_MovieApp
//
//  Created by Sravani Kotha on 11/23/24.
//

import Foundation

struct Movies{
    //making genre and list_Array constants
    let genre: String
    let list_Array: [MovieList]
}

struct MovieList{
    let movieName: String
    let movieImage: String
    let movieInfo: String
}
