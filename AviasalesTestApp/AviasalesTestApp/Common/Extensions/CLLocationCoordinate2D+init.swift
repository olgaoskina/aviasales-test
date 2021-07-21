//
//  CLLocationCoordinate2D+init.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 21.07.2021.
//

import CoreLocation

extension CLLocationCoordinate2D {
    init(location: Location) {
        self.init(latitude: location.lat, longitude: location.lon)
    }
}
