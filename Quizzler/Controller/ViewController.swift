//
//  ViewController.swift
//  Quizzler
//
//  Created by Victoria on 08/06/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var score: UILabel!

    @IBOutlet weak var question: UILabel!


    @IBOutlet weak var trueAnswer: UIButton!

    @IBOutlet weak var falseAnswer: UIButton!

    @IBOutlet weak var progressBar: UIProgressView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func answerPressed(_ sender: UIButton) {
    }
    
}

