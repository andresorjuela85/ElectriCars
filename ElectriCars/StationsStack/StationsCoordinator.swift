//
//  StationsCoordinator.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 28/07/22.
//

import Foundation
import UIKit

protocol StationsCoordinatorProtocol: CoordinatorProtocol {
    func showStationsViewController()
    func showStationDetail(station: Station)
    func showAddReview(stationId: String, delegate: AddReviewDelegate?)
    func start()
}


final class StationsCoordinator: StationsCoordinatorProtocol {
    
    private let presenter: UINavigationController
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        showStationsViewController()
    }
    
    func showStationsViewController() {
        let viewController = Screens.createStationsViewController(coordinator: self)
        presenter.viewControllers = [viewController]
    }
    
    func showStationDetail(station: Station) {
        let viewController = Screens.createDetailStationViewController(station: station, coordinator: self)
        presenter.pushViewController(viewController, animated: true)
    }
    
    func showAddReview(stationId: String, delegate: AddReviewDelegate?) {
        let viewController = Screens.createAddReviewViewController(stationId: stationId, delegate: delegate)
        presenter.present(viewController, animated: true)
    }
}
