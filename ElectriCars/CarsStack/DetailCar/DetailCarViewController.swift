//
//  DetailCarViewController.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 28/07/22.
//

import UIKit

final class DetailCarViewController: UIViewController {
    
    var viewModel: DetailCarViewModel?
    
    private var carImage = UIImageView()
    private var brandImage = UIImageView()
    
    //MARK: Configurate labels
    
    private var makeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "DETAILCAR_LABEL_MAKE".localized()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    private var brandLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    private var mLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "DETAILCAR_LABEL_MODEL".localized()
        label.textAlignment = .center
        return label
    }()
    
    private var modelLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private var chargeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "DETAILCAR_LABEL_CHARGE".localized()
        label.textAlignment = .center
        return label
    }()
    
    private var chargeTripLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    //MARK: View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        
        if let image = viewModel?.car.imageURL {
            carImage.load(url: URL(string: image)!)
        }
        
        if let bImage = viewModel?.car.brandURL {
            brandImage.load(url: URL(string: bImage)!)
            brandImage.backgroundColor = .white
        }
        
        brandLabel.text = viewModel?.car.make
        modelLabel.text = viewModel?.car.model
        chargeTripLabel.text = viewModel?.car.chargetripVersion
        
        setupSubviews()
    }
    
    //MARK: Subviews constraints
    
    func setupSubviews () {
        
        carImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(carImage)
        NSLayoutConstraint.activate([
        carImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
        carImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        carImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 15/16),
        carImage.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 9/16)
        ])
        
        brandImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(brandImage)
        NSLayoutConstraint.activate([
        brandImage.topAnchor.constraint(equalTo: carImage.bottomAnchor, constant: 40),
        brandImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        brandImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 3/16),
        brandImage.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 2/16)
        ])
        
        makeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(makeLabel)
        NSLayoutConstraint.activate([
        makeLabel.topAnchor.constraint(equalTo: brandImage.bottomAnchor, constant: 25),
        makeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        makeLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
        makeLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        brandLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(brandLabel)
        NSLayoutConstraint.activate([
        brandLabel.topAnchor.constraint(equalTo: makeLabel.bottomAnchor, constant: 5),
        brandLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        brandLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
        brandLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        mLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mLabel)
        NSLayoutConstraint.activate([
        mLabel.topAnchor.constraint(equalTo: brandLabel.bottomAnchor, constant: 25),
        mLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        mLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
        mLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        modelLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(modelLabel)
        NSLayoutConstraint.activate([
        modelLabel.topAnchor.constraint(equalTo: mLabel.bottomAnchor, constant: 5),
        modelLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        modelLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
        modelLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        chargeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(chargeLabel)
        NSLayoutConstraint.activate([
        chargeLabel.topAnchor.constraint(equalTo: modelLabel.bottomAnchor, constant: 25),
        chargeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        chargeLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
        chargeLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        chargeTripLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(chargeTripLabel)
        NSLayoutConstraint.activate([
        chargeTripLabel.topAnchor.constraint(equalTo: chargeLabel.bottomAnchor, constant: 5),
        chargeTripLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        chargeTripLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
        chargeTripLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
