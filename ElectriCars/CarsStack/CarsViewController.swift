//
//  CarsViewController.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 28/07/22.
//

import UIKit

protocol CarsViewControllerDelegate {
    
    func reloadTable()
}

final class CarsViewController: UIViewController {
    
    var viewModel: CarsViewModel?
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInterface()
        viewModel?.loadCars()
        setupTable()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func setupInterface() {
        
        navigationItem.title = "ElectriCars"
    }
    
    func setupTable() {
        
        tableView.frame = view.bounds
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CarsTableViewCell.self, forCellReuseIdentifier: CarsTableViewCell.identifier)
    }
    
}

extension CarsViewController: CarsViewControllerDelegate {
    
    func reloadTable() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

//MARK: Table configuration

extension CarsViewController: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel?.cars.count ?? 0
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        viewModel?.goToDetail(car: (viewModel?.cars[indexPath.row])!)
    }
}

extension CarsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CarsTableViewCell.identifier, for: indexPath) as? CarsTableViewCell else {
            return UITableViewCell()
        }
        cell.car = viewModel?.cars[indexPath.row]
        
        return cell
    }
}


