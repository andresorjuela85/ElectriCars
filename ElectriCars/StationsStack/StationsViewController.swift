//
//  StationsViewController.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 28/07/22.
//

import UIKit

protocol StationcViewControllerDelegate {
    
    func reloadTable()
}


class StationsViewController: UIViewController {

    var viewModel: StationsViewModel?
    
    let tableView = UITableView()
    

    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .orange
        
        viewModel?.loadStations()
        
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(StationsTableViewCell.self, forCellReuseIdentifier: StationsTableViewCell.identifier)
        
        navigationItem.title = "Station"
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}


extension StationsViewController: UITableViewDelegate {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.station.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.goToDetail(station: viewModel?.station[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension StationsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StationsTableViewCell.identifier, for: indexPath) as? StationsTableViewCell else {
            return UITableViewCell()
        }
        
        cell.station = viewModel?.station[indexPath.row]
        return cell
    }
}

extension StationsViewController: StationcViewControllerDelegate {
    
    func reloadTable() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
