//
//  ViewController.swift
//  simpleGame
//
//  Created by Gabe at Work on 3/29/16.
//  Copyright © 2016 Gabe Hoffman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var printLabel: UILabel!
    @IBOutlet weak var playerHPLabel: UILabel!
    @IBOutlet weak var enemyHPLabel: UILabel!
    @IBOutlet weak var enemyImage: UIImageView!
    @IBOutlet weak var chestButton: UIButton!
    @IBOutlet weak var playerAttackLabel: UILabel!
    @IBOutlet weak var attackButton: UIButton!
    
    var player: Player!
    var enemy: Enemy!
    var checkMessage: String?
    
    @IBAction func onChestTapped(sender: AnyObject) {
        
        chestButton.hidden = true
        printLabel.text = checkMessage
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.generateRandomEnemy), userInfo: nil, repeats: false)
    }
    
    @IBAction func attackTapped(sender: AnyObject) {
        
        var currentAttack = Int(playerAttackLabel.text!)!
        currentAttack = (Int(arc4random_uniform(UInt32(currentAttack))) + currentAttack) / 2
    
        if enemy.attemptAttack(currentAttack) {
            printLabel.text = "Attacked \(enemy.type) for \(currentAttack)"
            enemyHPLabel.text = "\(enemy.hp) HP"
        } else {
            printLabel.text = "Attacked for \(currentAttack) Missed!"
        }
        
        if let loot = enemy.dropLoot() {
            player.addItemToInventory(loot)
            checkMessage = "\(player.name) found \(loot)"
            chestButton.hidden = false
        }
        
        if !enemy.isAlive {
            enemyHPLabel.text = ""
            printLabel.text = "Killed the \(enemy.type)"
            enemyImage.hidden = true
            attackButton.enabled = false
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        player = Player(name: "Aravir", hp: 120, attackPower: 20)
        
        generateRandomEnemy()
        
        playerHPLabel.text = "\(player.hp) HP"
        playerAttackLabel.text = "\(player.attackPower)"
    }

    func generateRandomEnemy() {
        print(enemyImage.image)
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0 {
            enemy = Kimara(maxHP: 60, maxAttack: 15)
        } else {
            enemy = Wizard(maxHP: 40, maxAttack: 30)
            
        }
        
        printLabel.text = "A \(enemy.type) has appeared!"
        enemyHPLabel.text = "\(enemy.hp) HP"
        enemyImage.hidden = false
        attackButton.enabled = true
    }

}

