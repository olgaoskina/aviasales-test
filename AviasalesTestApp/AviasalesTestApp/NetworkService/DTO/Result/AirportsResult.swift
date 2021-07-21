//
//  AirportsResult.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 21.07.2021.
//

import Foundation

struct AirportsResult: Decodable {
    let iata: String
    let countryIata: String
    let coordinates: [Double]
    let airportName: String?
    let location: LocationResult
    let name: String
}

extension AirportsResult {
    enum CodingKeys: String, CodingKey {
        case iata
        case countryIata = "country_iata"
        case coordinates
        case airportName = "airport_name"
        case location
        case name
    }
}

extension AirportsResult: DTOToDomainConvertable {
    typealias DomainType = Airport
    
    func convert() -> Airport {
        return Airport(
            iata: iata,
            countryIata: countryIata,
            coordinates: coordinates,
            airportName: airportName,
            location: location.convert(),
            name: name)
    }
}
