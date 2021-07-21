//
//  AirportTableViewCell.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 21.07.2021.
//

import UIKit

class AirportTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var iataLabel: UILabel!
    
    func configure(with airport: Airport) {
        let title = airport.airportName == nil ? airport.name : airport.airportName
        let description = airport.airportName == nil ? nil : airport.name
        
        titleLabel.text = title
        descriptionLabel.text = description
        iataLabel.text = airport.iata
    }
}
