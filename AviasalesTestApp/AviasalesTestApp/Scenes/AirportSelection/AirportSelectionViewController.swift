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

class AirportSelectionViewController: UIViewController, KeyboardObserver {
    var interactor: (AirportSelectionBusinessLogic & AirportSelectionDataStore)?
    var router: AirportSelectionRoutingLogic?
    
    private let configurator = AirportSelectionConfigurator()
    private var airports = [Airport]() {
        didSet {
            airportsTableView.showEmptyViewIfNeed(airports.count)
            airportsTableView.refreshControl?.endRefreshing()
            airportsTableView.reloadData()
        }
    }
    
    @IBOutlet weak var airportsTableView: UITableView!
    
    @objc private func fetchAirports(with term: String = "") {
        let request = AirportSelectionModels.FetchAirports.Request(term: term)
        interactor?.fetchAirports(request)
    }
}

extension AirportSelectionViewController: Refreshable {
    func refresh() {
        let query = navigationItem.searchController?.searchBar.text ?? ""
        fetchAirports(with: query)
    }
}

extension AirportSelectionViewController: AirportSelectionDisplayLogic {
    func displayAirports(_ viewModel: AirportSelectionModels.FetchAirports.ViewModel) {
        airports = viewModel.airports
    }
}

// MARK: view controller methods
extension AirportSelectionViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(viewController: self)
        configureTableView()
        configureSearchController()
        fetchAirports()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addKeyboardObserver()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeKeyboardObserver()
    }
}

// MARK: table view methods
extension AirportSelectionViewController: UITableViewDataSource, UITableViewDelegate {
    private func configureTableView() {
        airportsTableView.delegate = self
        airportsTableView.dataSource = self
        addRefreshControl(to: airportsTableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return airports.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let airportCell = tableView.dequeueReusableCell(withIdentifier: "AirportTableViewCell") as? AirportTableViewCell {
            airportCell.configure(with: airports[indexPath.row])
            
            return airportCell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        router?.routeToRouteScene(at: indexPath)
    }
}

// MARK: search controller methods
extension AirportSelectionViewController: UISearchResultsUpdating {
    
    private func configureSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search airport"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchQuery = searchController.searchBar.text
        
        // fetch airports only after delay
        NSObject.cancelPreviousPerformRequests(withTarget: self)
        self.perform(#selector(fetchAirports), with: searchQuery, afterDelay: 0.5)
    }
}
