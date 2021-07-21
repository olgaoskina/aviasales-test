//
//  AirportsParams.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 21.07.2021.
//

import Foundation

struct AirportsParams: Encodable {
    let term: String
    let locale: String
    
    func toDictionary() -> [String: Any] {
        var result: [String: Any] = [:]
        result["term"] = term
        result["locale"] = locale
        return result
    }
}
