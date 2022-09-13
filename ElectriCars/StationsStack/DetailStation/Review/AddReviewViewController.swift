//
//  addReviewViewController.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 9/08/22.
//

import UIKit

protocol AddReviewDelegate {
    
    func didCreateReview()
}

final class AddReviewViewController: UIViewController {
    
    var viewModel: AddReviewViewModel?
    
    let service = Services(network: Network())
    
    var message: String = ""
    var rating: Int = 1
    
    var delegate: AddReviewDelegate?
    
    private let reviewTextField = UITextField()
    
    private let selectLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Select a rating:"
        return label
    }()
    
    private let ratingPickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.backgroundColor = .white
        return picker
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .purple
        button.layer.cornerRadius = 3
        button.setTitle("Add review", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Add review"
        view.backgroundColor = .darkGray
        setupPicker()
        setupSubviews()
        addButton.addTarget(self, action: #selector(didTapAddButton), for: .touchUpInside)
    }
    
    //MARK: Add button
    
    @objc private func didTapAddButton() {
        
        message = reviewTextField.text ?? ""
        
        if message != "" {
            
                viewModel?.pushReview(rating: rating, message: message)
                delegate?.didCreateReview()
        }
        else {
            print("Review empty")
        }
        reviewTextField.text = nil
    }
    
    //MARK: Picker configure
    
    func setupPicker() {
        
        ratingPickerView.delegate = self
        ratingPickerView.dataSource = self
        reviewTextField.placeholder = "Add your review"
        reviewTextField.borderStyle = UITextField.BorderStyle.line
        reviewTextField.backgroundColor = .white
    }
    
    //MARK: Subviews constraints
    
    func setupSubviews() {
        
        selectLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(selectLabel)
        NSLayoutConstraint.activate([
            selectLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            selectLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            selectLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 3/4),
            selectLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        ratingPickerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ratingPickerView)
        NSLayoutConstraint.activate([
            ratingPickerView.topAnchor.constraint(equalTo: selectLabel.bottomAnchor, constant: 5),
            ratingPickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ratingPickerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 3/4),
            ratingPickerView.heightAnchor.constraint(equalToConstant: 55)
        ])
        
        reviewTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(reviewTextField)
        NSLayoutConstraint.activate([
            reviewTextField.topAnchor.constraint(equalTo: ratingPickerView.bottomAnchor, constant: 100),
            reviewTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            reviewTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 3/4),
            reviewTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addButton)
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: reviewTextField.bottomAnchor, constant: 15),
            addButton.widthAnchor.constraint(equalToConstant: 100),
            addButton.trailingAnchor.constraint(equalTo: reviewTextField.trailingAnchor),
            addButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

//MARK: Picker extensions

extension AddReviewViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel?.ratings[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        rating = row + 1
    }
}

extension AddReviewViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel?.ratings.count ?? 0
    }
}
