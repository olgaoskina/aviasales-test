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
        let imageView = UIImageView(image: UIImage(named: "plane"))
        
        // make image view center at (0, 0)
        imageView.frame = CGRect(x: -imageView.frame.width / 2,
                                 y: -imageView.frame.height / 2,
                                 width: imageView.frame.width,
                                 height: imageView.frame.height)
        
        return imageView
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
