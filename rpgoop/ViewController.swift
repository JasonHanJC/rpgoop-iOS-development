//
//  ViewController.swift
//  rpgoop
//
//  Created by Jason miew on 1/25/16.
//  Copyright © 2016 Jason miew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var printLbl: UILabel!
    @IBOutlet weak var playHpLbl: UILabel!
    @IBOutlet weak var enemyHpLbl: UILabel!
    @IBOutlet weak var enemyImg: UIImageView!
    
    @IBOutlet weak var cheseBtn: UIButton!
    
    var player: Player!
    var enemy: Enemy!
    var cheseMessege: String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        player = Player(name: "DirtyLaundry", hp: 110, attackPwr: 20)
        
        generateRandomEnemy()
        
        playHpLbl.text = "\(player.hp) HP"
    }
    
    func generateRandomEnemy() {
        
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0 {
            enemy = Kimara(startingHp: 50, attackPwr: 12)
            enemyImg.image = UIImage(named: "enem1")
        } else {
            enemy = DevilWizard(startingHp: 60, attackPwr: 16)
            enemyImg.image = UIImage(named: "enem2")
        }
        
        enemyHpLbl.text = "\(enemy.hp) HP"
        enemyImg.hidden = false
    }

    

    @IBAction func onChaseBtnPressed(sender: AnyObject) {
        cheseBtn.hidden = true
        printLbl.text = cheseMessege
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "generateRandomEnemy", userInfo: nil, repeats: false)
    }

    @IBAction func attackTapped(sender: AnyObject) {
        
        if enemy.attemptAttack(player.attackPwr) {
            printLbl.text = "Attacked \(enemy.type) for \(player.attackPwr) HP"
            enemyHpLbl.text = "\(enemy.hp) HP"
        } else {
            printLbl.text = "Attacked was unsuccessful!"
        }
        
        if let loot = enemy.dropLoot() {
            player.addItemToInventory(loot)
            cheseMessege = "\(player.name) found \(loot)"
            cheseBtn.hidden = false;
        }
        
        if !enemy.isAlive {
            enemyHpLbl.text = ""
            printLbl.text = "Killed \(enemy.type)"
            enemyImg.hidden = true
        }
    }
}

