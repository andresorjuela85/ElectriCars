//
//  AppCoordinator.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 28/07/22.
//

import Foundation
import UIKit

final class AppCoordinator {
    
    private var sceneDelegate: SceneDelegate
    
    private var tabCoordinator: TabCoordinator?
    
    init(sceneDelegate: SceneDelegate) {
        
        self.sceneDelegate = sceneDelegate
    }
    
    func start() {
        guard let window = sceneDelegate.window else { return }
        
        tabCoordinator = TabCoordinator(presenter: window)
        tabCoordinator?.start()
    }
}
