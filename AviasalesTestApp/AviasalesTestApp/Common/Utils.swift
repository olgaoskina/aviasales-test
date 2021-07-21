//
//  Utils.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 21.07.2021.
//

import Foundation

struct Utils {
    static let startAirport = spb
    
    static let spb = Airport(
        iata: "LED",
        countryIata: "RU",
        coordinates: [59.806084,
                      30.3083],
        airportName: "Пулково",
        location: Location(lon: 30.3083, lat: 59.806084),
        name: "Санкт-Петербург, Россия")
    
    static let sanFrancisco = Airport(
        iata: "SFO",
        countryIata: "US",
        coordinates: [37.615215,
                      -122.38988],
        airportName: "Сан-Франциско",
        location: Location(lon: -122.38988, lat: 37.615215),
        name: "Сан-Франциско, CA, США")
    
    static let sahalinsk = Airport(
        iata: "UUS",
        countryIata: "RU",
        coordinates: [46.966667, 142.75],
        airportName: "Южно-Сахалинск",
        location: Location(lon: 142.75, lat: 46.966667),
        name: "Южно-Сахалинск, Россия")
    
    static let reykyavik = Airport(
        iata: "REK",
        countryIata: "IS",
        coordinates: [59.806084,
                      30.3083],
        airportName: "Reykyavik",
        location: Location(lon: -21.89521, lat: 64.135338),
        name: "Reykyavik, Iceland")
}
