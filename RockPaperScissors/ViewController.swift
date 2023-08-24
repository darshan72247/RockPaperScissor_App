//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Darshan Patel on 2023-08-23.
//

import UIKit

class ViewController: UIViewController {
    
    // Computer & Player Score Tracker variables
    var computerScoreCount = 0
    var playerScoreCount = 0
    
    //Computer & Player Option Selected
    var computerOptionOpted = ""
    var playerOptionOpted = ""

    //Winner Label #Winner:Computer
    @IBOutlet weak var winnerLabel: UILabel!
    
    //Player and Computer Optined Picked Labels
    @IBOutlet weak var playerPickLabel: UILabel!
    @IBOutlet weak var computerPickLabel: UILabel!
    
    //Player and Computer Score Labels
    @IBOutlet weak var playerScoreLabel: UILabel!
    @IBOutlet weak var computerScoreLabel: UILabel!
    
    //Player Image Option for Rock Paper Scissor
    @IBOutlet weak var playerRockImageOption: UIImageView!
    @IBOutlet weak var playerPaperImageOption: UIImageView!
    @IBOutlet weak var playerScissorImageOption: UIImageView!
    
    //Computer Image Option for Rock Paper Scissor
    @IBOutlet weak var computerRockImageOption: UIImageView!
    @IBOutlet weak var computerPaperImageOption: UIImageView!
    @IBOutlet weak var computerScissorImageOption: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Rock optioned tapped by user gesture
        let rockTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.rockOptionTapped))
        playerRockImageOption.addGestureRecognizer(rockTapGesture)
        playerRockImageOption.isUserInteractionEnabled = true
        
        //Paper optioned tapped by user gesture
        let paperTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.paperOptionTapped))
        playerPaperImageOption.addGestureRecognizer(paperTapGesture)
        playerPaperImageOption.isUserInteractionEnabled = true
        
        //Paper optioned tapped by user gesture
        let scissorTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.scissorOptionTapped))
        playerScissorImageOption.addGestureRecognizer(scissorTapGesture)
        playerScissorImageOption.isUserInteractionEnabled = true
        
    }

    // Rock Tapped Function Handler
    @objc func rockOptionTapped(sender: UITapGestureRecognizer){
        if sender.state == .ended {
            //Player tapped on the image
            playerRockImageOption.image = UIImage(named: "handRockFilledImage")
            playerPickLabel.text = "Rock"
            playerOptionOpted = "Rock"
            computerOptionSelected()
        }
    }
    
    // Paper Tapped Function Handler
    @objc func paperOptionTapped(sender: UITapGestureRecognizer){
        if sender.state == .ended {
            //Player tapped on the image
            playerPaperImageOption.image = UIImage(named: "handPaperFilledImage")
            playerPickLabel.text = "Paper"
            playerOptionOpted = "Paper"
            computerOptionSelected()
        }
    }
    
    // Scissor Tapped Function Handler
    @objc func scissorOptionTapped(sender: UITapGestureRecognizer){
        if sender.state == .ended {
            //Player tapped on the image
            playerScissorImageOption.image = UIImage(named: "handScissorFilledImage")
            playerPickLabel.text = "Scissor"
            playerOptionOpted = "Scissor"
            computerOptionSelected()
        }
    }
    
    @objc func computerOptionSelected(){
        let computerOption = Int.random(in: 1..<4)
        if (computerOption == 1){
            computerRockImageOption.image = UIImage(named: "handRockFilledImage")
            computerPickLabel.text = "Rock"
            computerOptionOpted = "Rock"
        } else if ( computerOption == 2) {
            computerPaperImageOption.image = UIImage(named: "handPaperFilledImage")
            computerPickLabel.text = "Paper"
            computerOptionOpted = "Paper"
        } else {
            computerScissorImageOption.image = UIImage(named: "handScissorFilledImage")
            computerPickLabel.text = "Scissor"
            computerOptionOpted = "Scissor"
        }
        
        gameLogic(computerValue: computerOptionOpted, playerValue: playerOptionOpted)
    }
    
    @objc func gameLogic(computerValue: String,playerValue:String){
        if(computerValue == playerValue){
            winnerLabel.text = "Draw"
        } else {
            if (computerValue == "Rock") {
                if (playerValue == "Scissor"){
                    winnerLabel.text = "Computer"
                    computerScoreCount += 1
                } else {
                    winnerLabel.text = "Player"
                    playerScoreCount += 1
                }
            }
            
            if (computerValue == "Paper") {
                if (playerValue == "Rock") {
                    winnerLabel.text = "Computer"
                    computerScoreCount += 1
                } else {
                    winnerLabel.text = "Player"
                    playerScoreCount += 1
                }
            }
            
            if (computerValue == "Scissor") {
                if (playerValue == "Rock"){
                    winnerLabel.text = "Player"
                    playerScoreCount += 1
                } else {
                    winnerLabel.text = "Computer"
                    computerScoreCount += 1
                }
            }
        }
        
        
        
        playerScoreLabel.text = String(playerScoreCount)
        computerScoreLabel.text = String(computerScoreCount)
        
        // Reset Image after 5 sec
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.imageReset()
         }
    }

    
    @objc func imageReset(){
        // Cmputer selected Image Reset
        switch computerOptionOpted {
        case "Rock":
            computerRockImageOption.image = UIImage(named: "handRockImage")
        case "Paper":
            computerPaperImageOption.image = UIImage(named: "handPaperImage")
        case "Scissor":
            computerScissorImageOption.image = UIImage(named: "handScissorImage")
        default:
            print("No option Selected")
        }
        
        //Player selected Image Reset
        switch playerOptionOpted {
        case "Rock":
            playerRockImageOption.image = UIImage(named: "handRockImage")
        case "Paper":
            playerPaperImageOption.image = UIImage(named: "handPaperImage")
        case "Scissor":
            playerScissorImageOption.image = UIImage(named: "handScissorImage")
        default:
            print("No option Selected")
        }
    }
}

