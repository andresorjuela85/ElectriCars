//
//  CarsViewModel.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 28/07/22.
//

import Foundation

protocol CarsViewModelDelegate {
    
    var cars: [CarListQuery.Data.CarList?] { get set }
    
    func loadCars()
    
}

class CarsViewModel: CarsViewModelDelegate {
    
    var coordinator: CarsCoordinator
    
    var cars = [CarListQuery.Data.CarList?]()
    
    var viewController: CarsViewControllerDelegate
    
    init(coordinator: CarsCoordinator, viewController: CarsViewControllerDelegate) {
        self.coordinator = coordinator
        self.viewController = viewController
    }
    

    func goToDetail(car: CarListQuery.Data.CarList?) {
        coordinator.showDetail(car: car)
        
    }
    
    func loadCars() {
        
        Network.shared.apollo.fetch(query: CarListQuery(size: 30)) { result in
            
            switch result {
            case .success(let graphQLResult):
                if let carConnection = graphQLResult.data?.carList {

                    self.cars = carConnection
                    self.viewController.reloadTable()
                }
                
            case .failure(let error):
                
                print("Error: \(error)")
            }
        }
        
    }
}