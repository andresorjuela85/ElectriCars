//
//  DetailHeaderView.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 7/09/22.
//

import Foundation
import UIKit

class DetailTableHeader: UITableViewHeaderFooterView {
    
    static let identifier = String(describing: DetailTableHeader.self)
    
    let days = ["Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado", "Domingo"]
    var day = ""
    
    private let stationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Station Details"
        label.font = .boldSystemFont(ofSize: 19)
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Name:"
        return label
    }()
    
    private let nameStationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Address:"
        return label
    }()
    
    private let addressStationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    private let cityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    private let openLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private let timesLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()

    var station: Station? {
        didSet {
            if let name = station?.name {
                nameStationLabel.text = name
                
            }
            
            if let adress = station?.address {
                addressStationLabel.text = adress
                
            }
            
            if let city = station?.city {
                cityLabel.text = city + ", " + (station?.country ?? "")
            }
            day = ""
            if let weekday = station?.weekday {
                print(weekday.count)
                weekday.forEach { weekday in
                    if weekday.periodBegin != nil || weekday.periodEnd != nil {
                        day = day + "\(days[(weekday.weekday ?? 0) - 1 ])  \(weekday.periodBegin ?? "") - \(weekday.periodEnd ?? "")\n"
                        openLabel.text = "Opening times:"
                    }
                    
                    timesLabel.text = day
                }
            }
        }
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Subviews constraints
    
    func setupViews(){
        
        stationLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stationLabel)
        NSLayoutConstraint.activate([
            stationLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            stationLabel.heightAnchor.constraint(equalToConstant: 25),
            stationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
        ])
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: stationLabel.bottomAnchor, constant: 25),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            nameLabel.widthAnchor.constraint(equalToConstant: 120)
        ])
        
        nameStationLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameStationLabel)
        NSLayoutConstraint.activate([
            nameStationLabel.topAnchor.constraint(equalTo: stationLabel.bottomAnchor, constant: 25),
            nameStationLabel.heightAnchor.constraint(equalToConstant: 20),
            nameStationLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            nameStationLabel.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(addressLabel)
        NSLayoutConstraint.activate([
            addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15),
            addressLabel.heightAnchor.constraint(equalToConstant: 20),
            addressLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            addressLabel.widthAnchor.constraint(equalToConstant: 120)
        ])
        
        addressStationLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(addressStationLabel)
        NSLayoutConstraint.activate([
            addressStationLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15),
            addressStationLabel.heightAnchor.constraint(equalToConstant: 20),
            addressStationLabel.leadingAnchor.constraint(equalTo: addressLabel.trailingAnchor),
            addressStationLabel.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(cityLabel)
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: addressStationLabel.bottomAnchor, constant: 5),
            cityLabel.heightAnchor.constraint(equalToConstant: 20),
            cityLabel.leadingAnchor.constraint(equalTo: addressLabel.trailingAnchor),
            cityLabel.widthAnchor.constraint(equalToConstant: 200)
        ])
       
        openLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(openLabel)
        NSLayoutConstraint.activate([
            openLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 15),
            openLabel.heightAnchor.constraint(equalToConstant: 20),
            openLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            openLabel.widthAnchor.constraint(equalToConstant: 120)
        ])
        
        timesLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(timesLabel)
        NSLayoutConstraint.activate([
            timesLabel.topAnchor.constraint(equalTo: openLabel.topAnchor),
            timesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            timesLabel.leadingAnchor.constraint(equalTo: cityLabel.leadingAnchor),
            timesLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 20)
        ])
    }
}
