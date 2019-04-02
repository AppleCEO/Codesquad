//
//  main.swift
//  UnitConverter
//
//  Created by Doran & Dominic on 02/04/2019.
//  Copyright © 2019 hw. All rights reserved.
//
import Foundation


// use to round
let numberOfPlaces = 4.0
let multiplier = pow(10.0, numberOfPlaces)

// cm to m, m to cm
let cmTom:Double = 100
let inchToCm:Double = 2.54

// FUNCTION : convert centimeter To Meter
func convertCmToM (str: String) -> String {
    let doubleValue : Double = NSString(string: str as NSString).doubleValue
    var result = Double(doubleValue/cmTom)
    result = round(result * multiplier) / multiplier
    
    return "\(result)m"
}

// FUNCTION : convert Meter To centimeter
func convertMToCm (str: String ) -> String {
    let doubleValue : Double = NSString(string: str as NSString).doubleValue
    var result = Double(doubleValue*cmTom)
    result = round(result * multiplier) / multiplier
    
    return "\(result)cm"
}

// FUNCTION : convert Inch To Meter
func convertCmToInch (str: String) -> String {
    let doubleValue : Double = NSString(string: str as NSString).doubleValue
    var result = Double(doubleValue/inchToCm)
    result = round(result * multiplier) / multiplier
    
    return "\(result)inch"
}

// FUNCTION : convert Meter To centimeter
func convertInchToCm (str: String ) -> String {
    let doubleValue : Double = NSString(string: str as NSString).doubleValue
    var result = Double(doubleValue*inchToCm)
    result = round(result * multiplier) / multiplier
    
    return "\(result)cm"
}

// FUNCTION : unitConverter
func unitConverter() -> Void {
    // input from user
    var str = readLine()
    
    if str == nil {
        
    } else {
        if str!.suffix(7) == "cm inch" {
            str = convertCmToInch(str: String(str!))
            print(str!)
        } else if str!.suffix(6) == "inch m" {
            str = convertInchToCm(str: String(str!))
            str = convertCmToM(str: String(str!))
            print(str!)
        } else if str!.suffix(6) == "m inch" {
            str = convertMToCm(str: String(str!))
            str = convertCmToInch(str: String(str!))
            print(str!)
        } else if str!.suffix(2) == "cm" {
            str = convertCmToM(str: String(str!))
            print(str!)
        } else if str!.suffix(1) == "m" {
            str = convertMToCm(str: String(str!))
            print(str!)
        } else if str!.suffix(4) == "inch" {
            str = convertInchToCm(str: String(str!))
            print(str!)
        } else {
            print("지원하지 않는 단위입니다.")
            unitConverter()
        }
    }
}


// RUN
unitConverter()

