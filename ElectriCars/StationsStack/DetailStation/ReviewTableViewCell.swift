//
//  ReviewTableViewCell.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 10/08/22.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {
    
    static let identifier = "ReviewTableViewCell"
    
    
    private var reviewLabel = UILabel()
    private var ratingLabel = UILabel()
    private var starLabel = UILabel()
    
    var station: StationListQuery.Data.StationList? {
        
        didSet {
            if let review = station?.name {
                reviewLabel.text = review
                reviewLabel.textColor = .white
                reviewLabel.font = .boldSystemFont(ofSize: 17)
            }
            
//            if let rating = station?.address {
//                ratingLabel.text = rating
//                ratingLabel.textColor = .white
//
//            }
//
//            if let star = station?.city {
//                starLabel.text = star
//
//                starLabel.textColor = .white
//
//            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .darkGray
        contentView.addSubview(reviewLabel)
        print("Customize")
//        contentView.addSubview(ratingLabel)
//        contentView.addSubview(starLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        reviewLabel.frame = CGRect(x: 10, y: 10, width: 250, height: 25)
//        ratingLabel.frame = CGRect(x: 10, y: 40, width: 250, height: 20)
//        starLabel.frame = CGRect(x: 10, y: 65, width: 250, height: 20)
    }
}
