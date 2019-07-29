//
//  CarCell.swift
//  DisplayCars
//
//  Created by Balaji Peddaiahgari on 7/27/19.
//  Copyright © 2019 Balaji Peddaiahgari. All rights reserved.
//

import UIKit

class CarCell: UITableViewCell {
    
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var carModelLabel: UILabel!
    @IBOutlet weak var carDetailedLabel: UILabel!
    @IBOutlet weak var phoneNumber: UIButton!
    
    var carViewModel: CarViewModel! {
        didSet {
            updateUI()
        }
    }
    
    private func updateUI() {
        carViewModel.asyncLoad(imageView: carImage)
        carModelLabel.attributedText = carViewModel.carModelString
        carDetailedLabel.attributedText = carViewModel.carDetailedInformation
        if let number = carViewModel.getFormattedPhoneNumber() {
            phoneNumber.setTitle(number, for: .normal)
        }
    }
    
}
