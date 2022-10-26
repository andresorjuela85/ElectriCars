//
//  StationsViewModel.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 28/07/22.
//

import Foundation
import Combine

protocol StationsViewModelDelegate {
    
    var stations: [Station] { get set }
    
    func loadStations()
    
    func goToDetail (station: Station)
}

final class StationsViewModel: StationsViewModelDelegate {
    
    var coordinator: StationsCoordinatorProtocol
    
    var viewController: StationViewControllerDelegate
    
    var stations: [Station] = []
    
    let service = Services(network: Network())
    
    var subscriptions = Set<AnyCancellable>()
    
    init (`let` coordinator: StationsCoordinatorProtocol, `let` viewController: StationViewControllerDelegate) {
        self.coordinator = coordinator
        self.viewController = viewController
    }
    
    func goToDetail (station: Station) {
        coordinator.showStationDetail(station: station)
    }
      
    func loadStations() {
        
        service.getStations().sink { stationList in
            DispatchQueue.main.async {
                self.stations = stationList.stations
                self.viewController.reloadTable()
            }
        }.store(in: &subscriptions)
    }
}
