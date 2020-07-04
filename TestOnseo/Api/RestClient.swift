//
//  RestClient.swift
//  TestOnseo
//
//  Created by Дмитро Мостовий on 04.07.2020.
//  Copyright © 2020 Дмитро Мостовий. All rights reserved.
//

import Foundation
import Alamofire

class RestClient: NSObject {
    
    internal var http = HttpService()
    internal let baseUrl = ApiSettings.shared.baseURL
    
    let dataIsNil = CustomError.init(localizedDescription: "StringValue.Base.kOopsTryAgainLater.localized", code: 0)
    
    func response<T: Codable>(_ response: Any?, _ error: Error?, modelCls: T.Type, key: String? = nil, resp: @escaping IdResponseBlock) {
        
        if let err = error {
            return resp(nil, err)
        }
        
        guard let data = response as? Data else {
            return resp(nil, error)
        }
        
        
        if let product = try? JSONDecoder().decode(modelCls.self, from: data) {
            
            return resp(product, nil)
        } else {
            return resp(nil, self.dataIsNil)
        }
    }
    
    func cancellRequests() {
        http.cancellAllRequests()
    }
}
