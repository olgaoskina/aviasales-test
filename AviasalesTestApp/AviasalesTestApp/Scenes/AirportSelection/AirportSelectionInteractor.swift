//
//  AirportSelectionInteractor.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 20.07.2021.
//

import Foundation

protocol AirportSelectionBusinessLogic {
    func fetchAirports(_ request: AirportSelectionModels.FetchAirports.Request)
}

protocol AirportSelectionDataStore {
    var airports: [String] { get }
}

class AirportSelectionInteractor: AirportSelectionBusinessLogic, AirportSelectionDataStore  {
    var airports: [String] = []
    var presenter: AirportSelectionPresentationLogic?
    
    func fetchAirports(_ request: AirportSelectionModels.FetchAirports.Request) {
        self.airports = [
            "airport 1",
            "airport 2",
            "airport 3",
            "airport 4",
            "airport 5",
        ]
        let response = AirportSelectionModels.FetchAirports.Response(airports: airports)
        self.presenter?.presentAirports(response)
    }
}
