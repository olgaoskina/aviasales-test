//
//  RouteViewController.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 20.07.2021.
//

import UIKit
import MapKit

protocol RouteDisplayLogic: AnyObject {
    func displayRoute(_ viewModel: RouteModels.FetchRoute.ViewModel)
}

class RouteViewController: UIViewController {
    var interactor: (RouteBusinessLogic & RouteDataStore)?
    var router: (RouteRoutingLogic & RouteDataPassing)?
    
    private let configurator = RouteConfigurator()
    
    @IBOutlet weak var mapView: MKMapView!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchRoute()
    }
    
    private func setup() {
        configurator.configure(viewController: self)
    }
    
    private func fetchRoute() {
        let request = RouteModels.FetchRoute.Request()
        interactor?.fetchRoute(request)
    }
}

extension RouteViewController: RouteDisplayLogic {
    func displayRoute(_ viewModel: RouteModels.FetchRoute.ViewModel) {
        // TODO: display route
    }
}
