//
//  TriviaQuiz.swift
//  TrueFalseStarter
//
//  Created by Joanna Lingenfelter on 9/5/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

class TriviaQuiz: Quiz {
    
    let q1 = TriviaQuestion(question: "Which is the only planet in our solar system that rotates clockwise?", answer: "Venus", choice01: "Uranus", choice02: "Jupiter", choice03: "Saturn")
    
    let q2 = TriviaQuestion(question: "How many noses do slugs have?", answer: "4", choice01: "12", choice02: "8", choice03: "22")
    
    let q3 = TriviaQuestion(question: "What kind of professional is most frequently late for appointments?", answer: "Doctors", choice01: "Dentists", choice02: "Optomistrists", choice03: "Psychologists")
    
    let q4 = TriviaQuestion(question: "What animal is illegal to transport in a taxi cab without a chaperone in Montana?", answer: "Sheep", choice01: "Leopard", choice02: "Goat", choice03: "Bobcat")
    
    let q5 = TriviaQuestion(question: "What was the original ice cream cone meant to carry?", answer: "Flowers", choice01: "Ice cream", choice02: "Candies", choice03: "Popcorn")
    
    let q6 = TriviaQuestion(question: "How old was the youngest Pope ever to hold the position?", answer: "11", choice01: "9", choice02: "26", choice03: "43")
    
    let q7 = TriviaQuestion(question: "How many times to humans laugh per day on average?", answer: "15", choice01: "31", choice02: "7", choice03: "22")
    
    let q8 = TriviaQuestion(question: "What is the official name for a person that loves dogs with incredible enthusiasm?", answer: "Cynophile", choice01: "Arctophile", choice02: "Ailurophile", choice03: "Pluviophile")
    
    let q9 = TriviaQuestion(question: "When hippos are upset, their sweat turns what color?", answer: "Red", choice01: "Brown", choice02: "Greenish", choice03: "Purple")
    
    let q10 = TriviaQuestion(question: "What is the official name for the fear of being tickled by feathers?", answer: "Pteronophobia", choice01: "Kynophobia", choice02: "Botanophobia", choice03: "Chorophobia")
    
    internal var questionsArray: [Question] {
        return [q1, q2, q3, q4, q5, q6, q7, q8, q9, q10].shuffle
    }
}


