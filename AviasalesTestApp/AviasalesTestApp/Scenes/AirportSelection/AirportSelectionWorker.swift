//
//  AirportSelectionWorker.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 21.07.2021.
//

import Alamofire

class AirportSelectionWorker {
    private let networkWorker = NetworkWorker()
    
    private let airportsUrlString = "http://places.aviasales.ru/places"
    
    func fetchAirports(with params: AirportsParams,
                       completion: @escaping ((Result<[Airport], AFError>) -> Void)) {
        let request = RequestModel(url: airportsUrlString,
                                   method: .get,
                                   params: params.toDictionary())
        networkWorker.fetch(request,
                            of: [AirportsResult].self,
                            completion: completion)
    }
}
