//
//  CarsViewModel.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 28/07/22.
//

import Foundation
import Combine

protocol CarsViewModelDelegate {
    
    var cars: [Car] { get set }
    
    func loadCars()
    
    func goToDetail(car: Car)
}

final class CarsViewModel: CarsViewModelDelegate {
    
    var coordinator: CarsCoordinatorProtocol
    
    var viewController: CarsViewControllerDelegate
    
    var cars: [Car] = []
    
    let service = Services(network: Network())
    
    var subscriptions = Set<AnyCancellable>()
    
    init(`let` coordinator: CarsCoordinatorProtocol, `let` viewController: CarsViewControllerDelegate) {
        self.coordinator = coordinator
        self.viewController = viewController
    }
    
    func goToDetail(car: Car) {
        coordinator.showDetail(car: car)
    }
    
    func loadCars() {
        
        service.getCars().sink { error in
            print(error)
        } receiveValue: { carList in
            DispatchQueue.main.async {
                self.cars = carList.cars
                self.viewController.reloadTable()
            }
        }.store(in: &subscriptions)
    }
}
