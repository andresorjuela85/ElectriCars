//
//  CarsViewModel.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 28/07/22.
//

import Foundation

protocol CarsViewModelDelegate {
    
    var cars: [Car] { get set }
    
    func loadCars()
    func goToDetail(car: Car)
}

final class CarsViewModel: CarsViewModelDelegate {
    
    var coordinator: CarsCoordinator
    
    var cars: [Car] = []
    
    var viewController: CarsViewControllerDelegate
    
    let service = Services(network: Network())
    
    init(`let` coordinator: CarsCoordinator, `let` viewController: CarsViewControllerDelegate) {
        self.coordinator = coordinator
        self.viewController = viewController
    }
    
    func goToDetail(car: Car) {
        coordinator.showDetail(car: car)
    }
    
    func loadCars() {
        
        service.getCars { carsReceived in
            
            self.cars = carsReceived
            self.viewController.reloadTable()
        }
    }
}
