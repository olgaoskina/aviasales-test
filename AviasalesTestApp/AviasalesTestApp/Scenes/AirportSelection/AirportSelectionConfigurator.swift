//
//  AirportSelectionConfigurator.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 20.07.2021.
//

import Foundation

protocol Configurator {
    func configure(viewController: AirportSelectionViewController)
}

class AirportSelectionConfigurator: Configurator {
    func configure(viewController: AirportSelectionViewController) {
        let interactor = AirportSelectionInteractor()
        let presenter = AirportSelectionPresenter()
        let router = AirportSelectionRouter()
        
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        viewController.interactor = interactor
        viewController.router = router
        
        router.viewController = viewController
        router.dataStore = interactor
    }
}
