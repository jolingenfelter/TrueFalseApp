//
//  MathQuestion.swift
//  TrueFalseStarter
//
//  Created by Joanna Lingenfelter on 9/6/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation
import GameKit

class MathQuestion {
    
    var number: Int
    var otherNumber: Int
    var answer: Int {
        return number * otherNumber
    }
    var question: String {
        return "\(number) * \(otherNumber)"
    }
    
    var choice1: Int
    var choice2: Int
    var choice3: Int
    
    var choice4: Int {
        return answer
    }
    
    lazy var choicesArray: [Int] = {
        return [self.choice1, self.choice2, self.choice3, self.choice4].shuffle
    }()
    
    
    init() {
        
        number = GKRandomSource.sharedRandom().nextInt(upperBound: 10)
        otherNumber = GKRandomSource.sharedRandom().nextInt(upperBound: 10)
        
        choice1 = GKRandomSource.sharedRandom().nextInt(upperBound: 100)
        choice2 = GKRandomSource.sharedRandom().nextInt(upperBound: 100)
        choice3 = GKRandomSource.sharedRandom().nextInt(upperBound: 100)
        
    }
    
    private func createChoicesArray() -> [Int] {
        let choice1 = GKRandomSource.sharedRandom().nextInt(upperBound: 100)
        let choice2 = GKRandomSource.sharedRandom().nextInt(upperBound: 100)
        let choice3 = GKRandomSource.sharedRandom().nextInt(upperBound: 100)
        let choice4 = self.answer
        
        return [choice1, choice2, choice3, choice4]
        
    }
    
    func generateNewNumbers() {
        number = GKRandomSource.sharedRandom().nextInt(upperBound: 10)
        otherNumber = GKRandomSource.sharedRandom().nextInt(upperBound: 10)
        choice1 = GKRandomSource.sharedRandom().nextInt(upperBound: 100)
        choice2 = GKRandomSource.sharedRandom().nextInt(upperBound: 100)
        choice3 = GKRandomSource.sharedRandom().nextInt(upperBound: 100)
    }
}

