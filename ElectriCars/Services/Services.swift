//
//  Services.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 23/08/22.
//

import Foundation
import Apollo
import Combine

protocol ServicesDelegate {
    
    func getCars() -> AnyPublisher<CarList, Never>
    func getStations() -> AnyPublisher<StationList, Never>
    func getReviews(stationId: String) -> AnyPublisher<ReviewList, Never>
    func addReview(stationId: String, rating: Int, message: String)
}

final class Services: ServicesDelegate {
    
    var network: Network
    
    init(network: Network) {
        self.network = network
    }
    
    func getCars() -> AnyPublisher<CarList, Never> {
        
        return network.fetch(of: CarList.self, query: CarListQuery(size: 30))
            .catch { error in
                return Just(CarList(data: nil))
            }.eraseToAnyPublisher()
    }
    
    func getStations() -> AnyPublisher<StationList, Never> {
        
        return network.fetch(of: StationList.self, query: StationListQuery())
            .catch { error in
                return Just(StationList(data: nil))
            }.eraseToAnyPublisher()
    }
    
    func getReviews(stationId: String) -> AnyPublisher<ReviewList, Never> {
        
        return network.fetch(of: ReviewList.self, query: ReviewListQuery(stationId: stationId))
            .catch { error in
                return Just(ReviewList(data: nil))
            }.eraseToAnyPublisher()
    }
    
    func addReview(stationId: String, rating: Int, message: String) {
        
        network.apollo.perform(mutation: AddReviewMutation(review: ReviewAdd(stationId: stationId, rating: rating, message: message)))
    }
}
