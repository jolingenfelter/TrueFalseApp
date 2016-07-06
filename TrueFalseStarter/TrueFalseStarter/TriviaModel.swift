//
//  TriviaModel.swift
//  TrueFalseStarter
//
//  Created by Joanna Lingenfelter on 7/6/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import Foundation
import GameKit

struct TriviaModel {
    let trivia : [[String : String]] = [
        ["Question": "Only female koalas can whistle", "Answer": "False"],
        ["Question": "Blue whales are technically whales", "Answer": "True"],
        ["Question": "Camels are cannibalistic", "Answer": "False"],
        ["Question": "All ducks are birds", "Answer": "True"]]
    
    func getRandomQuestion() -> [String : String] {
        let randomlySelectedQuestionIndex = GKRandomSource.sharedRandom().nextIntWithUpperBound(trivia.count)
        
        return trivia[randomlySelectedQuestionIndex]
    
    }
}


