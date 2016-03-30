//
//  Character.swift
//  simpleGame
//
//  Created by Gabe at Work on 3/29/16.
//  Copyright © 2016 Gabe Hoffman. All rights reserved.
//

import Foundation


class Character {
    
    var maxHealth: Int = 100
    var maxAttack: Int = 100
    private var _hp: Int
    private var _attackPower: Int
    
    var attackPower: Int {
        get {
            return _attackPower
        }
    }
    
    var hp: Int {
        get {
            return _hp
        }
    }
    
    var isAlive: Bool {
        get {
            return (hp >= 0)
        }
    }
    
    init() {
        _hp = Int(arc4random_uniform(20)) + maxHealth
        _attackPower = Int(arc4random_uniform(25)) + maxAttack
    }
    
    init(startingHP: Int, attackPower: Int) {
        _hp = startingHP
        _attackPower = attackPower
    }
    
    init(maxHP: Int, maxAttack: Int) {
        _hp = (Int(arc4random_uniform(UInt32(maxHP))) + maxHP) / 2
        _attackPower = (Int(arc4random_uniform(UInt32(maxAttack))) + maxAttack) / 2
    }
    
    func attemptAttack(attackPower: Int) -> Bool {
        self._hp -= attackPower
        return true
    }
}