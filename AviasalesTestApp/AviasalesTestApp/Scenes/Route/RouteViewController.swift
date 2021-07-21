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
        mapView.register(AirportAnnotationView.self, forAnnotationViewWithReuseIdentifier: AirportAnnotationView.reuseIdentifier)
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
                                                  delegate: self))
        }
    }
}

extension RouteViewController: PlaneAnnotationDelegate {
    func rotate(annotation: MKAnnotation, to angle: CGFloat) {
        guard let annotationView = mapView.view(for: annotation) else { return }
        annotationView.transform = CGAffineTransform(rotationAngle: angle)
    }
    
    func remove(annotation: MKAnnotation) {
        mapView.removeAnnotation(annotation)
    }
}

extension RouteViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is AirportAnnotation {
            var airportView = mapView.dequeueReusableAnnotationView(
                withIdentifier: AirportAnnotationView.reuseIdentifier,
                for: annotation
            )
            airportView = AirportAnnotationView(annotation: annotation,
                                              reuseIdentifier: AirportAnnotationView.reuseIdentifier)
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
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        for view in views {
            if let viewWithPriority = view as? HaveAnnotationProirity {
                view.layer.zPosition = viewWithPriority.annotationProirity.rawValue
            }
        }
    }
}
