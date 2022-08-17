//
//  DetailStationViewModel.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 5/08/22.
//

import Foundation
import CoreLocation

class DetailStationViewModel {
    
    var station: StationListQuery.Data.StationList?
    var coordinator: StationsCoordinator
    
    
    init(station: StationListQuery.Data.StationList?, coordinator: StationsCoordinator) {
        self.station = station
        self.coordinator = coordinator
    }
    
    func goToReview() {
        coordinator.showAddReview()
    }
    
}
