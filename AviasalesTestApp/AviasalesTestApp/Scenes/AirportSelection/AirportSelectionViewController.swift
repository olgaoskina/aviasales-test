//
//  AirportSelectionViewController.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 20.07.2021.
//

import UIKit

protocol AirportSelectionDisplayLogic: AnyObject {
    func displayAirports(_ viewModel: AirportSelectionModels.FetchAirports.ViewModel)
}

class AirportSelectionViewController: UIViewController {
    var interactor: (AirportSelectionBusinessLogic & AirportSelectionDataStore)?
    var router: AirportSelectionRoutingLogic?
    
    private let configurator = AirportSelectionConfigurator()
    private var airports = [String]() {
        didSet {
            airportsTableView.refreshControl?.endRefreshing()
            airportsTableView.reloadData()
        }
    }
    
    @IBOutlet weak var airportsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(viewController: self)
        configureTableView()
        fetchAirports()
    }
    
    private func fetchAirports() {
        let request = AirportSelectionModels.FetchAirports.Request(name: "")
        interactor?.fetchAirports(request)
    }
}

extension AirportSelectionViewController: AirportSelectionDisplayLogic {
    func displayAirports(_ viewModel: AirportSelectionModels.FetchAirports.ViewModel) {
        airports = viewModel.airports
    }
}

// MARK: table view methods
extension AirportSelectionViewController: UITableViewDataSource, UITableViewDelegate {
    private func configureTableView() {
        airportsTableView.delegate = self
        airportsTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return airports.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let airportCell = tableView.dequeueReusableCell(withIdentifier: "AirportTableViewCell") {
            airportCell.textLabel?.text = airports[indexPath.row]
            
            return airportCell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
