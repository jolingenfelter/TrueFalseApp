//
//  Questions\.swift
//  TrueFalseStarter
//
//  Created by Joanna Lingenfelter on 7/8/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import Foundation

class TriviaQuestion: Quiz {
    
    internal var question: String
    internal var answer: Any
    internal var choice01: String
    internal var choice02: String
    internal var choice03: String
    internal var choice04: String
    
    internal lazy var choicesArray: [String] = {
        return [self.choice01, self.choice02, self.choice03, self.choice04].shuffle
    }()
    
    init(question: String, answer: String, choice01: String, choice02: String, choice03: String) {
        self.question = question
        self.answer = answer
        self.choice01 = choice01
        self.choice02 = choice02
        self.choice03 = choice03
        self.choice04 = self.answer as! String
    }
}
