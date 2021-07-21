//
//  DottedPolylineRenderer.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 21.07.2021.
//

import MapKit

class DottedPolylineRenderer: MKPolylineRenderer {
    override init(polyline: MKPolyline) {
        super.init(polyline: polyline)
        setup()
    }
    
    override init(overlay: MKOverlay) {
        super.init(overlay: overlay)
        setup()
    }
    
    private func setup() {
        lineWidth = 5
        strokeColor = UIColor(named: "BlueColor")
        lineDashPattern = [1, 10]
    }
}

