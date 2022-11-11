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
    
    func getCars() -> AnyPublisher<CarList, Error>
    func getStations() -> AnyPublisher<StationList, Error>
    func getReviews(stationId: String) -> AnyPublisher<ReviewList, Error>
    func addReview(stationId: String, rating: Int, message: String)
}

final class Services: ServicesDelegate {
    
    var network: Network
    
    init(network: Network) {
        self.network = network
    }
    
    func getCars() -> AnyPublisher<CarList, Error> {
        
        return network.fetch(of: CarList.self, query: CarListQuery(size: 30))
    }
    
    func getStations() -> AnyPublisher<StationList, Error> {
        
        return network.fetch(of: StationList.self, query: StationListQuery())
    }
    
    func getReviews(stationId: String) -> AnyPublisher<ReviewList, Error> {
        
        return network.fetch(of: ReviewList.self, query: ReviewListQuery(stationId: stationId))
    }
    
    func addReview(stationId: String, rating: Int, message: String) {
        
        network.apollo.perform(mutation: AddReviewMutation(review: ReviewAdd(stationId: stationId, rating: rating, message: message)))
    }
}
