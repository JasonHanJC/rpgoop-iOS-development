//
//  DevilWizard.swift
//  rpgoop
//
//  Created by Jason miew on 1/25/16.
//  Copyright © 2016 Jason miew. All rights reserved.
//

import Foundation

class DevilWizard: Enemy {
    override var loot: [String] {
        return ["Magic wand", "Dark Amulet"]
    }
    
    override var type: String {
        return "Devil Wizard"
    }
}