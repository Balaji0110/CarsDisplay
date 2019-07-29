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
    private var cars: [Car] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let jsonURL = url else { return }
        NetworkRequest.makeNetworkRequest(using: jsonURL) { (downloadedCars) in
            self.cars = downloadedCars
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */
}
