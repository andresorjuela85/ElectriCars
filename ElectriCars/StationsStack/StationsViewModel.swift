//
//  StationsViewModel.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 28/07/22.
//

import Foundation

protocol StationsViewModelDelegate {
    
    var stations: [Station] { get set }
    
    func loadStations()
    
    func goToDetail (station: Station)
}

final class StationsViewModel: StationsViewModelDelegate {
    
    var coordinator: StationsCoordinator
    var viewController: StationViewControllerDelegate
    
    var stations: [Station] = []
    
    let service = Services(network: Network())
    
    init (`let` coordinator: StationsCoordinator, `let` viewController: StationViewControllerDelegate) {
        self.coordinator = coordinator
        self.viewController = viewController
    }
    
    func goToDetail (station: Station) {
        coordinator.showStationDetail(station: station)
    }
    
    func loadStations() {
        
        service.getStations { stationReceived in
            self.stations = stationReceived
            self.viewController.reloadTable()
//            print(self.stations)
        }
        
    }
}
