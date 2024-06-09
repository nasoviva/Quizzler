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

    @IBOutlet weak var firstOption: UIButton!

    @IBOutlet weak var secondOption: UIButton!

    @IBOutlet weak var thirdOption: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!

    var quizBrain = QuizBrain()

    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }

    @IBAction func answerPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let itIsRight = quizBrain.checkAnswer(userAnswer)

        if itIsRight == true {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }

        quizBrain.nextQuestion()

        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }

    @objc func updateUI() {
        question.text = quizBrain.getQuestionText()
        firstOption.setTitle(quizBrain.getFirstOptionsText(), for: .normal)
        secondOption.setTitle(quizBrain.getSecondOptionsText(), for: .normal)
        thirdOption.setTitle(quizBrain.getThirdOptionsText(), for: .normal)

        progressBar.progress = quizBrain.getProgress()
        score.text = "Score: " + String(quizBrain.getScore())

        firstOption.backgroundColor = UIColor.clear
        secondOption.backgroundColor = UIColor.clear
        thirdOption.backgroundColor = UIColor.clear
    }

}

