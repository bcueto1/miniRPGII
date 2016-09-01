//
//  ViewController.swift
//  miniRPGII
//
//  Created by Brian Cueto on 8/22/16.
//  Copyright © 2016 Brian Cueto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var printLbl: UILabel!
    @IBOutlet weak var printHolder: UIImageView!
    @IBOutlet weak var player2: UIImageView!
    @IBOutlet weak var player1: UIImageView!
    @IBOutlet weak var player1Attack: UIButton!
    @IBOutlet weak var player1AttackLbl: UILabel!
    @IBOutlet weak var player2Attack: UIButton!
    @IBOutlet weak var player2AttackLbl: UILabel!
    @IBOutlet weak var playResetBtn: UIButton!
    @IBOutlet weak var playResetLbl: UILabel!
    @IBOutlet weak var player1HP: UILabel!
    @IBOutlet weak var player2HP: UILabel!
    
    var firstPlayer = Player(name: "Player 1", HP: 100, attackPwr: 10)
    var secondPlayer = Player(name: "Player 2", HP: 100, attackPwr: 10)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onPlayer1Attack(sender: AnyObject) {
        disableAttack()
        secondPlayer.attemptAttack(firstPlayer.attackPwr)
        printLbl.text = "Player 1 Attacked Player 2!"
        player2HP.text = "\(secondPlayer.HP)"
        NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(ViewController.enableAttack), userInfo: nil, repeats: false)
        if !secondPlayer.isAlive {
            player2.hidden = true
            player2Attack.hidden = true
            player2AttackLbl.hidden = true
            player2HP.hidden = true
            printLbl.text = "Player 1 Wins!"
            NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(ViewController.showResetBtn), userInfo: nil, repeats: false)
        }
        
    }
    
    @IBAction func onPlayer2Attack(sender: AnyObject) {
        disableAttack()
        firstPlayer.attemptAttack(secondPlayer.attackPwr)
        printLbl.text = "Player 2 Attacked Player 1!"
        player1HP.text = "\(firstPlayer.HP)"
        NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(ViewController.enableAttack), userInfo: nil, repeats: false)
        if !firstPlayer.isAlive {
            player1.hidden = true
            player1Attack.hidden = true
            player1AttackLbl.hidden = true
            player1HP.hidden = true
            printLbl.text = "Player 2 Wins!"
            NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(ViewController.showResetBtn), userInfo: nil, repeats: false)
        }
    }
    
    @IBAction func onPlayResetPress(sender: AnyObject) {
        if playResetLbl.text == "Play!" {
            playResetLbl.text = "Reset?"
            playResetBtn.hidden = true; playResetLbl.hidden = true
            printHolder.hidden = false; printLbl.hidden = false
            player2Attack.hidden = false; player2AttackLbl.hidden = false; player2HP.hidden = false; player2.hidden = false; player2HP.text = "\(secondPlayer.HP)"
            player1Attack.hidden = false; player1AttackLbl.hidden = false; player1HP.hidden = false; player1.hidden = false; player1HP.text = "\(firstPlayer.HP)"
        } else {
            playResetBtn.hidden = true; playResetLbl.hidden = true
            printLbl.text = "Fight!"
            firstPlayer.HP = 100
            secondPlayer.HP = 100
            player2Attack.hidden = false; player2AttackLbl.hidden = false; player2HP.hidden = false; player2.hidden = false; player2HP.text = "\(secondPlayer.HP)"
            player1Attack.hidden = false; player1AttackLbl.hidden = false; player1HP.hidden = false; player1.hidden = false; player1HP.text = "\(firstPlayer.HP)"
        }
    }
    
    func disableAttack() {
        player1Attack.enabled = false
        player2Attack.enabled = false
    }
    
    func enableAttack() {
        player1Attack.enabled = true
        player2Attack.enabled = true
    }
    
    func showResetBtn() {
        playResetBtn.hidden = false
        playResetLbl.hidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

