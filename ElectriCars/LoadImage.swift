//
//  LoadImage.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 27/09/22.
//

import Foundation
import UIKit


class LoadImage {
    
    var loadImage = UIImageView()
    
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global(qos: .background).async { [weak self] in
            do {
                let data = try Data(contentsOf: url)
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            } catch {
                print("Error")
            }
        }
    }
}

