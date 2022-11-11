//
//  StationsViewController.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 28/07/22.
//

import UIKit

protocol StationViewControllerDelegate {
    
    func reloadTable()
}

final class StationsViewController: UIViewController {
    
    var viewModel: StationsViewModel?
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupInterface()
        viewModel?.loadStations()
        setupTable()
    }
    
    func setupInterface() {
        
        navigationItem.title = "TABBAR_OPTION_NAME_STATIONS".localized()
    }
    
    func setupTable () {
        
        tableView.frame = view.bounds
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(StationsTableViewCell.self, forCellReuseIdentifier: StationsTableViewCell.identifier)
    }
}

extension StationsViewController: StationViewControllerDelegate {
    
    func reloadTable() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

//MARK: Table configuration

extension StationsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.stations.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.goToDetail(station: (viewModel?.stations[indexPath.row])!)
    }
    
}

extension StationsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StationsTableViewCell.identifier, for: indexPath) as? StationsTableViewCell else {
            return UITableViewCell()
        }
        
        cell.station = viewModel?.stations[indexPath.row]
        return cell
    }
}


