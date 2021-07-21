//
//  CLLocationCoordinate2D.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 21.07.2021.
//

import CoreLocation

extension CLLocationCoordinate2D {
    func bearing(to point2: CLLocationCoordinate2D) -> Double {
        let point1 = self
        
        let lat1 = point1.latitude.toRadians()
        let lon1 = point1.longitude.toRadians()

        let lat2 = point2.latitude.toRadians()
        let lon2 = point2.longitude.toRadians()

        let dLon = lon2 - lon1

        let y = sin(dLon) * cos(lat2)
        let x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dLon)
        let radiansBearing = atan2(y, x)

        return radiansBearing - Double.pi / 2
    }
}
