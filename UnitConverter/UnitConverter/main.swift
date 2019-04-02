//
//  main.swift
//  UnitConverter
//
//  Created by Doran & Dominic on 02/04/2019.
//  Copyright © 2019 hw. All rights reserved.
//
import Foundation

// input from user
let str = readLine()

// use to round
let numberOfPlaces = 4.0
let multiplier = pow(10.0, numberOfPlaces)


if str == nil {
    
} else {
    if str!.suffix(2) == "cm" {
        let doubleValue : Double = NSString(string: str! as NSString).doubleValue
        var result = Double(doubleValue/100)
        result = round(result * multiplier) / multiplier
        print ("\(result)m")
    } else { // else if str.suffix(1) == "m"
        let doubleValue : Double = NSString(string: str! as NSString).doubleValue
        var result = Double(doubleValue*100)
        result = round(result * multiplier) / multiplier
        print ("\(result)cm")
    }
}
