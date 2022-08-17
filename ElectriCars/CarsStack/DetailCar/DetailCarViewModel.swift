//
//  DetailCarViewModel.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 3/08/22.
//

import Foundation

class DetailCarViewModel {
 
    let car: CarListQuery.Data.CarList?
    
    init(car: CarListQuery.Data.CarList?) {
        self.car = car
    }
    
}
