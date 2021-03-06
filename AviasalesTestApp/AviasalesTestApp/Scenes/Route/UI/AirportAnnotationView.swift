//
//  AirportAnnotationView.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 21.07.2021.
//

import MapKit

class AirportAnnotationView: MKAnnotationView {
    
    static let reuseIdentifier = "AirportAnnotationView"
    
    private lazy var containerView: UIView = {
        // negative x and y are required for view center to be at (0, 0)
        let view = UIView(frame: CGRect(x: -50, y: -25, width: 100, height: 50))
        view.backgroundColor = .white
        view.layer.cornerRadius = 25.0
        view.layer.borderColor = UIColor(named: "BlueColor")?.cgColor
        view.layer.borderWidth = 5
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        label.text = annotation?.title ?? ""
        label.textColor = UIColor(named: "BlueColor")
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 21)
        return label
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
        containerView.addSubview(titleLabel)
        titleLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        
        addSubview(containerView)
    }
}
