//
//  LocationResult.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 21.07.2021.
//

import Foundation

struct LocationResult: Decodable {
    let lon: Double
    let lat: Double
}

extension LocationResult {
    enum CodingKeys: String, CodingKey {
        case lon
        case lat
    }
}

extension LocationResult: DTOToDomainConvertable {
    typealias DomainType = Location
    
    func convert() -> Location {
        return Location(lon: lon, lat: lat)
    }
}
