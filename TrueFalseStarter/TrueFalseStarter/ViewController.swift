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
    
    let triviaModel = TriviaModel()
    
    var gameSound: SystemSoundID = 0
    
    @IBOutlet weak var questionField: UILabel!
    
    //Buttons
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    @IBOutlet weak var choice4: UIButton!
    
    @IBOutlet weak var playAgainButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadGameStartSound()
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
        } else {
            questionField.text = "Sorry, wrong answer!"
        }
        
        loadNextRoundWithDelay(seconds: 2)
    }
    
    func nextRound() {
        if questionsAsked == questionsPerRound {
            // Game is over
            displayScore()
        } else {
            // Continue game
            displayQuestion()
        }
    }
    
    @IBAction func playAgain() {
        // Show the answer buttons
        choice1.hidden = false
        choice2.hidden = false
        choice3.hidden = false
        choice4.hidden = false
        
        questionsAsked = 0
        correctQuestions = 0
        nextRound()
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
}

