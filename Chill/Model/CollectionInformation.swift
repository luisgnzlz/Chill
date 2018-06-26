//
//  CollectionInformation.swift
//  Chill
//
//  Created by Luis Gonzalez on 6/10/18.
//  Copyright © 2018 Luis Gonzalez Jr. All rights reserved.
//

import Foundation
import UIKit

var arraydiscription = [3: "three", 5: "five", 0: "zero", 1: "one", 4: "four", 2: "two"]

struct info {
    
    var chillArray: [Int: String]
    var testCount: Int
    var othertest: Int
    
    init(discription: Dictionary<Int, String>) {
        arraydiscription = discription
        chillArray = arraydiscription
        testCount = arraydiscription.count
        othertest = 0
    }
    
    init() {
        chillArray = arraydiscription
        testCount = arraydiscription.count
        othertest = 0
    }
    
    init(runThrough: Int) {
        othertest = runThrough
        chillArray = arraydiscription
        testCount = arraydiscription.count
    }
}
