//
//  StationsCoordinator.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 28/07/22.
//

import Foundation
import UIKit

final class StationsCoordinator {
    
    private let presenter: UINavigationController
    
    private let screen: Screens
    
    init(presenter: UINavigationController, screens: Screens) {
        self.presenter = presenter
        self.screen = screens
    }
    
    func start() {
        showStationsViewController()
    }
    
    func showStationsViewController() {
        let viewController = screen.createStationsViewController(coordinator: self)
        presenter.viewControllers = [viewController]
    }
    
    func showStationDetail(station: Station) {
        let viewController = screen.createDetailStationViewController(station: station, coordinator: self)
        presenter.pushViewController(viewController, animated: true)
    }
    
    func showAddReview(stationId: String, delegate: AddReviewDelegate?) {
        let viewController = screen.createAddReviewViewController(stationId: stationId, delegate: delegate)
        presenter.present(viewController, animated: true)
    }
}
