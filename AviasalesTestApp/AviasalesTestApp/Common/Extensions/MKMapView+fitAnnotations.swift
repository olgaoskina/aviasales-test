//
//  MKMapView+fitAnnotations.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 21.07.2021.
//

import MapKit

extension MKMapView {
    func fit(annotations: [MKAnnotation]) {
        var mapRect: MKMapRect  = .null
        
        for annotation in annotations {
            let annotationCoordinates = MKMapPoint(annotation.coordinate)
            let annotationRect = MKMapRect(x: annotationCoordinates.x,
                                 y: annotationCoordinates.y,
                                 width: 0.1,
                                 height: 0.1)
            
            mapRect = mapRect.isNull ? annotationRect : mapRect.union(annotationRect)
        }
        
        setVisibleMapRect(mapRect, edgePadding: UIEdgeInsets(top: 100, left: 100, bottom: 100, right: 100), animated: true)
    }
}
