//
//  ApiSetings.swift
//  TestOnseo
//
//  Created by Дмитро Мостовий on 04.07.2020.
//  Copyright © 2020 Дмитро Мостовий. All rights reserved.
//

import Foundation

class ApiSettings {
    
    static let shared = ApiSettings()
    
    let baseURL = "http://api.themoviedb.org/3/"
    let imagePath = "http://image.tmdb.org/t/p/w92/"
    let movie = "movie/"
    let topRated = "top_rated"
    let apiKeyTitle = "api_key"
    let apiKeyValue = "99602a08ae69e3b5e73f8e69ca38d3a1"
    
    private init() {
        
    }
    
}
