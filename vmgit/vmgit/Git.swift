//
//  Git.swift
//  vmgit
//
//  Created by joon-ho kil on 4/22/19.
//  Copyright © 2019 길준호. All rights reserved.
//

import Foundation

struct Git {
    var repositoryName: [String]
    
    mutating func command (_ input: String) -> String {
        let inputs = input.split(separator: " ")
        let command = inputs[0]
        
        switch command {
        case "init": return commandInit(inputs)
        default: return "잘못된 명령어입니다."
        }
        
        return ""
    }
    
    private mutating func commandInit (_ inputs: [Substring]) -> String {
        if inputs.count != 2 {
            return "repository 이름에 공백이 들어갈 수 없습니다"
        }
        repositoryName.append(String(inputs[1]))
        return "created \(inputs[1]) repository."
    }
    
    
}
