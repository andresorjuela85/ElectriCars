//
//  CarsTableViewCell.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 2/08/22.
//

import UIKit

final class CarsTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: CarsTableViewCell.self)
    
    private var carImage = UIImageView()
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
            
            if let image = car?.imageURL {
                
                carImage.load(url: URL(string: image)!)
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .darkGray
        contentView.addSubview(carImage)
        contentView.addSubview(brandLabel)
        contentView.addSubview(nameLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Subviews constraints
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        carImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            carImage.widthAnchor.constraint(equalToConstant: 178*(3/4)),
            carImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 3/4),
            carImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            carImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5)
        ])
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: carImage.trailingAnchor, constant: 5),
            nameLabel.topAnchor.constraint(equalTo: carImage.topAnchor, constant: 10)
        ])
        
        brandLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            brandLabel.leadingAnchor.constraint(equalTo: carImage.trailingAnchor, constant: 5),
            brandLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5)
        ])
    }
}

//MARK: Load image

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.main.async { [weak self] in
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
