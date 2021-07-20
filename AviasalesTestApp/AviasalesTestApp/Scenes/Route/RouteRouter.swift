//
//  RouteRouter.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 20.07.2021.
//

import Foundation

protocol RouteRoutingLogic {
}

protocol RouteDataPassing {
    var dataStore: RouteDataStore? { get }
}

class RouteRouter: RouteRoutingLogic, RouteDataPassing {
    weak var viewController: RouteViewController?
    var dataStore: RouteDataStore?

}
