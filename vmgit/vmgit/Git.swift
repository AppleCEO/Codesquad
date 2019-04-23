//
//  Git.swift
//  vmgit
//
//  Created by joon-ho kil on 4/22/19.
//  Copyright © 2019 길준호. All rights reserved.
//

import Foundation

struct Git {
    var repositoryNames: [String]
    var currentRepository: String
    
    init() {
        self.repositoryNames = []
        self.currentRepository = ""
    }
    
    mutating func command (_ inputEntered: String) -> String {
        let inputSplit = inputEntered.split(separator: " ")
        var inputs = [String]()
        
        for input in inputSplit {
            inputs.append(String(input))
        }
        
        let command = inputs[0]
        
        switch command {
        case "init": return commandInit(inputs)
        case "status": return commandStatus(inputs)
        case "checkout": return commandCheckout(inputs)
        default: return "잘못된 명령어입니다."
        }
        
        return ""
    }
    
    private mutating func commandInit (_ inputs: [String]) -> String {
        if inputs.count != 2 {
            return "repository 이름에 공백이 들어갈 수 없습니다"
        }
        repositoryNames.append(inputs[1])
        return "created \(inputs[1]) repository."
    }
    
    private mutating func commandStatus (_ inputs: [String]) -> String {
        
        if inputs.count == 1 {
            return returnRepositoryList()
        } else if inputs.count == 3  && inputs[1] == "local" {
            if repositoryNames.contains(inputs[2]) {
                return "아직 파일이 없습니다."
            } else {
                return returnRepositoryList()
            }
        } else {
            return "status 를 수행하던 중 문제가 발생했습니다."
        }
    }
    
    private func returnRepositoryList () -> String {
        var repositoryList:String = ""
        
        if repositoryNames.count == 1 {
            return repositoryNames[0] + "/"
        } else {
            for repositoryName in repositoryNames {
                repositoryList += repositoryName + "/\n"
            }
            return repositoryList
        }
    }
    
    private mutating func commandCheckout (_ inputs: [String]) -> String {
        if inputs.count == 2 && repositoryNames.contains(inputs[1]) {
            currentRepository = inputs[1]
            return "current repository is changed to \(inputs[1])"
        } else {
            currentRepository = ""
            return ""
        }
    }
}
