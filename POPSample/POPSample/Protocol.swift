//
//  Protocol.swift
//  POPSample
//
//  Created by joon-ho kil on 5/14/19.
//  Copyright © 2019 길준호. All rights reserved.
//

import Foundation

protocol Moveable {
    func go(to destination: String)
}

protocol NeedFare {
    var charge: Int { get }
}

extension Moveable {
    func go(to destination: String) {
        print("\(destination)(으)로 갑니다.")
    }
    
    var numberOfPassangers: Int {
        return 4
    }
}

protocol OnBoarding {
    var numberOfPassangers: Int { get }
}

extension Moveable where Self: NeedFare {
    func go(to destination: String) {
        print("요금은 \(charge)입니다.")
        print("\(destination)(으)로 갑니다.")
    }
}

typealias Carable = Moveable & OnBoarding

struct Car: Carable { }
struct Bus: Carable, NeedFare {
    var charge: Int = 1200
}
