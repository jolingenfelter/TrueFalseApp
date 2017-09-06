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
    
    private let number: Int
    private let otherNumber: Int
    fileprivate let answer: Int
    
    var question: String {
        return "\(number) * \(otherNumber)"
    }
    
    let choice1: Int
    let choice2: Int
    let choice3: Int
    var choice4: Int
    
    lazy var choicesArray: [Int] = {
        return [self.choice1, self.choice2, self.choice3, self.choice4].shuffle
    }()
    
    
    init() {
        
        number = GKRandomSource.sharedRandom().nextInt(upperBound: 10)
        otherNumber = GKRandomSource.sharedRandom().nextInt(upperBound: 10)
        answer = number * otherNumber
        
        choice1 = GKRandomSource.sharedRandom().nextInt(upperBound: 100)
        choice2 = GKRandomSource.sharedRandom().nextInt(upperBound: 100)
        choice3 = GKRandomSource.sharedRandom().nextInt(upperBound: 100)
        choice4 = answer
    }

}

