//
//  PlaneAnnotation.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 21.07.2021.
//

import MapKit

class PlaneAnnotation: MKPointAnnotation {
    private let coordinates: [CLLocationCoordinate2D]
    private var iterator: Array<CLLocationCoordinate2D>.Iterator
    private var animationTimer: Timer?
    private(set) weak var mapView: MKMapView?
    
    // map view is needed to link annotation and annotation view
    init(coordinates: [CLLocationCoordinate2D],
         mapView: MKMapView) {
        self.mapView = mapView
        self.coordinates = coordinates
        self.iterator = coordinates.makeIterator()
        super.init()
        animateRoute()
    }
    
    private func animateRoute() {
        // TODO: make apppearance
        animationTimer = Timer.scheduledTimer(withTimeInterval: 0.005,
                                              repeats: true) { [weak self] timer in
            guard let self = self else { return }
            guard let nextCoordinate = self.iterator.next() else {
                self.resetTimer()
                return
            }
            
            UIView.animate(withDuration: 0.005) {
                self.rotate(to: nextCoordinate)
                self.coordinate = nextCoordinate
            }
        }
    }
    
    private func rotate(to newCoordinate: CLLocationCoordinate2D) {
        let rotationAngle = atan2(newCoordinate.longitude - coordinate.longitude,
                                  newCoordinate.latitude - coordinate.latitude) - Double.pi / 2
        
        guard let annotationView = mapView?.view(for: self) else { return }
        annotationView.transform = CGAffineTransform(rotationAngle: CGFloat(rotationAngle))
    }
    
    private func resetTimer() {
        animationTimer?.invalidate()
    }
}
