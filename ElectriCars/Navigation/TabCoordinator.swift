//
//  TabCoordinator.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 28/07/22.
//

import UIKit

final class TabCoordinator {
    
    private let presenter: UIWindow
    
    private let tabBarController = UITabBarController()
    
    private let screens: Screens
    private var carsCoordinator: CarsCoordinator?
    private var stationsCoordinator: StationsCoordinator?
    
    let carsViewController = UINavigationController()
    let stationsViewController = UINavigationController()
    
    init(presenter: UIWindow) {
        
        self.presenter = presenter
        self.screens = Screens()
        
        setupTabBar()
        carsViewController.title = "TABBAR_OPTION_NAME_CARS".localized()
        stationsViewController.title = "TABBAR_OPTION_NAME_STATIONS".localized()
        
        guard let items = self.tabBarController.tabBar.items else { return }
        
        let images = [Assets.Icons.car, Assets.Icons.bolt]
        let names = ["TABBAR_OPTION_NAME_CARS".localized(), "TABBAR_OPTION_NAME_STATIONS".localized()]
        
        for x in 0...items.count - 1 {
            items[x].image = UIImage(systemName: images[x])
            items[x].title = names[x]
        }
    }
    
    func setupTabBar() {
        
        tabBarController.setViewControllers([carsViewController, stationsViewController], animated: false)
        tabBarController.tabBarItem.title = "TABBAR_OPTION_NAME_CARS".localized()
        tabBarController.tabBar.tintColor = .black
        tabBarController.tabBar.barTintColor = .white
        tabBarController.tabBar.backgroundColor = .white
    }
    
    func start() {
        presenter.rootViewController = tabBarController
        showCarsTab()
        showStationsTab()
    }
    
    func showCarsTab() {
        carsCoordinator = CarsCoordinator(presenter: carsViewController)
        carsCoordinator?.start()
    }
    
    func showStationsTab() {
        stationsCoordinator = StationsCoordinator(presenter: stationsViewController)
        stationsCoordinator?.start()
    }
}
