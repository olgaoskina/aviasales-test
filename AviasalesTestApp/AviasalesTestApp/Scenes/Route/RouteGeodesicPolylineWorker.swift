//
//  RouteGeodesicPolylineWorker.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 21.07.2021.
//

import MapKit

class RouteGeodesicPolylineWorker: PolylineMaker {
    func make(with points: [CLLocationCoordinate2D]) -> MKPolyline {
        return MKGeodesicPolyline(coordinates: points, count: points.count)
    }
}
