//
//  AirportSelectionRouter.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 20.07.2021.
//

import Foundation

protocol AirportSelectionRoutingLogic {
    func routeToRouteScene(at indexPath: IndexPath)
}

protocol AirportSelectionDataPassing {
    var dataStore: AirportSelectionDataStore? { get }
}

class AirportSelectionRouter: AirportSelectionRoutingLogic, AirportSelectionDataPassing {
    weak var viewController: AirportSelectionViewController?
    var dataStore: AirportSelectionDataStore?

    func routeToRouteScene(at indexPath: IndexPath) {
        guard
            let viewController = viewController,
            let airportSelectionDataStore = dataStore,
            let storyboard = viewController.storyboard,
            let routeViewController = storyboard.instantiateViewController(withIdentifier: "RouteViewController") as? RouteViewController,
            var routeDataSource = routeViewController.router?.dataStore
        else { fatalError("Fail route to route scene") }
        
        passData(source: airportSelectionDataStore, at: indexPath, destination: &routeDataSource)
        navigate(source: viewController, destination: routeViewController)
    }
    
    private func navigate(source: AirportSelectionViewController, destination: RouteViewController) {
        source.navigationController?.pushViewController(destination, animated: true)
    }
    
    private func passData(source: AirportSelectionDataStore, at indexPath: IndexPath, destination: inout RouteDataStore) {
        destination.airport = source.airports[indexPath.row]
    }
}
