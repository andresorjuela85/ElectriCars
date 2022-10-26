//
//  StationsTableViewCell.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 5/08/22.
//

import UIKit

final class StationsTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: StationsTableViewCell.self)
    
    private var stationLabel = UILabel()
    private var adressLabel = UILabel()
    private var cityLabel = UILabel()
    
    var station: Station? {
        
        didSet {
            if let name = station?.name {
                stationLabel.text = name
//                stationLabel.textColor = .white
                stationLabel.font = .boldSystemFont(ofSize: 18)
            }
            
            if let adress = station?.address {
                adressLabel.text = adress
//                adressLabel.textColor = .white
            }
            
            if let city = station?.city {
                cityLabel.text = city
                if let country = station?.country {
                    cityLabel.text = city + ", " + country
//                    cityLabel.textColor = .white
                }
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .white
        contentView.addSubview(stationLabel)
        contentView.addSubview(adressLabel)
        contentView.addSubview(cityLabel)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Subviews constraints
    
    func setupSubviews() {
        
        stationLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stationLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            stationLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 7/8),
//            stationLabel.heightAnchor.constraint(equalToConstant: 20),
            stationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
        ])
        
        adressLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            adressLabel.topAnchor.constraint(equalTo: stationLabel.bottomAnchor, constant: 10),
            adressLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 7/8),
//            adressLabel.heightAnchor.constraint(equalToConstant: 20),
            adressLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
        ])
        
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: adressLabel.bottomAnchor, constant: 5),
            
            cityLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 7/8),
//            cityLabel.heightAnchor.constraint(equalToConstant: 20),
            cityLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cityLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
        ])
    }
}
