//
//  EmptyView.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 22.07.2021.
//

import UIKit

class EmptyView: UIView {
 
    lazy var infoLabel: UILabel = {
        let infoLabel = UILabel()
        infoLabel.text = "Data not found"
        infoLabel.textAlignment = .center
        infoLabel.font = UIFont.systemFont(ofSize: 17)
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        return infoLabel
    }()
    
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        addSubview(infoLabel)
            
        infoLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        infoLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        infoLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        infoLabel.heightAnchor.constraint(equalToConstant: 34).isActive = true
    }
}
