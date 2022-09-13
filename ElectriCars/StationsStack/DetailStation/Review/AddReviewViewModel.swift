//
//  AddReviewViewModel.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 9/08/22.
//

import Foundation

final class AddReviewViewModel {
    
    let ratings = ["1", "2", "3", "4", "5"]
    
    let service = Services(network: Network())
    
    var stationId: String?
    
    init(stationId: String) {
        self.stationId = stationId
    }
    
    func pushReview(rating: Int, message: String) {
        if let stationId = stationId {
        service.addReview(stationId: stationId, rating: rating, message: message)
        }
    }
    
}
