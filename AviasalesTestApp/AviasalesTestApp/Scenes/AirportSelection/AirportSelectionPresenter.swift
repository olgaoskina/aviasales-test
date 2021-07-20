//
//  AirportSelectionPresenter.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 20.07.2021.
//

import Foundation

protocol AirportSelectionPresentationLogic {
    func presentAirports(_ response: AirportSelectionModels.FetchAirports.Response)
}

class AirportSelectionPresenter: AirportSelectionPresentationLogic {
    weak var viewController: AirportSelectionDisplayLogic?
    
    func presentAirports(_ response: AirportSelectionModels.FetchAirports.Response) {
        let airports = process(airports: response.airports)
        let viewModel = AirportSelectionModels.FetchAirports.ViewModel(airports: airports)
        viewController?.displayAirports(viewModel)
    }
    
    private func process(airports: [String]) -> [String] {
        return airports.map { $0.uppercased() }
    }
}
