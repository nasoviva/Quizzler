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
        buttonTitleLabelSize()
    }

    @IBAction func answerPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let itIsRight = quizBrain.checkAnswer(userAnswer)

        if itIsRight == true {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }

        if quizBrain.nextQuestion() {
            Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        } else {
            Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(getResult), userInfo: nil, repeats: false)
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.quizBrain.newStart()
                Timer.scheduledTimer(timeInterval: 0, target: self, selector: #selector(self.updateUI), userInfo: nil, repeats: false)
            }

        }
    }

    @objc func updateUI() {
        firstOption.isHidden = false
        secondOption.isHidden = false
        thirdOption.isHidden = false
        score.isHidden = false
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

    @objc func getResult() {
        question.text = "Your score is " + String(quizBrain.getScore())
        firstOption.isHidden = true
        secondOption.isHidden = true
        thirdOption.isHidden = true
        score.isHidden = true
    }
}

extension ViewController {
    func buttonTitleLabelSize() {
        firstOption.titleLabel?.adjustsFontSizeToFitWidth = true
        firstOption.titleLabel?.minimumScaleFactor = 0.5
        firstOption.titleLabel?.numberOfLines = 1
        firstOption.layer.borderWidth = 3.0
        firstOption.layer.borderColor = UIColor(red: 85/255.0, green: 85/255.0, blue: 86/255.0, alpha: 1.0).cgColor
        firstOption.layer.cornerRadius = 18.0

        secondOption.titleLabel?.adjustsFontSizeToFitWidth = true
        secondOption.titleLabel?.minimumScaleFactor = 0.5
        secondOption.titleLabel?.numberOfLines = 1
        secondOption.layer.borderWidth = 3.0
        secondOption.layer.borderColor = UIColor(red: 85/255.0, green: 85/255.0, blue: 86/255.0, alpha: 1.0).cgColor
        secondOption.layer.cornerRadius = 18.0

        thirdOption.titleLabel?.adjustsFontSizeToFitWidth = true
        thirdOption.titleLabel?.minimumScaleFactor = 0.5
        thirdOption.titleLabel?.numberOfLines = 1
        thirdOption.layer.borderWidth = 3.0
        thirdOption.layer.borderColor = UIColor(red: 85/255.0, green: 85/255.0, blue: 86/255.0, alpha: 1.0).cgColor
        thirdOption.layer.cornerRadius = 18.0
    }
}

