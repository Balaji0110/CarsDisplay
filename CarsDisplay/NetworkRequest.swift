//
//  NetworkRequest.swift
//  DisplayCars
//
//  Created by Balaji Peddaiahgari on 7/28/19.
//  Copyright © 2019 Balaji Peddaiahgari. All rights reserved.
//

import Foundation

class NetworkRequest {
    class func makeNetworkRequest(using url: URL, completion: (([Car])->Void)?) {
        URLSession.shared.dataTask(with: url) { (data, httpResponse, error) in
            guard let data = data, error == nil, httpResponse != nil else { return }
            do {
                let decoder = JSONDecoder()
                let downloadedCars = try decoder.decode(DisplayCars.self, from: data)
                completion?(downloadedCars.cars)
            } catch {
                print("\(error.localizedDescription)")
            }
        }.resume()
    }
}
