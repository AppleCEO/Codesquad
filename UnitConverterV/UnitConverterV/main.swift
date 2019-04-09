//
//  main.swift
//  UnitConverter
//
//  Created by Doran & Dominic on 02/04/2019.
//  Copyright © 2019 hw. All rights reserved.
//

import Foundation

 enum length:Double, CaseIterable {
    case cm = 1
    case m = 100
    case inch = 2.54
    case yard = 91.44
    
    var caseName: String {
        return Mirror(reflecting: self).children.first?.label ?? String(describing: self)
    }
    
    func convert(_ number: Double, _ from: String, _ to: String) -> [String:Double] {
        var result = number
        var result_dic = [String:Double]()
        
        for type in length.allCases {
            if from == type.caseName {
                 result *= type.rawValue
            }
        }
        
        let tos = to.split(separator: ",")
        
        for type in length.allCases {
            if tos.contains(String.SubSequence(type.caseName)) || to == "" {
                result /= type.rawValue
                result_dic[type.caseName] = result
            }
        }
        
        return result_dic
    }
}

enum weight:Double, CaseIterable {
    case g = 1
    case kg = 1000
    case lb = 453.59
    case oz = 28.35
    
    var caseName: String {
        return Mirror(reflecting: self).children.first?.label ?? String(describing: self)
    }
    
    func convert(_ number: Double, _ from: String, _ to: String) -> [String:Double] {
        var result = number
        var result_dic = [String:Double]()
        
        for type in weight.allCases {
            if from == type.caseName {
                result *= type.rawValue
            }
        }
        
        let tos = to.split(separator: ",")
        
        for type in weight.allCases {
            if tos.contains(String.SubSequence(type.caseName)) || to == "" {
                result /= type.rawValue
                result_dic[type.caseName] = result
            }
        }
        
        return result_dic
    }
}

enum volume:Double, CaseIterable {
    case l = 1
    case pt = 0.47
    case qt = 0.95
    case gal = 3.79
    
    var caseName: String {
        return Mirror(reflecting: self).children.first?.label ?? String(describing: self)
    }
    
    func convert(_ number: Double, _ from: String, _ to: String) -> [String:Double] {
        var result = number
        var result_dic = [String:Double]()
        
        for type in volume.allCases {
            if from == type.caseName {
                result *= type.rawValue
            }
        }
        
        let tos = to.split(separator: ",")
        
        for type in volume.allCases {
            if tos.contains(String.SubSequence(type.caseName)) || to == "" {
                result /= type.rawValue
                result_dic[type.caseName] = result
            }
        }
        
        return result_dic
    }
}

func convert (_ number: Double, _ from: String, _ to: String) -> [String:Double] {
    var result_dic = [String:Double]()
    
    for type in length.allCases {
        if from == type.caseName {
            let d = length.init(rawValue: 1)
            result_dic = d!.convert(number, from, to)
        }
    }
    for type in weight.allCases {
        if from == type.caseName {
            let d = weight.init(rawValue: 1)
            result_dic = d!.convert(number, from, to)
        }
    }
    for type in volume.allCases {
        if from == type.caseName {
            let d = volume.init(rawValue: 1)
            result_dic = d!.convert(number, from, to)
        }
    }
    
    if result_dic.count == 0 {
        result_dic["Error"] = 0
    }
    return result_dic
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

// 사용자로부터 데이터를 입력받는 함수
func userInput() -> String {
    print("변환이 가능한 단위 목록")
    print("길이 : ", terminator:"")
    for type in length.allCases {
        print(type, terminator:" ")
    }
    print(" 무게 : ", terminator:"")
    for type in weight.allCases {
        print(type, terminator:" ")
    }
    print(" 부피 : ", terminator:"")
    for type in volume.allCases {
        print(type, terminator:" ")
    }
    
    print("\n입력 : ", terminator:"")
    let input = readLine()
    
    
    if input == "quit" || input == "q" || input == nil {
        exit(0)
    }
    
    return input!
}

func unitConverter() -> Void {
    let input = userInput()
    let (num, unit) = inputsMaker(input)
    let (from, to) = unitsMaker(unit)
    let result = convert(num, from, to)
    for ( key, val ) in result {
        print("\(val)\(key)")
    }

    unitConverter()
}


// RUN
unitConverter()
