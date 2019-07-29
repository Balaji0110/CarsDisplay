//
//  ViewModel.swift
//  DisplayCars
//
//  Created by Balaji Peddaiahgari on 7/28/19.
//  Copyright © 2019 Balaji Peddaiahgari. All rights reserved.
//

import Foundation
import UIKit

class CarViewModel {
    let car: Car
    init(car: Car) {
        self.car = car
    }
    
    var carModelString: NSAttributedString {
        let year = String(car.year)
        let make = car.make
        let model = car.model
        let trim = car.trim
        let carModelString = year + " " + make + " " + model + " " + trim
        let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)]
        let carModelAttributedString = NSAttributedString(string: carModelString, attributes: attrs)
        return carModelAttributedString
    }
    
    var carDetailedInformation: NSAttributedString {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let priceString = formatter.string(from: NSNumber(value: car.price))! + " "
        let dollarPriceString = "$" + priceString + " "
        let mileageString = formatter.string(from: NSNumber(value: car.mileage))!
        let city = car.dealer.city
        let state = car.dealer.state
        let mileageLocationString = "| " + mileageString + " Mi " + "| " + city + ", " + state
        let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)]
        let secondAttrs = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)]
        let firstString = NSMutableAttributedString(string: dollarPriceString, attributes: attrs)
        let secondString = NSAttributedString(string: mileageLocationString, attributes: secondAttrs)
        firstString.append(secondString)
        return firstString
    }
    
    var url: URL? {
        if let carImages = car.carImages {
            let urlArray = carImages.mediumSizeImageArray
            if let urlArray = urlArray {
                return urlArray[0]
            }
        }
        return nil
    }
    
    var getPhoneNumber: String {
        return car.dealer.phone
    }
    
    func asyncLoad(imageView: UIImageView) {
        guard let url = self.url else { return }
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        imageView.image = image
                    }
                }
            }
        }
    }
    
    
    func getFormattedPhoneNumber() -> String? {
        let sourcePhoneNumber = getPhoneNumber
        let length = sourcePhoneNumber.count
        // Check phone number length
        guard length == 10  else { return nil }
        // Area code
        var areaCode = ""
        var sourceIndex = 0
        let areaCodeLength = 3
        guard let areaCodeSubstring = sourcePhoneNumber.substring(start: sourceIndex, offsetBy: areaCodeLength) else { return nil }
        areaCode = String(format: "(%@) ", areaCodeSubstring)
        sourceIndex += areaCodeLength
        
        // Prefix, 3 characters
        let prefixLength = 3
        guard let prefix = sourcePhoneNumber.substring(start: sourceIndex, offsetBy: prefixLength) else { return nil
        }
        sourceIndex += prefixLength
        // Suffix, 4 characters
        let suffixLength = 4
        guard let suffix = sourcePhoneNumber.substring(start: sourceIndex, offsetBy: suffixLength) else {
            return nil
        }
        return areaCode + prefix + "-" + suffix
    }
}

extension String {
    internal func substring(start: Int, offsetBy: Int) -> String? {
        guard let substringStartIndex = self.index(startIndex, offsetBy: start, limitedBy: endIndex) else {
            return nil
        }
        
        guard let substringEndIndex = self.index(startIndex, offsetBy: start + offsetBy, limitedBy: endIndex) else {
            return nil
        }
        return String(self[substringStartIndex ..< substringEndIndex])
    }
}
