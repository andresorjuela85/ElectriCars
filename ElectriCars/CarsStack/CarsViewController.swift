//
//  CarsViewController.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 28/07/22.
//

import UIKit
import Combine

final class CarsViewController: UIViewController {
    
    var viewModel: CarsViewModel?
    
    private var subscriptions = Set<AnyCancellable>()
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        setupInterface()
        setupTable()
    }
    
    override func loadView() {
        super.loadView()
        tableView.frame = view.bounds
        view.addSubview(tableView)
    }
    
    func setupBindings() {
        viewModel?.$cars
            .receive(on: DispatchQueue.main)
            .sink { _ in
                self.tableView.reloadData()
            }
            .store(in: &subscriptions)
    }
    
    func setupInterface() {
        
        navigationItem.title = "TABBAR_OPTION_NAME_CARS".localized()
    }
    
    func setupTable() {

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CarsTableViewCell.self, forCellReuseIdentifier: CarsTableViewCell.identifier)
    }
    
}

//MARK: Table configuration

extension CarsViewController: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel?.cars.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
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


