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
            let name: String?
        }
        
        struct Response {
            let airports: [String]
        }
        
        struct ViewModel {
            let airports: [String]
        }
    }
}
