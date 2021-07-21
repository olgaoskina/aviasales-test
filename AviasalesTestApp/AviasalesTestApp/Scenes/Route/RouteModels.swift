//
//  RouteModels.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 20.07.2021.
//

import Foundation

struct RouteModels {
    struct GenerateRoute {
        struct Request {
        }
        
        struct Response {
            let route: Route
        }
        
        struct ViewModel {
            let route: MapRoute
        }
    }
}
