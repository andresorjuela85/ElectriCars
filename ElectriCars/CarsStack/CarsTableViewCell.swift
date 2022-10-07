//
//  CarsTableViewCell.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 2/08/22.
//

import UIKit

final class CarsTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: CarsTableViewCell.self)
    
    private var carImages = UIImageView()
    private var brandLabel = UILabel()
    private var nameLabel = UILabel()
    
    var car: Car? {
        
        didSet {
            if let make = car?.make {
                brandLabel.text = make
                brandLabel.textColor = .white
            }
            
            if let name = car?.model {
                nameLabel.text = name
                nameLabel.textColor = .white
                nameLabel.font = .boldSystemFont(ofSize: 18)
            }
            
            if let carImage = car?.imageURL {
                if let url = URL(string: carImage) {
                    carImages.load(url: url)
                }
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .darkGray
        contentView.addSubview(carImages)
        contentView.addSubview(brandLabel)
        contentView.addSubview(nameLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Subviews constraints
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        carImages.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            carImages.widthAnchor.constraint(equalToConstant: 178*(3/4)),
            carImages.heightAnchor.constraint(equalToConstant: 100*(3/4)),
//            carImages.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 3/4),
            carImages.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            carImages.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5)
        ])
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: carImages.trailingAnchor, constant: 5),
            nameLabel.topAnchor.constraint(equalTo: carImages.topAnchor, constant: 10)
        ])
        
        brandLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            brandLabel.leadingAnchor.constraint(equalTo: carImages.trailingAnchor, constant: 5),
            brandLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5)
        ])
    }
}

//MARK: Load image

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global(qos: .background).async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
