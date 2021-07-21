//
//  RouteWavePolylineWorker.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 22.07.2021.
//

import MapKit

class RouteWavePolylineWorker: PolylineMaker {
    func make(with points: [CLLocationCoordinate2D]) -> MKPolyline {
        guard points.count == 2 else { fatalError("Not implemented for \(points.count) points") }
        
        var pointsOnWave: [CLLocationCoordinate2D] = []
        
        let point1 = points[0]
        let point2 = points[1]
        
        let dx = point2.longitude - point1.longitude
        let dy = point2.latitude - point1.latitude
        let d = sqrt(dx * dx + dy * dy)
        let a = atan2(dy, dx)
        let cosa = cos(a)
        let sina = sin(a)
        
        let nPoints = 1000
        
        for t in 0 ... nPoints {
            let tx = CGFloat(t) / CGFloat(nPoints)
            let ty = 0.1 * sin(tx * 2 * CGFloat.pi)
            let x = point1.longitude + d * (Double(tx) * cosa - Double(ty) * sina)
            let y = point1.latitude + d * (Double(tx) * sina + Double(ty) * cosa)
            let newPoint = CLLocationCoordinate2D(latitude: y, longitude: x)

            pointsOnWave.append(newPoint)
        }
        
        return MKPolyline(coordinates: pointsOnWave, count: pointsOnWave.count)
    }
}
