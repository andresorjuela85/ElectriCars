//
//  Screens.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 28/07/22.
//

import Foundation
import UIKit

class Screens {
    
    func createCarsViewController(coordinator: CarsCoordinator) -> UIViewController {
        let viewController = CarsViewController()
        let viewModel = CarsViewModel(coordinator: coordinator, viewController: viewController)
        viewController.viewModel = viewModel
        return viewController
    }
    
    func createStationsViewController(coordinator: StationsCoordinator) -> UIViewController {
        let viewController = StationsViewController()
        let viewModel = StationsViewModel(coordinator: coordinator, viewController: viewController)
        viewController.viewModel = viewModel
        return viewController
    }
    
    func createDetailCarViewController(car: CarListQuery.Data.CarList?) -> UIViewController {
        let viewController = DetailCarViewController()
        let viewModel = DetailCarViewModel(car: car)
        viewController.viewModel = viewModel
        return viewController
    }
    
    func createDetailStationViewController(station: StationListQuery.Data.StationList?, coordinator: StationsCoordinator) -> UIViewController {
        let viewController = DetailStationViewController()
        let viewModel = DetailStationViewModel(station: station, coordinator: coordinator)
        viewController.viewModel = viewModel
        return viewController
    }
    
    func createAddReviewViewController() -> UIViewController {
        let viewController = AddReviewViewController()
        
        return viewController
    }
}
