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
    
    init() {
        
        questionsArray = [TriviaQuestion]()
        
        do {
            
            let pListConversion = try PlistConverter.arrayFromFile(resource: "TriviaQuestions", ofType: "plist")
            questionsArray = QuestionsUnarchiver.questionsFromArray(array: pListConversion)
            
        } catch let error {
            
            print(error.localizedDescription)
            
        }
    }
}


