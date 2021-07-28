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
        
        
        
        
        
        let dx = calculateDelta(between: point1.longitude, and: point2.longitude)
        let dy = calculateDelta(between: point1.latitude, and: point2.latitude)
        
        let d = sqrt(dx * dx + dy * dy)
        let a = atan2(dy, dx)
        let cosa = cos(a)
        let sina = sin(a)
        
        let nPoints = 1000
        
        for t in 0 ... nPoints {
            let tx = CGFloat(t) / CGFloat(nPoints)
            let ty = 0.1 * sin(tx * 2 * CGFloat.pi)
            let x = reminder(point1.longitude + d * (Double(tx) * cosa - Double(ty) * sina))
            let y = reminder(point1.latitude + d * (Double(tx) * sina + Double(ty) * cosa))
            let newPoint = CLLocationCoordinate2D(latitude: y, longitude: x)

            pointsOnWave.append(newPoint)
        }
        
        return MKPolyline(coordinates: pointsOnWave, count: pointsOnWave.count)
    }
    
    private func calculateDelta(between point1: Double, and point2: Double) -> Double {
        guard point1.sign != point2.sign else {
            return point2 - point1
        }
        
        let positivePoint1 = point1.sign == .minus ? point1 + 360 : point1
        let positivePoint2 = point2.sign == .minus ? point2 + 360 : point2
        
        let dx = point2 - point1
        let dxPositive = positivePoint2 - positivePoint1
        
        let result = abs(dx) < abs(dxPositive) ? dx : dxPositive
          
        return result
    }
    
    private func reminder(_ value: Double) -> Double {
        let sign = copysign(1.0, value)
        
        if abs(value) >= 180 {
            return value + 360 * -sign
        }
        
        return value
    }
}
