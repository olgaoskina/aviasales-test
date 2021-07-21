//
//  Utils.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 21.07.2021.
//

import Foundation

struct Utils {
    static let startAirport = Airport(
        iata: "LED",
        countryIata: "RU",
        coordinates: [59.806084,
                      30.3083],
        airportName: "Пулково",
        location: Location(lon: 30.3083, lat: 59.806084),
        name: "Санкт-Петербург, Россия")
}
