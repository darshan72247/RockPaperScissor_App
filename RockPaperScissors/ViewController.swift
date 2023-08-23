//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Darshan Patel on 2023-08-23.
//

import UIKit

class ViewController: UIViewController {

    //Winner Label #Winner:Computer
    @IBOutlet weak var winnerLabel: UILabel!
    
    //Player and Computer Optined Picked Labels
    @IBOutlet weak var playerPickLabel: UILabel!
    @IBOutlet weak var computerPickLabel: UILabel!
    
    //Player and Computer Score Labels
    @IBOutlet weak var playerScoreLabel: UILabel!
    @IBOutlet weak var computerScoreLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

