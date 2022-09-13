//
//  Services.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 23/08/22.
//

import Foundation
import Apollo

protocol ServicesDelegate {
    
    func getCars(completion: @escaping ([Car]) -> Void)
    func getStations(completion: @escaping ([Station]) -> Void)
    func addReview(stationId: String, rating: Int, message: String)
    func getReviews(stationId: String, completion: @escaping ([Review]) -> Void)
}

final class Services: ServicesDelegate {
    
    var network: Network
    
    init(network: Network) {
        self.network = network
    }
    
    func getCars(completion: @escaping ([Car]) -> Void) {
        
        network.fetch(of: CarList.self, query: CarListQuery(size: 50)) { result in
            
            switch result {
            case .success(let carList):
                
                completion(carList.cars)
                
            case .failure(let error):
                
                print("Error: \(String(describing: error))")
            }
        }      
    }
    
    func getStations(completion: @escaping ([Station]) -> Void) {
        
        network.fetch(of: StationList.self, query: StationListQuery()) { response in
            
            switch response {
            case .success(let stationList):
                completion(stationList.stations)
                
            case .failure(let error):
                print("Error: \(String(describing: error))")
            }
        }
    }
    
    func addReview(stationId: String, rating: Int, message: String) {
        
        network.apollo.perform(mutation: AddReviewMutation(review: ReviewAdd(stationId: stationId, rating: rating, message: message)))
    }
    
    func getReviews(stationId: String, completion: @escaping ([Review]) -> Void) {
        
        network.fetch(of: ReviewList.self, query: ReviewListQuery(stationId: stationId)) { response in
            
            switch response {
            case .success(let reviewList):
                completion(reviewList.reviews)
                
            case .failure(let error):
                print("Error: \(String(describing: error))")
            }
            
        }
    }
    
}
