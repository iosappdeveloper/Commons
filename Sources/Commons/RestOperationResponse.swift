//
//  RestOperationResponse.swift
//  Commons
//
//  Created by Matoria, Ashok on 27/08/18.
//  Copyright © 2018 Matoria, Ashok. All rights reserved.
//

import Foundation

/// Generic type to capture API response. Typically REST API response is structured in a certain way.
/// Here T could be custom or primary object, a collection of custom or primary object or even Void type (if null or to avoid parsing).
public struct RestOperationResponse<T: Decodable>: Decodable {
    public let restOperationStatusVOX: RestOperationStatusVOX<T>
    
    public struct RestOperationStatusVOX<T: Decodable>: Decodable {
        public let data: Data<T>
        
        public struct Data<T: Decodable>: Decodable {
            public let restReturnData: T?
            
            enum CodingKeys: String, CodingKey {
                case restReturnData = "REST_RETURN_DATA"
            }
        }
    }
}
