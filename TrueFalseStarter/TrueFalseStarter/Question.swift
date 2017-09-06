//
//  Questions\.swift
//  TrueFalseStarter
//
//  Created by Joanna Lingenfelter on 7/8/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import Foundation

class Question {
    let question: String
    let answer: String
    let choice01: String
    let choice02: String
    let choice03: String
    let choice04: String
    
    init(question: String, answer: String, choice01: String, choice02: String, choice03: String, choice04: String) {
        self.question = question
        self.answer = answer
        self.choice01 = choice01
        self.choice02 = choice02
        self.choice03 = choice03
        self.choice04 = choice04
    }
}
