//
//  addReviewViewController.swift
//  ElectriCars
//
//  Created by Andres Orjuela on 9/08/22.
//

import UIKit

class AddReviewViewController: UIViewController {

    let rating = ["1", "2", "3", "4", "5"]
    
  
    let selectLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Select a rating:"
        
        return label
    }()
    
    let ratingPickerView: UIPickerView = {
        let picker = UIPickerView()
//        picker.tintColor = .white
        picker.backgroundColor = .white
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ratingPickerView.delegate = self
        ratingPickerView.dataSource = self
 
        view.backgroundColor = .darkGray
        
        selectLabel.frame = CGRect(x: 50, y: 120, width: 200, height: 20)
        ratingPickerView.frame = CGRect(x: 40, y: 150, width: 310, height: 50) //width= 390, height = 844

        view.addSubview(selectLabel)
        view.addSubview(ratingPickerView)
  
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    
    }
    
}

extension AddReviewViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return rating[row]
    }
}

extension AddReviewViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return rating.count
    }
    
    
}
