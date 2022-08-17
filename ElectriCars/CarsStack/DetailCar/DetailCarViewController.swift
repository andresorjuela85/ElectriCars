//
//  DetailCarViewController.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 28/07/22.
//

import UIKit

class DetailCarViewController: UIViewController {

    var viewModel: DetailCarViewModel?
    
    private var carImage = UIImageView()
    private var brandImage = UIImageView()
    
    private var makeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Make"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 17)
        return label
    }()
    
    private var brandLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 17)
        
        return label
    }()
    
    private var mLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Model"
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
        label.text = "Charge trip version"
        label.textAlignment = .center
        return label
    }()
    
    private var chargeTripLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
        
        if let image = viewModel?.car?.media?.image?.url {
            let url = URL(string: image)!
            carImage.af.setImage(withURL: url)
        }
        
        if let bImage = viewModel?.car?.media?.brand?.url {
            let url = URL(string: bImage)!
            brandImage.af.setImage(withURL: url)
            brandImage.backgroundColor = .white
        }
        
        brandLabel.text = viewModel?.car?.naming?.make
        modelLabel.text = viewModel?.car?.naming?.model
        chargeTripLabel.text = viewModel?.car?.naming?.chargetripVersion
        
        view.addSubview(carImage)
        view.addSubview(brandImage)
        view.addSubview(makeLabel)
        view.addSubview(brandLabel)
        view.addSubview(mLabel)
        view.addSubview(modelLabel)
        view.addSubview(chargeLabel)
        view.addSubview(chargeTripLabel)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {  //width= 390, height = 844
        carImage.frame = CGRect(x: 17, y: 140, width: 178*2, height: 100*2) //1536x864
        brandImage.frame = CGRect(x: 156.6, y: 350, width: 76.8, height: 43.2) // 768x432
        makeLabel.frame = CGRect(x: 0, y: 400, width: view.frame.width, height: 25)
        brandLabel.frame = CGRect(x: 0, y: 430, width: view.frame.width, height: 25)
        mLabel.frame = CGRect(x: 0, y: 480, width: view.frame.width, height: 25)
        modelLabel.frame = CGRect(x: 0, y: 510, width: view.frame.width, height: 25)
        chargeLabel.frame = CGRect(x: 0, y: 560, width: view.frame.width, height: 25)
        chargeTripLabel.frame = CGRect(x: 0, y: 590, width: view.frame.width, height: 25)
    }

}
