//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    
    let questionsPerRound = 5
    var questionsAsked = 0
    var correctQuestions = 0
    var randomlySelectedQuestionIndex : Int = 0
    var usedQuestionsArray : [Int] = []
    
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
    var timer = NSTimer()
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
        
        //Question
        randomlySelectedQuestionIndex = GKRandomSource.sharedRandom().nextIntWithUpperBound(questionsArray.count)
        
        //Logic to avoid repeating questions 
        while usedQuestionsArray.contains(randomlySelectedQuestionIndex) {
            randomlySelectedQuestionIndex = GKRandomSource.sharedRandom().nextIntWithUpperBound(questionsArray.count)
        }
        
        usedQuestionsArray.append(randomlySelectedQuestionIndex)
        
        //So the user can still replay after all of the questions have been used
        if usedQuestionsArray.count == questionsArray.count {
            usedQuestionsArray = []
        }
        
        let question = questionsArray[randomlySelectedQuestionIndex];
        questionField.text = question.question
        playAgainButton.hidden = true
        
        //Answers
        choice1.setTitle(question.choice01, forState: UIControlState.Normal)
        choice2.setTitle(question.choice02, forState: UIControlState.Normal)
        choice3.setTitle(question.choice03, forState: UIControlState.Normal)
        choice4.setTitle(question.choice04, forState: UIControlState.Normal)
        
        resetTimerAndButtons()
        beginTimer()
    }
    
    func displayScore() {
        // Hide the answer buttons
        choice1.hidden = true
        choice2.hidden = true
        choice3.hidden = true
        choice4.hidden = true
        
        // Display play again button
        playAgainButton.hidden = false
        
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
        
    }
    
    @IBAction func checkAnswer(sender: UIButton) {
        // Increment the questions asked counter
        questionsAsked += 1
        
        let selectedQuestion = questionsArray[randomlySelectedQuestionIndex]
        let correctAnswer = selectedQuestion.answer
        
        if (sender.titleLabel!.text == correctAnswer) {
            correctQuestions += 1
            questionField.text = "Correct!"
            playCorrectAnswerSound()
            disableButtons()
            timer.invalidate()
        } else {
            questionField.text = "Sorry, the correct answer is \(correctAnswer)!"
            playIncorrectAnswerSound()
            disableButtons()
            timer.invalidate()
        }
        
        let buttonsArray = [choice1, choice2, choice3, choice4]
        for button: UIButton in buttonsArray {
            if button.highlighted == true {
                button.alpha = 1.0
            } else {
                button.alpha = 0.3
            }
        }
        
        loadNextRoundWithDelay(seconds: 1)
    }
    
    func nextRound() {
        if questionsAsked == questionsPerRound {
            // Game is over
            displayScore()
        } else {
            // Continue game
            displayQuestion()
            let buttonsArray = [choice1, choice2, choice3, choice4]
            for button: UIButton in buttonsArray {
                button.alpha = 1.0
            }
        }
    }
    
    @IBAction func playAgain() {
        // Show the answer buttons
        choice1.hidden = false
        choice2.hidden = false
        choice3.hidden = false
        choice4.hidden = false
        
        playGameStartSound()
        questionsAsked = 0
        correctQuestions = 0
        nextRound()
    }
    
    // Timer
    
    func beginTimer() {
        if timerRunning == false {
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.displayCountDown), userInfo: nil, repeats: true)
            
            timerRunning = true
        }
    }
    
    func displayCountDown() {
        
        time -= 1
        timerLabel.text = "\(time)"
        
        if time <= 5 {
            timerLabel.textColor = UIColor.redColor()
        }
        
        if time == 0 {
            timer.invalidate()
            questionField.text = "Time's up!"
            questionsAsked += 1
            playIncorrectAnswerSound()
            disableButtons()
            loadNextRoundWithDelay(seconds: 1)
            questionField.textColor = UIColor.redColor()
            
        }
        
    }
    
    func resetTimerAndButtons() {
        time = 15
        timerLabel.text = "\(time)"
        timerRunning = false
        timerLabel.textColor = UIColor.whiteColor()
        questionField.textColor = UIColor.whiteColor()
        enableButtons()
    }
    
    func disableButtons() {
        choice1.userInteractionEnabled = false
        choice2.userInteractionEnabled = false
        choice3.userInteractionEnabled = false
        choice4.userInteractionEnabled = false
    }
    
    func enableButtons() {
        choice1.userInteractionEnabled = true
        choice2.userInteractionEnabled = true
        choice3.userInteractionEnabled = true
        choice4.userInteractionEnabled = true
    }

    
    // MARK: Helper Methods
    
    func loadNextRoundWithDelay(seconds seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, delay)
        
        // Executes the nextRound method at the dispatch time on the main queue
        dispatch_after(dispatchTime, dispatch_get_main_queue()) {
            self.nextRound()
        }
    }
    
    func loadGameStartSound() {
        let pathToSoundFile = NSBundle.mainBundle().pathForResource("GameSound", ofType: "wav")
        let soundURL = NSURL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
    
    func loadCorrectAnswerSound() {
        let pathToSoundFile = NSBundle.mainBundle().pathForResource("CorrectAnswer", ofType: "wav")
        let soundURL = NSURL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL, &correctAnswerSound)
    }
    
    func playCorrectAnswerSound() {
        AudioServicesPlaySystemSound(correctAnswerSound)
    }
    
    func loadIncorrectAnswerSound() {
        let pathToSoundFile = NSBundle.mainBundle().pathForResource("WrongAnswer", ofType: "wav")
        let soundURL = NSURL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL, &wrongAnswerSound)
        
    }
    
    func playIncorrectAnswerSound() {
        AudioServicesPlaySystemSound(wrongAnswerSound)
    }
}

