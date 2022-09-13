//
//  CarList.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 29/08/22.
//

import Foundation
import Apollo

typealias CarListData = CarListQuery.Data

protocol ModelProcessProtocol: Codable {
    static func processData(_ data: GraphQLSelectionSet) -> Self
}

struct CarList: ModelProcessProtocol {
    var cars: [Car] = []
    
    init(data: CarListData?) {
        data?.carList?.forEach({ car in
            if let car = car {
                self.cars.append(Car(car))
            }
        })
    }
    
    static func processData(_ data: GraphQLSelectionSet) -> CarList {
        return CarList(data: data as? CarListData)
    }
}

struct Car: Codable {
    
    var id: String
    var make: String?
    var model: String?
    var chargetripVersion: String?
    var imageURL: String?
    var brandURL: String?
    
    init(_ car: CarListData.CarList) {
        self.id = car.id ?? ""
        self.make = car.naming?.make
        self.model = car.naming?.model
        self.chargetripVersion = car.naming?.chargetripVersion
        self.imageURL = car.fragments.mediaUrl.media?.image?.url
        self.brandURL = car.fragments.mediaUrl.media?.brand?.url
    }
}
