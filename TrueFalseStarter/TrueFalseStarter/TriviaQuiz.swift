//
//  TriviaQuiz.swift
//  TrueFalseStarter
//
//  Created by Joanna Lingenfelter on 9/5/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

class TriviaQuiz{
    
    let q1 = TriviaQuestion(question: "Which is the only planet in our solar system that rotates clockwise?", answer: "Venus", choice01: "Venus", choice02: "Jupiter", choice03: "Saturn", choice04: "Uranus")
    
    let q2 = TriviaQuestion(question: "How many noses do slugs have?", answer: "4", choice01: "12", choice02: "8", choice03: "22", choice04: "28")
    
    let q3 = TriviaQuestion(question: "What kind of professional is most frequently late for appointments?", answer: "Doctors", choice01: "Dentists", choice02: "Optomistrists", choice03: "Doctors", choice04: "Psycologists")
    
    let q4 = TriviaQuestion(question: "What animal is illegal to transport in a taxi cab without a chaperone in Montana?", answer: "Sheep", choice01: "Leopard", choice02: "Sheep", choice03: "Bobcat", choice04: "Goat")
    
    let q5 = TriviaQuestion(question: "What was the original ice cream cone meant to carry?", answer: "Flowers", choice01: "Flowers", choice02: "Candies", choice03: "Popcorn" , choice04: "Ice Cream")
    
    let q6 = TriviaQuestion(question: "How old was the youngest Pope ever to hold the position?", answer: "11", choice01: "9", choice02: "26", choice03: "11", choice04: "43")
    
    let q7 = TriviaQuestion(question: "How many times to humans laugh per day on average?", answer: "15", choice01: "15", choice02: "7", choice03: "22", choice04: "31")
    
    let q8 = TriviaQuestion(question: "What is the official name for a person that loves dogs with incredible enthusiasm?", answer: "Cynophile", choice01: "Arctophile", choice02: "Ailurophile", choice03: "Cynophile", choice04: "Pluviophile")
    
    let q9 = TriviaQuestion(question: "When hippos are upset, their sweat turns what color?", answer: "Red", choice01: "Brown", choice02: "Greenish", choice03: "Purple", choice04: "Red")
    
    let q10 = TriviaQuestion(question: "What is the official name for the fear of being tickled by feathers?", answer: "Pteronophobia", choice01: "Pteronophobia", choice02: "Botanophobia", choice03: "Chorophobia", choice04: "Kynophobia")
    
    var questionsArray: [TriviaQuestion] {
        return [q1, q2, q3, q4, q5, q6, q7, q8, q9, q10]
    }
    
    func generateTriviaQuiz() -> [TriviaQuestion] {
        return questionsArray.shuffle
    }

}


