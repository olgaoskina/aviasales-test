//
//  RouteInteractor.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 20.07.2021.
//

import Foundation

protocol RouteBusinessLogic {
    func fetchRoute(_ request: RouteModels.FetchRoute.Request)
}

protocol RouteDataStore {
    var airport: Airport? { get set }
    var route: String { get }
}

class RouteInteractor: RouteBusinessLogic, RouteDataStore  {
    var airport: Airport?
    var route: String = ""
    var presenter: RoutePresentationLogic?
    
    func fetchRoute(_ request: RouteModels.FetchRoute.Request) {
        self.route = "Route"
        let response = RouteModels.FetchRoute.Response(route: route)
        self.presenter?.presentRoute(response)
    }
}
