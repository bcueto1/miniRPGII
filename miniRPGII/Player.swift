//
//  Player.swift
//  miniRPGII
//
//  Created by Brian Cueto on 8/22/16.
//  Copyright © 2016 Brian Cueto. All rights reserved.
//

import Foundation

class Player {
    
    private var _name = "Player"
    private var _HP = 100
    private var _attackPwr = 10
    
    var name: String {
        get {
            return _name
        }
    }
    
    var HP: Int {
        get {
            return _HP
        }
    }
    
    var attackPwr: Int {
        get {
            return _attackPwr
        }
    }
    
    var isAlive: Bool {
        get {
            if HP <= 0 {
                return false
            } else {
                return true
            }
        }
    }
    
    func attemptAttack(attack: Int) -> Bool {
        _HP -= attack
        return true
    }
    
}
