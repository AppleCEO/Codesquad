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
let cmtom:Double = 100

// FUNCTION : convert centimeter To Meter
func convertCmToM (str: String) -> Void {
    let doubleValue : Double = NSString(string: str as NSString).doubleValue
    var result = Double(doubleValue/cmtom)
    result = round(result * multiplier) / multiplier
    print ("\(result)m")
}

// FUNCTION : convert Meter To centimeter
func convertMToCm (str: String ) -> Void {
    let doubleValue : Double = NSString(string: str as NSString).doubleValue
    var result = Double(doubleValue*cmtom)
    result = round(result * multiplier) / multiplier
    print ("\(result)cm")
}


// FUNCTION : unitConverter
func unitConverter (input: String) -> Void {
    if str == nil {
        
    } else {
        if str!.suffix(2) == "cm" {
            convertCmToM(str: String(str!))
        } else if str!.suffix(1) == "m" {
            convertMToCm(str: String(str!))
        }
    }
}


// RUN
if let test = str {
    unitConverter(input: test)
}
