//
//  RouteViewController.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 20.07.2021.
//

import UIKit
import MapKit

protocol RouteDisplayLogic: AnyObject {
    func displayRoute(_ viewModel: RouteModels.GenerateRoute.ViewModel)
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
        
        mapView.delegate = self
        mapView.register(PointAnnotationView.self, forAnnotationViewWithReuseIdentifier: PointAnnotationView.reuseIdentifier)
        mapView.register(PlaneAnnotationView.self, forAnnotationViewWithReuseIdentifier: PlaneAnnotationView.reuseIdentifier)
        
        fetchRoute()
    }
    
    private func setup() {
        configurator.configure(viewController: self)
    }
    
    private func fetchRoute() {
        let request = RouteModels.GenerateRoute.Request()
        interactor?.fetchRoute(request)
    }
}

extension RouteViewController: RouteDisplayLogic {
    func displayRoute(_ viewModel: RouteModels.GenerateRoute.ViewModel) {
        mapView.addAnnotations([viewModel.route.startAnnotation, viewModel.route.finishAnnotation])
        mapView.fit(annotations: mapView.annotations)
        
        if let polyline = viewModel.polyline {
            mapView.addOverlay(polyline)
            mapView.addAnnotation(PlaneAnnotation(coordinates: polyline.coordinates,
                                                  mapView: mapView))
        }
    }
}

extension RouteViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is AirportAnnotation {
            var airportView = mapView.dequeueReusableAnnotationView(
                withIdentifier: PointAnnotationView.reuseIdentifier,
                for: annotation
            )
            airportView = PointAnnotationView(annotation: annotation,
                                              reuseIdentifier: PointAnnotationView.reuseIdentifier)
            return airportView
        }
        if let planeAnnotation = annotation as? PlaneAnnotation {
            var airportView = mapView.dequeueReusableAnnotationView(
                withIdentifier: PlaneAnnotationView.reuseIdentifier,
                for: planeAnnotation
            )
            airportView = PlaneAnnotationView(annotation: planeAnnotation,
                                              reuseIdentifier: PlaneAnnotationView.reuseIdentifier)
            return airportView
        }
        
        return MKAnnotationView()
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        return DottedPolylineRenderer(overlay: overlay)
    }
}
