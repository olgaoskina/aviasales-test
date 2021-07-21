//
//  DTOToDomainConvertable.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 21.07.2021.
//

import Foundation


protocol DTOToDomainConvertable {
    associatedtype DomainType
    func convert() -> DomainType
}
