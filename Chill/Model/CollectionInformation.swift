//
//  CollectionInformation.swift
//  Chill
//
//  Created by Luis Gonzalez on 6/10/18.
//  Copyright © 2018 Luis Gonzalez Jr. All rights reserved.
//

import Foundation
import UIKit

let userDefaults = UserDefaults.standard

struct info {
    
    var discriptionArray = [String]()
    var latitudeArray = [Double]()
    var longituteArray = [Double]()
    var ListlatitudeArray = [Double]()
    var ListlongituteArray = [Double]()
    var DateArray = [Date]()
    var discriptionString = [String]()
    var discriptionNumber: Int?
    var lat = Double()
    var long = Double()
    var date = Date()
    
    init() {
        discriptionString = userDefaults.stringArray(forKey: "discription") ?? [String]()
        ListlatitudeArray = userDefaults.array(forKey: "latitude") as? [Double] ?? [Double]()
        ListlongituteArray = userDefaults.array(forKey: "longitute") as? [Double] ?? [Double]()
        discriptionNumber = discriptionString.count
    }
    
    init(newDis: String, lat:Double, long:Double) {
        discriptionArray = userDefaults.stringArray(forKey: "discription") ?? [String]()
        discriptionArray.append(newDis)
        userDefaults.set(discriptionArray, forKey: "discription")
        latitudeArray = userDefaults.array(forKey: "latitude") as? [Double] ?? [Double]()
        latitudeArray.append(lat)
        userDefaults.set(latitudeArray, forKey: "latitude")
        longituteArray = userDefaults.array(forKey: "longitute") as? [Double] ?? [Double]()
        longituteArray.append(long)
        userDefaults.set(longituteArray, forKey: "longitute")
    }
    init(delete: Int) {
        discriptionArray = userDefaults.stringArray(forKey: "discription") ?? [String]()
        discriptionArray[delete] = "No Need For the Memory"
        userDefaults.set(discriptionArray, forKey: "discription")
    }

}
