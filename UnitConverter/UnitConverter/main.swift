//
//  main.swift
//  UnitConverter
//
//  Created by Doran & Dominic on 02/04/2019.
//  Copyright © 2019 hw. All rights reserved.
//

import Foundation
import Darwin

let mToCm:Double = 100
let inchToCm:Double = 2.54
let yardToCm:Double = 91.44

func convert (_ num: Double, _ from: String, _ to: String) -> (Double, String) {
    var result = (num, to)
    
    switch from {
    case "cm" :
        result = convertFromCm((num, to))
    case "m" :
        result = convertFromM((num, to))
    case "inch" :
        result = convertFromInch((num, to))
    case "yard":
        result = convertFromYard((num, to))
    default :
        unavailableFeet()
    }
    
    return result
}

func unavailableFeet() {
    print("지원하지 않는 단위입니다")
    unitConverter()
    exit(0)
}

func convertFromCm (_ input: (number: Double, to: String) ) -> (Double, String) {
    var result = (input.number, input.to)
    
    switch input.to {
    case "yard":
        result.0 = input.number/yardToCm
    case "inch":
        result.0 = input.number/inchToCm
    case "", "m":
        result.0 = input.number/mToCm
        result.1 = "m"
    default:
        unavailableFeet()
    }
    
    return result
}

func convertFromM (_ input: (number: Double, to: String) ) -> (Double, String) {
    var result = (input.number, input.to)
    
    switch input.to {
    case "yard":
        result = convertFromM((input.number, "cm"))
        result = convertFromCm((result.0, input.to))
    case "inch":
        result = convertFromM((input.number, "cm"))
        result = convertFromCm((result.0, input.to))
    case "", "cm":
        result = (input.number*mToCm, "cm")
    default:
        unavailableFeet()
    }
    
    return result
}

func convertFromInch (_ input: (number: Double, to: String) ) -> (Double, String) {
    var result = (input.number, input.to)
    
    switch input.to {
    case "m":
        result = convertFromInch((input.number, "cm"))
        result = convertFromCm((result.0, input.to))
    case "","cm":
        result = (input.number*inchToCm, "cm")
    default:
        unavailableFeet()
    }
    
    return result
}

func convertFromYard (_ input: (number: Double, to: String) ) -> (Double, String) {
    var result = (input.number, input.to)
    
    switch input.to {
    case "","m":
        result = (input.number*yardToCm, "m")
        result = convertFromCm(result)
    default:
        unavailableFeet()
    }
    
    return result
}

// 입력받아 숫자와 단위를 구분하는 함수
func inputsMaker(_ `in` : String)->(Double, String){
    let unit = `in`.trimmingCharacters(in: CharacterSet(charactersIn: "0123456789."))
    let numDouble:Double = Double(`in`.trimmingCharacters(in: CharacterSet(charactersIn: unit))) ?? 0.0
    
    if(numDouble == 0.0){
        print("숫자를 정확히 입력해주세요.")
        unitConverter()
    }
    
    return (numDouble, unit)
}

// 단위를 자르는 함수
func unitsMaker(_ unit : String)->(String, String){
    var units = unit.split(separator: " ")
    if(units.count<2) {
        let unitDiff = 2-units.count
        for _ in 0..<unitDiff {
            units.append("")
        }
    }
    
    return (String(units[0]), String(units[1]))
}


func unitConverter() -> Void {
    let inputFromUser = readLine()
    
    if inputFromUser == "quit" || inputFromUser == "q" {
        exit(0)
    }
    if let input = inputFromUser {
        let (num, unit) = inputsMaker(input)
        let (from, to) = unitsMaker(unit)
        
        let result = convert(num, from, to)
        print("\(result.0)\(result.1)")
        
        unitConverter()
    }
}


// RUN
unitConverter()

