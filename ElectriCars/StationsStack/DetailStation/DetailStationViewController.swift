//
//  DetailStationViewController.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 5/08/22.
//

import UIKit
import MapKit

protocol DetailStationViewControllerDelegate {
    
    func reloadTable()
}

final class DetailStationViewController: UIViewController {
    
    var viewModel: DetailStationViewModel?
    let screen = Screens()
    private let reviewTable = UITableView(frame: .zero, style: .grouped)
    private let map = MKMapView()
    private let pin = MKPointAnnotation()
    
    private let showButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("Station reviews:", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let addButton: UIButton = {
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
        
        viewModel?.loadReviews()
        setupTable()
        setupButton()
        addButton.addTarget(self, action: #selector(didTapAddButton), for: .touchUpInside)
        showButton.addTarget(self, action: #selector(didTapShowButton), for: .touchUpInside)
    }
    
    //MARK: Button constraints
    
    func setupButton() {
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addButton)
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 650),
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 300),
            addButton.heightAnchor.constraint(equalToConstant: 50),
            addButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    //MARK: Map configuration
    
    func setupMap() {
        
        view.addSubview(map)
        map.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            map.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            map.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/4),
            map.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            map.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
        if let lat = viewModel?.station?.coordinates?[1], let long = viewModel?.station?.coordinates?[0] {
            let center = CLLocationCoordinate2D(latitude: lat, longitude: long)
            pin.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
            map.addAnnotation(pin)
            let centerRegion = MKCoordinateRegion.init(center: center, latitudinalMeters: 100000, longitudinalMeters: 100000)
            map.setRegion(centerRegion, animated: true)
        }
    }
    
    //MARK: Table constraints
    
    func setupTable () {
        
        view.addSubview(reviewTable)
        reviewTable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            reviewTable.topAnchor.constraint(equalTo: map.bottomAnchor, constant: 5),
            reviewTable.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            reviewTable.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            reviewTable.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        reviewTable.backgroundColor = .black
        reviewTable.delegate = self
        reviewTable.dataSource = self
        reviewTable.register(ReviewTableViewCell.self, forCellReuseIdentifier: ReviewTableViewCell.identifier)
        reviewTable.register(DetailTableHeader.self, forHeaderFooterViewReuseIdentifier: DetailTableHeader.identifier)
    }
    
    @objc private func didTapAddButton() {
        viewModel?.goToReview(delegate: self)
    }
    
    @objc private func didTapShowButton() {
  //
    }
}

//MARK: Table configuration

extension DetailStationViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.reviews.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: DetailTableHeader.identifier) as? DetailTableHeader
        header?.station = viewModel?.station
        return header
    }
}

extension DetailStationViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ReviewTableViewCell.identifier, for: indexPath) as? ReviewTableViewCell else {
            return UITableViewCell()
        }
        cell.review = viewModel?.reviews[indexPath.row]
        return cell
    }
}

//MARK: Extensions delegate

extension DetailStationViewController: DetailStationViewControllerDelegate {
    
    func reloadTable() {
        DispatchQueue.main.async {
            self.reviewTable.reloadData()
        }
    }
}

extension DetailStationViewController: AddReviewDelegate {
    func didCreateReview() {
        viewModel?.loadReviews()
    }
}
