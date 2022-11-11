//
//  ReviewTableViewCell.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 10/08/22.
//

import UIKit

final class ReviewTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: ReviewTableViewCell.self)
    
    
    private var reviewLabel = UILabel()
    
    private var starLabel = UILabel()
    
    private var ratingLabel = UILabel()
    
    private var starImage1: UIImageView = {
        let image = UIImageView()
        image.tintColor = .yellow
        return image
    }()
    
    private var starImage2: UIImageView = {
        let image = UIImageView()
        image.tintColor = .yellow
        return image
    }()
    
    private var starImage3: UIImageView = {
        let image = UIImageView()
        image.tintColor = .yellow
        return image
    }()
    
    private var starImage4: UIImageView = {
        let image = UIImageView()
        image.tintColor = .yellow
        return image
    }()
    
    private var starImage5: UIImageView = {
        let image = UIImageView()
        image.tintColor = .yellow
        return image
    }()
    
    var review: Review? {
        
        didSet {
            
            if let message = review?.message {
                reviewLabel.text = message
                reviewLabel.textColor = .white
            }
            
            ratingLabel.text = "REVIEWTABLE_LABEL_RATING".localized()
            ratingLabel.textColor = .white
            
            if let star = review?.rating {
                
                switch star {
                case 1:
                    starImage1.image = UIImage(systemName: Assets.Icons.star)
                case 2:
                    starImage1.image = UIImage(systemName: Assets.Icons.star)
                    starImage2.image = UIImage(systemName: Assets.Icons.star)
                case 3:
                    starImage1.image = UIImage(systemName: Assets.Icons.star)
                    starImage2.image = UIImage(systemName: Assets.Icons.star)
                    starImage3.image = UIImage(systemName: Assets.Icons.star)
                case 4:
                    starImage1.image = UIImage(systemName: Assets.Icons.star)
                    starImage2.image = UIImage(systemName: Assets.Icons.star)
                    starImage3.image = UIImage(systemName: Assets.Icons.star)
                    starImage4.image = UIImage(systemName: Assets.Icons.star)
                case 5:
                    starImage1.image = UIImage(systemName: Assets.Icons.star)
                    starImage2.image = UIImage(systemName: Assets.Icons.star)
                    starImage3.image = UIImage(systemName: Assets.Icons.star)
                    starImage4.image = UIImage(systemName: Assets.Icons.star)
                    starImage5.image = UIImage(systemName: Assets.Icons.star)
                default:
                    print("Not an accepted rating")
                }
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Subviews constraints
    
    func setupView() {
        contentView.backgroundColor = .black
        contentView.addSubview(reviewLabel)
        contentView.addSubview(ratingLabel)
        contentView.addSubview(starImage1)
        contentView.addSubview(starImage2)
        contentView.addSubview(starImage3)
        contentView.addSubview(starImage4)
        contentView.addSubview(starImage5)
    }
    
    func setupSubviews() {
        
        reviewLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            reviewLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            reviewLabel.heightAnchor.constraint(equalToConstant: 15),
            reviewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            reviewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10)
        ])
        
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ratingLabel.topAnchor.constraint(equalTo: reviewLabel.bottomAnchor, constant: 5),
            ratingLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            ratingLabel.leadingAnchor.constraint(equalTo: reviewLabel.leadingAnchor),
            ratingLabel.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        starImage1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            starImage1.centerYAnchor.constraint(equalTo: ratingLabel.centerYAnchor),
            starImage1.heightAnchor.constraint(equalToConstant: 20),
            starImage1.leadingAnchor.constraint(equalTo: ratingLabel.trailingAnchor),
            starImage1.widthAnchor.constraint(equalToConstant: 20)
        ])
        
        starImage2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            starImage2.centerYAnchor.constraint(equalTo: ratingLabel.centerYAnchor),
            starImage2.heightAnchor.constraint(equalToConstant: 20),
            starImage2.leadingAnchor.constraint(equalTo: starImage1.trailingAnchor),
            starImage2.widthAnchor.constraint(equalToConstant: 20)
        ])
        
        starImage3.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            starImage3.centerYAnchor.constraint(equalTo: ratingLabel.centerYAnchor),
            starImage3.heightAnchor.constraint(equalToConstant: 20),
            starImage3.leadingAnchor.constraint(equalTo: starImage2.trailingAnchor),
            starImage3.widthAnchor.constraint(equalToConstant: 20)
        ])
        
        starImage4.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            starImage4.centerYAnchor.constraint(equalTo: ratingLabel.centerYAnchor),
            starImage4.heightAnchor.constraint(equalToConstant: 20),
            starImage4.leadingAnchor.constraint(equalTo: starImage3.trailingAnchor),
            starImage4.widthAnchor.constraint(equalToConstant: 20)
        ])
        
        starImage5.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            starImage5.centerYAnchor.constraint(equalTo: ratingLabel.centerYAnchor),
            starImage5.heightAnchor.constraint(equalToConstant: 20),
            starImage5.leadingAnchor.constraint(equalTo: starImage4.trailingAnchor),
            starImage5.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
}
