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
    
    @Published var cars: [Car] = []
    
    let service = Services(network: Network())
    
    var subscriptions = Set<AnyCancellable>()
    
    init(`let` coordinator: CarsCoordinatorProtocol) {
        self.coordinator = coordinator
        
        loadCars()
    }
    
    func goToDetail(car: Car) {
        coordinator.showDetail(car: car)
    }
    
    func loadCars() {
        
        service.getCars()
            .sink { error in
                print(error)
            } receiveValue: { carList in
                self.cars = carList.cars
            }.store(in: &subscriptions)
    }
}
