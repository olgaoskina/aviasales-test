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
    var airports: [Airport] { get }
}

class AirportSelectionInteractor: AirportSelectionBusinessLogic, AirportSelectionDataStore  {
    var airports: [Airport] = []
    var presenter: AirportSelectionPresentationLogic?
    
    private let worker = AirportSelectionWorker()
    
    func fetchAirports(_ request: AirportSelectionModels.FetchAirports.Request) {
        let airportsParams = AirportsParams(term: request.term, locale: "ru") // TODO: what about locale?
        worker.fetchAirports(with: airportsParams) { result in
            switch result {
            case .success(let airports):
                self.success(airports)
            case .failure(_):
                self.failure()
            }
        }
    }
    
    private func success(_ airports: [Airport]) {
        self.airports = airports
        let response = AirportSelectionModels.FetchAirports.Response(airports: airports)
        self.presenter?.presentAirports(response)
    }
    
    private func failure() {
        // TODO: handle error
        self.airports = []
        let response = AirportSelectionModels.FetchAirports.Response(airports: airports)
        self.presenter?.presentAirports(response)
    }
}
