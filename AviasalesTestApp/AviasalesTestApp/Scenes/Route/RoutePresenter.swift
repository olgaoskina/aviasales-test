//
//  RoutePresenter.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 20.07.2021.
//

import Foundation

protocol RoutePresentationLogic {
    func presentRoute(_ response: RouteModels.FetchRoute.Response)
}

class RoutePresenter: RoutePresentationLogic {
    weak var viewController: RouteDisplayLogic?
    
    func presentRoute(_ response: RouteModels.FetchRoute.Response) {
        let route = process(route: response.route)
        let viewModel = RouteModels.FetchRoute.ViewModel(route: route)
        viewController?.displayRoute(viewModel)
    }
    
    private func process(route: String) -> String {
        return route.uppercased()
    }
}
