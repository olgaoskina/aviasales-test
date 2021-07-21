//
//  MKMultiPoint+Coordinates.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 21.07.2021.
//

import MapKit

extension MKMultiPoint {
   var coordinates: [CLLocationCoordinate2D] {
       var coords = [CLLocationCoordinate2D](repeating: kCLLocationCoordinate2DInvalid,
                                             count: pointCount)

       getCoordinates(&coords, range: NSRange(location: 0, length: pointCount))

       return coords
   }
}
