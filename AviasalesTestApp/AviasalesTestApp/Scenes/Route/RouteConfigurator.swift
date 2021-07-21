//
//  RouteConfigurator.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 20.07.2021.
//

import Foundation

class RouteConfigurator {
    func configure(viewController: RouteViewController) {
        let interactor = RouteInteractor()
        let presenter = RoutePresenter()
        let router = RouteRouter()
        let polylineMaker = RouteGeodesicPolylineWorker()
        
        interactor.presenter = presenter
        presenter.viewController = viewController
        presenter.polylineMaker = polylineMaker
        
        viewController.interactor = interactor
        viewController.router = router
        
        router.viewController = viewController
        router.dataStore = interactor
    }
}
