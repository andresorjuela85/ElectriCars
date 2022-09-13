//
//  Screens.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 28/07/22.
//

import Foundation
import UIKit

final class Screens {
    
    func createCarsViewController(coordinator: CarsCoordinator) -> UIViewController {
        let viewController = CarsViewController()
        let viewModel = CarsViewModel(let: coordinator, let: viewController)
        viewController.viewModel = viewModel
        return viewController
    }
    
    func createStationsViewController(coordinator: StationsCoordinator) -> UIViewController {
        let viewController = StationsViewController()
        let viewModel = StationsViewModel(let: coordinator, let: viewController)
        viewController.viewModel = viewModel
        return viewController
    }
    
    func createDetailCarViewController(car: Car) -> UIViewController {
        let viewController = DetailCarViewController()
        let viewModel = DetailCarViewModel(car: car)
        viewController.viewModel = viewModel
        return viewController
    }
    
    func createDetailStationViewController(station: Station, coordinator: StationsCoordinator) -> UIViewController {
        let viewController = DetailStationViewController()
        let viewModel = DetailStationViewModel(station: station, coordinator: coordinator, viewController: viewController)
        viewController.viewModel = viewModel
        return viewController
    }
    
    func createAddReviewViewController(stationId: String, delegate: AddReviewDelegate?) -> UIViewController {
        let viewController = AddReviewViewController()
        viewController.delegate = delegate
        let viewModel = AddReviewViewModel(stationId: stationId)
        viewController.viewModel = viewModel
        return viewController
    }
}
