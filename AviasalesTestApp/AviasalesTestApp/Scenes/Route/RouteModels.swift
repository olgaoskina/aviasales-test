//
//  RouteModels.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 20.07.2021.
//

import Foundation

struct RouteModels {
    struct FetchRoute {
        struct Request {
        }
        
        struct Response {
            let route: String
        }
        
        struct ViewModel {
            let route: String
        }
    }
}
