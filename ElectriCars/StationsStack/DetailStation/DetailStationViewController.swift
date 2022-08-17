//
//  DetailStationViewController.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 5/08/22.
//

import UIKit
import MapKit

class DetailStationViewController: UIViewController {
    
    var viewModel: DetailStationViewModel?
    let screen = Screens()
    let reviewTable = UITableView()
    let map = MKMapView()
    let pin = MKPointAnnotation()
    var show = true
//    let scrollView = UIScrollView()
//    let contentView = UIView()
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let stationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Station Details"
        label.font = .boldSystemFont(ofSize: 19)
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Name:"
        return label
    }()
    
    let nameStationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Address:"
//        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addressStationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    let cityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    let openLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"
        label.numberOfLines = 0
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let showButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("Station reviews:", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.layer.cornerRadius = 25
        button.setTitle("+", for: .normal)
        button.setTitleColor(.black, for: .normal)

        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMap()

        view.backgroundColor = .black

        reviewTable.backgroundColor = .orange
        nameStationLabel.text = viewModel?.station?.name
        addressStationLabel.text = viewModel?.station?.address
        cityLabel.text = (viewModel?.station?.city ?? "") + ", " + (viewModel?.station?.country ?? "")
        addButton.addTarget(self, action: #selector(didTapAddButton), for: .touchUpInside)
        setupViews()
        setupScrollView()
        reviewTable.delegate = self
        reviewTable.dataSource = self
//        reviewTable.register(ReviewTableViewCell.self, forCellReuseIdentifier: ReviewTableViewCell.identifier)
        reviewTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        reviewTable.isHidden = false
 
  
        view.addSubview(addButton)
        showButton.addTarget(self, action: #selector(didTapShowButton), for: .touchUpInside)
    }
    
    func setupScrollView(){
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            contentView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(scrollView)
            scrollView.addSubview(contentView)
            
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            scrollView.topAnchor.constraint(equalTo: map.bottomAnchor).isActive = true
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
}
    
    override func viewDidLayoutSubviews() { //width= 390, height = 844
        super.viewDidLayoutSubviews()

      
        addButton.frame = CGRect(x: 320, y: 700, width: 50, height: 50)

    }
    
    func setupViews(){
        
                stationLabel.translatesAutoresizingMaskIntoConstraints = false
                contentView.addSubview(stationLabel)
        //        stationLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
                stationLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
                stationLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        //        stationLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 7/8).isActive = true
                stationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        
                nameLabel.translatesAutoresizingMaskIntoConstraints = false
                contentView.addSubview(nameLabel)
        //        nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
                nameLabel.topAnchor.constraint(equalTo: stationLabel.bottomAnchor, constant: 25).isActive = true
                nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
                nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
                nameLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
                nameStationLabel.translatesAutoresizingMaskIntoConstraints = false
                contentView.addSubview(nameStationLabel)
        //        nameStationLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
                nameStationLabel.topAnchor.constraint(equalTo: stationLabel.bottomAnchor, constant: 25).isActive = true
                nameStationLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
                nameStationLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor).isActive = true
                nameStationLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
                addressLabel.translatesAutoresizingMaskIntoConstraints = false
                contentView.addSubview(addressLabel)
        //        addressLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
                addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15).isActive = true
                addressLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
                addressLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
                addressLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
                addressStationLabel.translatesAutoresizingMaskIntoConstraints = false
                contentView.addSubview(addressStationLabel)
        //        addressStationLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
                addressStationLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15).isActive = true
                addressStationLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
                addressStationLabel.leadingAnchor.constraint(equalTo: addressLabel.trailingAnchor).isActive = true
                addressStationLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
                cityLabel.translatesAutoresizingMaskIntoConstraints = false
                contentView.addSubview(cityLabel)
        //        cityLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
                cityLabel.topAnchor.constraint(equalTo: addressStationLabel.bottomAnchor, constant: 5).isActive = true
                cityLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
                cityLabel.leadingAnchor.constraint(equalTo: addressLabel.trailingAnchor).isActive = true
                cityLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
            
            contentView.addSubview(openLabel)
            openLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
            openLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 25).isActive = true
            openLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/4).isActive = true
//            openLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        
        contentView.addSubview(showButton)
//        showButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        showButton.topAnchor.constraint(equalTo: openLabel.bottomAnchor, constant: 25).isActive = true
        showButton.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        showButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        showButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
//        showButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

        reviewTable.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(reviewTable)
        reviewTable.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 20).isActive = true
        reviewTable.topAnchor.constraint(equalTo: showButton.bottomAnchor, constant: 10).isActive = true
        reviewTable.heightAnchor.constraint(equalToConstant: 200).isActive = true
        reviewTable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        }
    
    func setupMap() {
        
        view.addSubview(map)
                map.translatesAutoresizingMaskIntoConstraints = false
                map.topAnchor.constraint(equalTo: view.topAnchor, constant: 90).isActive = true
        //        map.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
                map.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/4).isActive = true
                map.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
                map.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        
                if let lat = viewModel?.station?.location?.coordinates[1], let long = viewModel?.station?.location?.coordinates[0] {
                    let center = CLLocationCoordinate2D(latitude: lat, longitude: long)
                    pin.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
                    map.addAnnotation(pin)
                    let centerRegion = MKCoordinateRegion.init(center: center, latitudinalMeters: 100000, longitudinalMeters: 100000)
                    map.setRegion(centerRegion, animated: true)
                }
        
        
    }
    @objc private func didTapAddButton() {
        viewModel?.goToReview()
    }
    
    @objc private func didTapShowButton() {
        show = !show
        reviewTable.isHidden = show
        print("carga")
        reviewTable.reloadData()
    }
}

extension DetailStationViewController: UITableViewDelegate {
    
//    func numberOfSections(in tableView: UITableView) -> Int {
////        if show {
////            print("secciones")
//            return 1
////        } else {
////            return 0
////        }
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        if show {
//            return 5
//        } else {
//            return 0
//        }
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}

extension DetailStationViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: ReviewTableViewCell.identifier, for: indexPath) as? ReviewTableViewCell else {
//            return UITableViewCell()
//        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .white
        cell.textLabel?.text = "Celda \(indexPath.row)"
        print("pinta")
            return cell
      
//
//        cell.station = viewModel?.station
//print("celdas")
//        return cell
    }
    
    
}
