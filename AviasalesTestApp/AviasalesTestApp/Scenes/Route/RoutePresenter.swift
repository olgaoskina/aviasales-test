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
    
    func presentRoute(_ response: RouteModels.GenerateRoute.Response) {
        let route = process(route: response.route)
        let viewModel = RouteModels.GenerateRoute.ViewModel(route: route)
        viewController?.displayRoute(viewModel)
    }
    
    private func process(route: Route) -> MapRoute {
        let startAnnotation = MKPointAnnotation()
        startAnnotation.title = route.startPoint.title
        startAnnotation.coordinate = CLLocationCoordinate2D(location: route.startPoint.location)
        
        let finishAnnotation = MKPointAnnotation()
        finishAnnotation.title = route.finishPoint.title
        finishAnnotation.coordinate = CLLocationCoordinate2D(location: route.finishPoint.location)
        
        return MapRoute(startAnnotation: startAnnotation, finishAnnotation: finishAnnotation)
    }
}
