//
//  Screens.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 28/07/22.
//

import Foundation
import UIKit

final class Screens {
    
    static func createCarsViewController(coordinator: CarsCoordinatorProtocol) -> UIViewController {
        let viewController = CarsViewController()
        let viewModel = CarsViewModel(let: coordinator)
        viewController.viewModel = viewModel
        return viewController
    }
    
    static func createDetailCarViewController(car: Car) -> UIViewController {
        let viewController = DetailCarViewController()
        let viewModel = DetailCarViewModel(car: car)
        viewController.viewModel = viewModel
        return viewController
    }
    
    static func createStationsViewController(coordinator: StationsCoordinatorProtocol) -> UIViewController {
        let viewController = StationsViewController()
        let viewModel = StationsViewModel(let: coordinator, let: viewController)
        viewController.viewModel = viewModel
        return viewController
    }
    
    static func createDetailStationViewController(station: Station, coordinator: StationsCoordinatorProtocol) -> UIViewController {
        let viewController = DetailStationViewController()
        let viewModel = DetailStationViewModel(station: station, coordinator: coordinator, viewController: viewController)
        viewController.viewModel = viewModel
        return viewController
    }
    
    static func createAddReviewViewController(stationId: String, delegate: AddReviewDelegate?) -> UIViewController {
        let viewController = AddReviewViewController()
        viewController.delegate = delegate
        let viewModel = AddReviewViewModel(stationId: stationId)
        viewController.viewModel = viewModel
        return viewController
    }
}
