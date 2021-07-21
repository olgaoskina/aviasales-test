//
//  RouteInteractor.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 20.07.2021.
//

import Foundation

protocol RouteBusinessLogic {
    func fetchRoute(_ request: RouteModels.GenerateRoute.Request)
}

protocol RouteDataStore {
    var startAirport: Airport? { get set }
    var finishAirport: Airport? { get set }
    var route: Route { get }
}

class RouteInteractor: RouteBusinessLogic, RouteDataStore  {
    var startAirport: Airport?
    var finishAirport: Airport?
    var route: Route = .emptyRoute
    
    var presenter: RoutePresentationLogic?
    
    func fetchRoute(_ request: RouteModels.GenerateRoute.Request) {
        guard let startAirport = startAirport,
              let finishAirport = finishAirport else {
            // TODO: handle error
            return
        }
        
        let startPoint = MapPoint(title: startAirport.iata, location: startAirport.location)
        let finishPoint = MapPoint(title: finishAirport.iata, location: finishAirport.location)
        
        route = Route(startPoint: startPoint, finishPoint: finishPoint)
        
        let response = RouteModels.GenerateRoute.Response(route: route)
        self.presenter?.presentRoute(response)
    }
}
