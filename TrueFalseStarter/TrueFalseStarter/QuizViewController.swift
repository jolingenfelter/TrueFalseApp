//
//  QuizViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class QuizViewController: UIViewController {
    
    let questionsPerRound = 5
    var questionsAsked = 0
    var correctQuestions = 0
    var questionIndex : Int = 0
    let triviaQuiz = TriviaQuiz()
    
    lazy var questionsArray: [TriviaQuestion] = {
        return self.triviaQuiz.generateTriviaQuiz()
    }()
    
    // Sound effects
    var gameSound: SystemSoundID = 0
    var wrongAnswerSound: SystemSoundID = 0
    var correctAnswerSound: SystemSoundID = 0
    
    @IBOutlet weak var questionField: UILabel!
    
    // Buttons
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    @IBOutlet weak var choice4: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    // Timer
    var timer = Timer()
    var time = 15
    var timerRunning = false
    @IBOutlet weak var timerLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadGameStartSound()
        loadCorrectAnswerSound()
        loadIncorrectAnswerSound()
        // Start game
        playGameStartSound()
        displayQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayQuestion() {
        
        let question = questionsArray[questionIndex]
        questionField.text = question.question
        playAgainButton.isHidden = true
        
        //Answers
        choice1.setTitle(question.choicesArray[0], for: UIControlState())
        choice2.setTitle(question.choicesArray[1], for: UIControlState())
        choice3.setTitle(question.choicesArray[2], for: UIControlState())
        choice4.setTitle(question.choicesArray[3], for: UIControlState())
        
        resetTimerAndButtons()
        beginTimer()
    }
    
    func displayScore() {
        // Hide the answer buttons
        choice1.isHidden = true
        choice2.isHidden = true
        choice3.isHidden = true
        choice4.isHidden = true
        
        // Display play again button
        playAgainButton.isHidden = false
        
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
        
    }
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        // Increment the questions asked counter
        questionsAsked += 1
        
        let selectedQuestion = questionsArray[questionIndex]
        let correctAnswer = selectedQuestion.answer
        
        if (sender.titleLabel!.text == String(describing: correctAnswer)) {
            correctQuestions += 1
            questionField.text = "Correct!"
            playCorrectAnswerSound()
            disableButtons()
            timer.invalidate()
            questionIndex += 1
        } else {
            questionField.text = "Sorry, the correct answer is \(correctAnswer)!"
            playIncorrectAnswerSound()
            disableButtons()
            questionIndex += 1
            timer.invalidate()
        }
        
        let buttonsArray = [choice1, choice2, choice3, choice4]
        
        for button in buttonsArray {
            if button!.isHighlighted == true {
                button!.alpha = 1.0
            } else {
                button!.alpha = 0.3
            }
        }
        
        loadNextRoundWithDelay(seconds: 1)
    }
    
    func nextRound() {
        if questionsAsked == questionsPerRound {
            // Game is over
            questionsArray = triviaQuiz.generateTriviaQuiz()
            displayScore()
        } else {
            // Continue game
            displayQuestion()
            let buttonsArray = [choice1, choice2, choice3, choice4]
            for button in buttonsArray {
                button!.alpha = 1.0
            }
        }
    }
    
    @IBAction func playAgain() {
        // Show the answer buttons
        choice1.isHidden = false
        choice2.isHidden = false
        choice3.isHidden = false
        choice4.isHidden = false
        
        playGameStartSound()
        questionsAsked = 0
        correctQuestions = 0
        nextRound()
    }
    
    // Timer
    
    func beginTimer() {
        if timerRunning == false {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(displayCountDown), userInfo: nil, repeats: true)
            
            timerRunning = true
        }
    }
    
    func displayCountDown() {
        
        time -= 1
        timerLabel.text = "\(time)"
        
        if time <= 5 {
            timerLabel.textColor = UIColor.red
        }
        
        if time == 0 {
            timer.invalidate()
            questionField.text = "Time's up!"
            questionsAsked += 1
            playIncorrectAnswerSound()
            disableButtons()
            loadNextRoundWithDelay(seconds: 1)
            questionField.textColor = UIColor.red
            
        }
        
    }
    
    func resetTimerAndButtons() {
        time = 15
        timerLabel.text = "\(time)"
        timerRunning = false
        timerLabel.textColor = UIColor.white
        questionField.textColor = UIColor.white
        enableButtons()
    }
    
    func disableButtons() {
        choice1.isUserInteractionEnabled = false
        choice2.isUserInteractionEnabled = false
        choice3.isUserInteractionEnabled = false
        choice4.isUserInteractionEnabled = false
    }
    
    func enableButtons() {
        choice1.isUserInteractionEnabled = true
        choice2.isUserInteractionEnabled = true
        choice3.isUserInteractionEnabled = true
        choice4.isUserInteractionEnabled = true
    }

    
    // MARK: Helper Methods
    
    func loadNextRoundWithDelay(seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.nextRound()
        }
    }
    
    func loadGameStartSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
    
    func loadCorrectAnswerSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "CorrectAnswer", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &correctAnswerSound)
    }
    
    func playCorrectAnswerSound() {
        AudioServicesPlaySystemSound(correctAnswerSound)
    }
    
    func loadIncorrectAnswerSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "WrongAnswer", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &wrongAnswerSound)
        
    }
    
    func playIncorrectAnswerSound() {
        AudioServicesPlaySystemSound(wrongAnswerSound)
    }
}
