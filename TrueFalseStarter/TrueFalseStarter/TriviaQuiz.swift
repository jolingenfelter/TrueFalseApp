//
//  TriviaQuiz.swift
//  TrueFalseStarter
//
//  Created by Joanna Lingenfelter on 9/5/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

class TriviaQuiz: Quiz {
    
    internal var questionsArray: [Question]
    
    init(withNumberOfQuestions: Int) {
        
        questionsArray = [TriviaQuestion]()
        
        do {
            
            let pListConversion = try PlistConverter.arrayFromFile(resource: "TriviaQuestions", ofType: "plist")
            questionsArray = QuestionsUnarchiver.questionsFromArray(array: pListConversion).shuffle
            
        } catch let error {
            
            print(error.localizedDescription)
            
        }
    }
    
    func newQuiz(numberOfQuestions: Int) {
        
        for _ in 0..<numberOfQuestions {
            let shuffledArray = questionsArray.shuffle
            questionsArray = shuffledArray.takeElements(elementCount: numberOfQuestions)
        }
        
    }
}


