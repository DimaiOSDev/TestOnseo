//
//  MovieRequests.swift
//  TestOnseo
//
//  Created by Дмитро Мостовий on 04.07.2020.
//  Copyright © 2020 Дмитро Мостовий. All rights reserved.
//

import Foundation
import Alamofire

class MovieRequests: RestClient {
    
    func getMovies(page: Int, resp: @escaping IdResponseBlock) {
        let url = ApiSettings.shared.baseURL + ApiSettings.shared.movie + ApiSettings.shared.topRated
        let params: [String : Any] = ["page" : page]
        http.queryByApiKey(url, method: .get, parameters: params, queue: .defaultQos) { (data, error) in
            self.response(data, error, modelCls: MoviesResponse.self, resp: resp)
        }
    }
    
    func getMovie(id: Int, resp: @escaping IdResponseBlock) {
        let url = ApiSettings.shared.baseURL + ApiSettings.shared.movie + String(id)
        http.queryByApiKey(url, queue: .defaultQos) { (data, error) in
            self.response(data, error, modelCls: MovieResponse.self, resp: resp)
        }
    }
}
