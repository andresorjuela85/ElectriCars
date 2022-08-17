//
//  TabCoordinator.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 28/07/22.
//

import UIKit

class TabCoordinator {
    
    private let presenter: UIWindow
    
    private let tabBarController = UITabBarController()
    
    private let screens: Screens
    private var carsCoordinator: CarsCoordinator?
    private var stationsCoordinator: StationsCoordinator?
    
    let vc1 = UINavigationController()
    let vc2 = UINavigationController()
        
    init(presenter: UIWindow) {
        
        self.presenter = presenter
        self.screens = Screens()
       
        tabBarController.setViewControllers([vc1, vc2], animated: false)
        tabBarController.tabBarItem.title = "ElectriCars"
        tabBarController.tabBar.tintColor = .black
        tabBarController.tabBar.barTintColor = .darkGray
        tabBarController.tabBar.backgroundColor = .white
        vc1.title = "ElectriCars"
        vc2.title = "Stations"

        guard let items = self.tabBarController.tabBar.items else { return }
        
        let images = ["car.fill", "bolt.car"]
        let names = ["ElectriCars", "Stations"]
        
        for x in 0...items.count - 1 {
            items[x].image = UIImage(systemName: images[x])
            items[x].title = names[x]

        }
    }
    
    func start() {
        presenter.rootViewController = tabBarController
        showCarsTab()
        showStationsTab()
    }
    
    func showCarsTab() {
        carsCoordinator = CarsCoordinator(presenter: vc1, screens: screens)
        carsCoordinator?.start()
    }
    
    func showStationsTab() {
        stationsCoordinator = StationsCoordinator(presenter: vc2, screens: screens)
        stationsCoordinator?.start()
    }
}
