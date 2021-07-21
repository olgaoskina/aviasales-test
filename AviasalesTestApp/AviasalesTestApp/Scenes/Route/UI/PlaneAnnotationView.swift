//
//  PlaneAnnotationView.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 21.07.2021.
//

import MapKit

class PlaneAnnotationView: MKAnnotationView {
    
    static let reuseIdentifier = "PlaneAnnotationView"
    
    private lazy var planeImageView: UIImageView = {
        return UIImageView(image: UIImage(named: "plane"))
    }()
    
    // MARK: Initialization
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(planeImageView)
    }
}
