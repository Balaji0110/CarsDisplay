//
//  CarsDisplayViewController.swift
//  CarsDisplay
//
//  Created by Balaji Peddaiahgari on 7/28/19.
//  Copyright © 2019 Balaji Peddaiahgari. All rights reserved.
//

import UIKit

class CarsDisplayViewController: UITableViewController {
    final let url = URL(string: "https://carfax-for-consumers.firebaseio.com/assignment.json")
    private var cars: [Car] = [] {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let jsonURL = url else { return }
        NetworkRequest.makeNetworkRequest(using: jsonURL) { (downloadedCars) in
            self.cars = downloadedCars
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cars.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarCell", for: indexPath) as! CarCell
        let car = cars[indexPath.row]
        cell.carViewModel = CarViewModel(car: car)
        return cell
    }
}
