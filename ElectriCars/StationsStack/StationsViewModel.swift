//
//  StationsViewModel.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 28/07/22.
//

import Foundation

protocol StationsViewControllerDelegate {
    
    var station: [StationListQuery.Data.StationList?] { get set }
    
    func loadStations()
    
}


class StationsViewModel {
    
    var coordinator: StationsCoordinator
    var viewController: StationcViewControllerDelegate
    
    var station = [StationListQuery.Data.StationList?]()
    
    init (coordinator: StationsCoordinator, viewController: StationcViewControllerDelegate) {
        self.coordinator = coordinator
        self .viewController = viewController
    }
    
    func goToDetail (station: StationListQuery.Data.StationList?) {
        coordinator.showStationDetail(station: station)
    }
    
    func loadStations() {
        
        Network.shared.apollo.fetch(query: StationListQuery()) { result in
            
            switch result {
                
            case .success(let graphQLResult):
                if let stationConnection = graphQLResult.data?.stationList {
                    self.station = stationConnection
                    self.viewController.reloadTable()
                }
                
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
