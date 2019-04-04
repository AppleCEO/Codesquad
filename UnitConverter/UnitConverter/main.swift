//
//  main.swift
//  UnitConverter
//
//  Created by Doran & Dominic on 02/04/2019.
//  Copyright © 2019 hw. All rights reserved.
//
import Foundation
import Darwin

// feet
let mToCm:Double = 100
let inchToCm:Double = 2.54
let yardToCm:Double = 91.44


func convert (_ arr : (doubleValue: Double, feet: String), mode: String) -> (Double, String) {
    switch mode {
    case "CmToM" :
        return (arr.doubleValue/mToCm, "m")
    case "MToCm" :
        return (arr.doubleValue*mToCm, "cm")
    case "CmToInch" :
        return (arr.doubleValue/inchToCm, "inch")
    case "InchToCm" :
        return (arr.doubleValue*inchToCm, "cm")
    case "CmToYard" :
        return (arr.doubleValue/yardToCm, "yard")
    case "YardToCm" :
        return (arr.doubleValue*yardToCm, "cm")
    default :
        print("지원하지 않는 모드입니다")
        unitConverter()
        return (arr.doubleValue, "a")
    }
}


func unitConverter() -> Void {
    // input from user
    let str = readLine()
    
    let inputNumber : Double = NSString(string: str! as NSString).doubleValue
    var inputTuple = (0.0, "start")
    
    if str == nil {
        
    } else {
        if str!.suffix(7) == "cm inch" {
            inputTuple = convert( (inputNumber, "cm"), mode: "CmToInch")
        } else if str!.suffix(6) == "inch m" {
            inputTuple = convert( (inputNumber, "inch"), mode: "InchToCm")
            inputTuple = convert(inputTuple, mode: "CmToM")
        } else if str!.suffix(6) == "m inch" {
            inputTuple = convert( (inputNumber, "m"), mode: "MToCm")
            inputTuple = convert(inputTuple, mode: "CmToInch")
        } else if str!.suffix(6) == "yard m" || str!.suffix(4) == "yard" {
            inputTuple = convert((inputNumber, "yard"), mode: "YardToCm")
            inputTuple = convert(inputTuple, mode: "CmToM")
        } else if str!.suffix(6) == "m yard" {
            inputTuple = convert((inputNumber, "m"), mode: "MToCm")
            inputTuple = convert(inputTuple, mode: "CmToYard")
        } else if str!.suffix(2) == "cm" {
            inputTuple = convert((inputNumber, "cm"), mode: "CmToM")
        } else if str!.suffix(1) == "m" {
            inputTuple = convert((inputNumber, "m"), mode: "MToCm")
        } else if str!.suffix(4) == "inch" {
            inputTuple = convert((inputNumber, "inch"), mode: "InchToCm")
        } else if str! == "quit" || str! == "q" {
            exit(0)
        } else {
            print("지원하지 않는 단위입니다.")
        }
        print("\(inputTuple.0)\(inputTuple.1)")
        unitConverter()
    }
}


// RUN
unitConverter()

