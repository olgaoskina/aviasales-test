//
//  PolylineMaker.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 21.07.2021.
//

import MapKit

protocol PolylineMaker {
    func make(with points: [CLLocationCoordinate2D]) -> MKPolyline
}
