//
//  DetailStationViewModel.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 5/08/22.
//

import Foundation
import CoreLocation

protocol DetailStationViewModelDelegate {
    
    var station: Station? { get set }
    var reviews: [Review] { get set }
    func goToReview(delegate: AddReviewDelegate?)
    func loadReviews()
}

final class DetailStationViewModel: DetailStationViewModelDelegate {
    
    var station: Station?
    var reviews: [Review] = []
    var coordinator: StationsCoordinator
    
    var viewController: DetailStationViewController
    
    let service = Services(network: Network())
    
    init(station: Station, coordinator: StationsCoordinator, viewController: DetailStationViewController) {
        self.station = station
        self.coordinator = coordinator
        self.viewController = viewController
    }
    
    func goToReview(delegate: AddReviewDelegate?) {
        if let stationId = station?.id {
            coordinator.showAddReview(stationId: stationId, delegate: delegate)
        }
    }
    
    func loadReviews() {
        
        if let id = station?.id {
            service.getReviews(stationId: id) { reviewReceived in
                self.reviews = reviewReceived
                self.viewController.reloadTable()
            }
        }
    }
}
