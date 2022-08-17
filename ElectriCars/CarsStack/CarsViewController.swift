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

class CarsViewController: UIViewController {
    
    var viewModel: CarsViewModel?
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .black
       
        viewModel?.loadCars()
        
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CarsTableViewCell.self, forCellReuseIdentifier: CarsTableViewCell.identifier)
        
        view.backgroundColor = .red

        navigationItem.title = "ElectriCars"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = CGRect(x: 0, y: 90, width: view.frame.width, height: view.frame.height - 90)
    }
    
}

extension CarsViewController: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel?.cars.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        viewModel?.goToDetail(car: viewModel?.cars[indexPath.row])
    }
}

extension CarsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CarsTableViewCell.identifier, for: indexPath) as? CarsTableViewCell else {
            return UITableViewCell()
        }
        cell.cars = viewModel?.cars[indexPath.row]

        return cell
        
    }
}

extension CarsViewController: CarsViewControllerDelegate {
    
    func reloadTable() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}