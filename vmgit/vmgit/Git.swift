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
    var workingDirectory: [String: [String: Date]]
    var stagingArea: [String: [String: Date]]
    var gitRepository: [String: [String: Date]]
    var log: [String: [String: Date]]
    
    init() {
        self.repositoryNames = []
        self.currentRepository = ""
        self.workingDirectory = [String: [String: Date]]()
        self.stagingArea = [String: [String: Date]]()
        self.gitRepository = [String: [String: Date]]()
        self.log = [String: [String: Date]]()
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
        case "add": return commandAdd(inputs)
        case "new": return commandNew(inputs)
        case "commit": return commandCommit(inputs)
        case "log": return commandLog(inputs)
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
        if currentRepository == "" {
            return whenCurrentRepositoryEmptyCommandStatus(inputs)
        }
        var status: String = "---Working Directory/\n"
        if workingDirectory[currentRepository]?.count ?? 0 > 0 {
            for file in workingDirectory[currentRepository]! {
                status += "\(file.key)    \(file.value)\n"
            }
        }
        status += "---Staging Area/\n"
        if stagingArea[currentRepository]?.count ?? 0 > 0 {
            for file in stagingArea[currentRepository]! {
                status += "\(file.key)    \(file.value)\n"
            }
        }
        status += "---Git Repository/\n"
        if gitRepository[currentRepository]?.count ?? 0 > 0 {
            for file in gitRepository[currentRepository]! {
                status += "\(file.key)    \(file.value)\n"
            }
        }
        
        return status
    }
    
    private func returnRepositoryList () -> String {
        var repositoryList:String = ""
        
        if repositoryNames.count == 1 {
            return repositoryNames[0] + "/"
        }
        
        for repositoryName in repositoryNames {
            repositoryList += repositoryName + "/\n"
        }
        
        return repositoryList
    }
    
    private mutating func commandCheckout (_ inputs: [String]) -> String {
        if inputs.count == 2 && repositoryNames.contains(inputs[1]) {
            currentRepository = inputs[1]
            return "current repository is changed to \(inputs[1])"
        }
        
        currentRepository = ""
        
        return ""
    }
    
    private mutating func commandAdd (_ inputs: [String]) -> String {
        if ((workingDirectory[currentRepository]?[inputs[1]]) == nil) {
            return "해당 파일이 없습니다."
        }
        
        workingDirectory[currentRepository]?.removeValue(forKey: inputs[1])
        if stagingArea[currentRepository]?.count ?? 0 > 0 {
            stagingArea[currentRepository]?[inputs[1]] = Date.init()
        } else {
            stagingArea[currentRepository] = [inputs[1]:Date.init()]
        }
        
        var message = "---Staging Area/\n"
        if stagingArea[currentRepository]?.count ?? 0 > 0 {
            for file in stagingArea[currentRepository]! {
                message += "\(file.key)    \(file.value)\n"
            }
        }
        return message
    }
    
    private mutating func commandNew (_ inputs: [String]) -> String {
        if inputs.count != 2 {
            return "file 이름에 공백이 들어갈 수 없습니다"
        }
        if workingDirectory[currentRepository]?.count ?? 0 > 0 {
            workingDirectory[currentRepository]?[inputs[1]] = Date.init()
        } else {
            workingDirectory[currentRepository] = [inputs[1]:Date.init()]
        }
    
        return ""
    }
    
    private mutating func commandCommit (_ inputs: [String]) -> String {
        if  stagingArea[currentRepository]?.count == 0 {
            return "Staging Area 가 비어있습니다. add 를 먼저 해주세요."
        }
        let current = Date.init()
        
        var commitMessage = ""
        for index in 1..<inputs.count {
            commitMessage += "\(inputs[index]) "
        }
        commitMessage.removeLast()
        
        if log[currentRepository]?.count ?? 0 > 0 {
            log[currentRepository]?[commitMessage] = current
        } else {
            log[currentRepository] = [commitMessage:current]
        }
        
        var message = "---commit files/\n"
        for file in stagingArea[currentRepository]! {
            if gitRepository[currentRepository]?.count ?? 0 > 0 {
                gitRepository[currentRepository]?[file.key] = current
            } else {
                gitRepository[currentRepository] = [file.key:current]
            }
            stagingArea[currentRepository]?.removeValue(forKey: file.key)
            message += "\(file.key)    \(file.value)\n"
        }
        
        return message
    }
    
    private func commandLog (_ inputs: [String]) -> String {
        var message = ""
        
        if inputs.count != 1 {
            return "log 뒤에는 다른 명령어를 적을 수 없습니다."
        }
        if log[currentRepository]?.count == 0 {
            return "아직 commit 로그가 없습니다."
        }
        for logMessage in log[currentRepository]! {
            message += "commit \"\(logMessage.key)\"\n"
            message += makeLogMessage(logMessage)
        }
        
        return message
    }
    
    private func whenCurrentRepositoryEmptyCommandStatus (_ inputs: [String]) -> String {
        if inputs.count == 1 {
            return returnRepositoryList()
        }
        if inputs.count == 3  && inputs[1] == "local" {
            if repositoryNames.contains(inputs[2]) {
                return "아직 파일이 없습니다."
            }
            return returnRepositoryList()
        }
        
        return "status 를 수행하던 중 문제가 발생했습니다."
    }
    
    private func makeLogMessage (_ logMessage: (key: String, value: Date)) -> String {
        var message = ""
        
        for (key, value) in gitRepository[currentRepository]! {
            if value == logMessage.value {
                message += "\(key)    \(logMessage.value)\n"
            }
        }
        
        return message
    }
}
