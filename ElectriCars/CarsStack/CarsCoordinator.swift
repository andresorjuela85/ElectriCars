//
//  CarsCoordinator.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 28/07/22.
//

import Foundation
import UIKit

protocol CoordinatorProtocol {
    func start()
}

protocol CarsCoordinatorProtocol: CoordinatorProtocol {
    func showCarsViewController()
    func showDetail(car: Car)

}

final class CarsCoordinator: CarsCoordinatorProtocol {
    
    private let presenter: UINavigationController
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        showCarsViewController()
    }
    
    func showCarsViewController() {
        let viewController = Screens.createCarsViewController(coordinator: self)
        presenter.viewControllers = [viewController]
    }
    
    func showDetail(car: Car) {
        let viewController = Screens.createDetailCarViewController(car: car)
        presenter.pushViewController(viewController, animated: true)
    }
}
