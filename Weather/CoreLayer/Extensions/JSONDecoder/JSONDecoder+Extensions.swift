//
//  JSONDecoder+Extensions.swift
//  Weather
//
//  Created by Victor Shabanov on 06/02/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import Foundation
import Alamofire

extension JSONDecoder {
    
    func decodeResponse<T: Decodable>(from response: DataResponse<Data>) -> Result<T> {
        guard let responseData = response.data else {
            return .failure(ResponseError.unknown)
        }
        
        do {
            let item = try decode(T.self, from: responseData)
            return .success(item)
        } catch {
            return .failure(ResponseError.mapping)
        }
    }
}
