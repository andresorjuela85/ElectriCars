//
//  CarsCoordinator.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 28/07/22.
//

import Foundation
import UIKit

class CarsCoordinator {
    
    private let presenter: UINavigationController
    
    private let screen: Screens
    
    init(presenter: UINavigationController, screens: Screens) {
        self.presenter = presenter
        self.screen = screens
    }
    
    func start() {
        showCarsViewController()
    }
    
    func showCarsViewController() {
        let viewController = screen.createCarsViewController(coordinator: self)
        presenter.viewControllers = [viewController]
    }
    
    func showDetail(car: CarListQuery.Data.CarList?) {
        let viewController = screen.createDetailCarViewController(car: car)
        presenter.pushViewController(viewController, animated: true)
    }
    
}
