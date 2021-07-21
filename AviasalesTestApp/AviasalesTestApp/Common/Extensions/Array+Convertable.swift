//
//  Array+Convertable.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 21.07.2021.
//

import Foundation

extension Array: DTOToDomainConvertable where Element: DTOToDomainConvertable {
    typealias DomainType = [Element.DomainType]
    
    func convert() -> DomainType {
        return self.map { $0.convert() }
    }
}
