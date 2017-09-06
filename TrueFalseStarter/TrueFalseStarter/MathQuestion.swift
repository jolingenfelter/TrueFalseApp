//
//  MathQuestion.swift
//  TrueFalseStarter
//
//  Created by Joanna Lingenfelter on 9/6/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation
import GameKit

class MathQuestion: Quiz {
    
    private var number: Int
    private var otherNumber: Int
    internal var answer: Any
    internal var question: String
    
    var choice01: String
    var choice02: String
    var choice03: String
    var choice04: String
    
    lazy var choicesArray: [String] = {
        return [self.choice01, self.choice02, self.choice03, self.choice04].shuffle
    }()
    
    
    init() {
        
        number = GKRandomSource.sharedRandom().nextInt(upperBound: 10)
        otherNumber = GKRandomSource.sharedRandom().nextInt(upperBound: 10)
        answer = number * otherNumber
        question = "\(number) * \(otherNumber)"
        
        choice01 = String(describing: GKRandomSource.sharedRandom().nextInt(upperBound: 100))
        choice02 = String(describing: GKRandomSource.sharedRandom().nextInt(upperBound: 100))
        choice03 = String(describing: GKRandomSource.sharedRandom().nextInt(upperBound: 100))
        choice04 = String(describing: answer)
    }

}
