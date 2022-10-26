//
//  String.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 21/10/22.
//

import Foundation

extension String {
    
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
