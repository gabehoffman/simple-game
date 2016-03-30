//
//  Wizard.swift
//  simpleGame
//
//  Created by Gabe at Work on 3/29/16.
//  Copyright © 2016 Gabe Hoffman. All rights reserved.
//

import Foundation

class Wizard: Enemy {
    
    override var loot: [String] {
        return ["Magic Wand", "Dark Amulet", "Magic Bacon"]
    }
    
    override var type: String {
        return "Wizard"
    }
    
    
}