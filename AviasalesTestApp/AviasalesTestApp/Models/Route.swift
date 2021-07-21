//
//  Route.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 21.07.2021.
//

import Foundation

struct Route {
    let startPoint: MapPoint
    let finishPoint: MapPoint
}

extension Route {
    static let emptyRoute = {
        return Route(startPoint: MapPoint(title: "", location: Location(lon: 0, lat: 0)),
                     finishPoint: MapPoint(title: "", location: Location(lon: 0, lat: 0)))
    }()
}
