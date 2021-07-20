//
//  AirportSelectionRouter.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 20.07.2021.
//

import Foundation

protocol AirportSelectionRoutingLogic {
}

protocol AirportSelectionDataPassing {
    var dataStore: AirportSelectionDataStore? { get }
}

class AirportSelectionRouter: AirportSelectionRoutingLogic, AirportSelectionDataPassing {
    weak var viewController: AirportSelectionViewController?
    var dataStore: AirportSelectionDataStore?

}
