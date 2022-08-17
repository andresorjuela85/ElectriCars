//
//  StationsTableViewCell.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 5/08/22.
//

import UIKit

class StationsTableViewCell: UITableViewCell {

    static let identifier = "StationsTableViewCell"
    
    private var stationLabel = UILabel()
    private var adressLabel = UILabel()
    private var cityLabel = UILabel()
    
    var station: StationListQuery.Data.StationList? {
        
        didSet {
            if let name = station?.name {
                stationLabel.text = name
                stationLabel.textColor = .white
                stationLabel.font = .boldSystemFont(ofSize: 17)
            }
            
            if let adress = station?.address {
                adressLabel.text = adress
                adressLabel.textColor = .white
                
            }
            
            if let city = station?.city {
                cityLabel.text = city
                if let country = station?.country {
                    cityLabel.text = city + ", " + country
                    cityLabel.textColor = .white
                }
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .darkGray
        contentView.addSubview(stationLabel)
        contentView.addSubview(adressLabel)
        contentView.addSubview(cityLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        stationLabel.frame = CGRect(x: 10, y: 10, width: 250, height: 25)
        adressLabel.frame = CGRect(x: 10, y: 40, width: 250, height: 20)
        cityLabel.frame = CGRect(x: 10, y: 65, width: 250, height: 20)
    }
}
