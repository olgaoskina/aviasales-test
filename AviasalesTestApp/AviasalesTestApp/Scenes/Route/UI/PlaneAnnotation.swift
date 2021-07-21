//
//  PlaneAnnotation.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 21.07.2021.
//

import MapKit

protocol PlaneAnnotationDelegate: AnyObject {
    func rotate(annotation: MKAnnotation, to angle: CGFloat)
    func remove(annotation: MKAnnotation)
}

class PlaneAnnotation: MKPointAnnotation, HaveAnnotationProirity {
    private let coordinates: [CLLocationCoordinate2D]
    private var iterator: Array<CLLocationCoordinate2D>.Iterator
    private var animationTimer: Timer?
    
    var annotationProirity: AnnotationProirity = .regular
    weak var delegate: PlaneAnnotationDelegate?
    
    // map view is needed to link annotation and annotation view
    init(coordinates: [CLLocationCoordinate2D],
         delegate: PlaneAnnotationDelegate) {
        self.coordinates = coordinates
        self.delegate = delegate
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
                self.delegate?.remove(annotation: self)
                return
            }

            UIView.animate(withDuration: 0.005) {
                self.rotate(to: nextCoordinate)
                self.coordinate = nextCoordinate
            }
        }
    }
    
    private func rotate(to newCoordinate: CLLocationCoordinate2D) {
        let rotationAngle = coordinate.bearing(to: newCoordinate)
        
        delegate?.rotate(annotation: self, to: CGFloat(rotationAngle))
    }
    
    private func resetTimer() {
        animationTimer?.invalidate()
    }
}
