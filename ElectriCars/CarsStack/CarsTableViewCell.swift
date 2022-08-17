//
//  CarsTableViewCell.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 2/08/22.
//

import UIKit
import AlamofireImage

class CarsTableViewCell: UITableViewCell {

    static let identifier = "CarsTableViewCell"
    
    private var carImage = UIImageView()
    private var brandLabel = UILabel()
    private var nameLabel = UILabel()
    
    var cars: CarListQuery.Data.CarList? {
        
        didSet {
            if let make = cars?.naming?.make {
                brandLabel.text = make
                brandLabel.textColor = .white
            }
            
            if let name = cars?.naming?.model {
                nameLabel.text = name
                nameLabel.textColor = .white
                nameLabel.font = .boldSystemFont(ofSize: 17)
            }
            
            if let image = cars?.media?.image?.url {
                let url = URL(string: image)!
                carImage.af.setImage(withURL: url)
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
    
    override func layoutSubviews() {
        super.layoutSubviews()

        carImage.frame = CGRect(x: 10, y: 0, width: 178/1.5, height: contentView.frame.height/1.5)
        
        nameLabel.frame = CGRect(x: 40 + carImage.frame.width, y: 25, width: 250, height: 20)
        brandLabel.frame = CGRect(x: 40 + carImage.frame.width, y: 45, width: 250, height: contentView.frame.size.height - 45)
    }
    

}
