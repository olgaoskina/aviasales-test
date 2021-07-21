//
//  RoutePresenter.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 20.07.2021.
//

import MapKit

protocol RoutePresentationLogic {
    func presentRoute(_ response: RouteModels.GenerateRoute.Response)
}

class RoutePresenter: RoutePresentationLogic {
    weak var viewController: RouteDisplayLogic?
    var polylineMaker: PolylineMaker?
    
    func presentRoute(_ response: RouteModels.GenerateRoute.Response) {
        let route = process(route: response.route)
        let polyline = polylineMaker?.make(with: [route.startAnnotation.coordinate, route.finishAnnotation.coordinate])
        let viewModel = RouteModels.GenerateRoute.ViewModel(route: route, polyline: polyline)
        viewController?.displayRoute(viewModel)
    }
    
    private func process(route: Route) -> MapRoute {
        let startAnnotation = AirportAnnotation()
        startAnnotation.title = route.startPoint.title
        startAnnotation.coordinate = CLLocationCoordinate2D(location: route.startPoint.location)
        startAnnotation.annotationProirity = .high
        
        let finishAnnotation = AirportAnnotation()
        finishAnnotation.title = route.finishPoint.title
        finishAnnotation.coordinate = CLLocationCoordinate2D(location: route.finishPoint.location)
        finishAnnotation.annotationProirity = .low
        
        return MapRoute(startAnnotation: startAnnotation, finishAnnotation: finishAnnotation)
    }
}
