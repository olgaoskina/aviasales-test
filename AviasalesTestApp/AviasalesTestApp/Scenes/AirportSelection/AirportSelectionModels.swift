//
//  AirportSelectionModels.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 20.07.2021.
//

import Foundation

struct AirportSelectionModels {
    struct FetchAirports {
        struct Request {
            let term: String
        }
        
        struct Response {
            let airports: [Airport]
        }
        
        struct ViewModel {
            let airports: [Airport]
        }
    }
}
