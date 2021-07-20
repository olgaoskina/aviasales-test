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
        airports = [
            "airport 1",
            "airport 2",
            "airport 3",
            "airport 4",
            "airport 5",
            "airport 6",
            "airport 7",
            "airport 8",
            "airport 9",
            "airport 10",
            "airport 11",
            "airport 12",
            "airport 13",
            "airport 14",
            "airport 15",
        ]
        
        if let searchAirportName = request.name {
            airports = airports.filter { $0.lowercased().contains(searchAirportName.lowercased()) }
        }
        
        let response = AirportSelectionModels.FetchAirports.Response(airports: airports)
        self.presenter?.presentAirports(response)
    }
}
