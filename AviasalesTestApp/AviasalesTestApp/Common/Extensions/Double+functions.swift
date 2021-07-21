//
//  Double+functions.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 21.07.2021.
//

import Foundation

extension Double {
    func toRadians() -> Double { return self * .pi / 180.0 }
    func toDegrees() -> Double { return self * 180.0 / .pi }
}
