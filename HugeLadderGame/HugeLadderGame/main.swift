//
//  main.swift
//  HugeLadderGame
//
//  Created by joon-ho kil on 5/3/19.
//  Copyright © 2019 길준호. All rights reserved.
//

import Foundation

struct HugeLadderGame {
    struct LadderPlayer {
        var name = ""
    }
    
    var height = 0
    var players = [LadderPlayer]()
    var ladders = [[Int]]()
    
    mutating func run() {
        self.height = InputView.readHeight()
        let names = InputView.readPlayerNames()
        self.players = names.map({LadderPlayer(name:$0)})
        generateLadders()
        printLadders()
    }
    
    mutating func generateLadders() {
        for row in 0..<height {
            ladders.append([Int]())
            for _ in 0..<players.count {
                let hasStep = Int(arc4random_uniform(2))
                ladders[row].append(hasStep)
            }
        }
    }
    
    func printLadders() {
        for row in ladders {
            print("|", terminator:"")
            for step in row {
                if step==1 {
                    print("---", "|", separator:"", terminator:"")
                }
                else {
                    print("   ", "|", separator:"", terminator:"")
                }
            }
            print()
        }
    }
}

var game = HugeLadderGame()
game.run()

