//
//  Questions.swift
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

let q1 = Question(question: "Which is the only planet in our solar system that rotates clockwise?", answer: "Venus", choice01: "Venus", choice02: "Jupiter", choice03: "Saturn", choice04: "Uranus")

let q2 = Question(question: "How many noses do slugs have", answer: "4", choice01: "12", choice02: "8", choice03: "22", choice04: "28")

let q3 = Question(question: "What kind of professional is most frequently late for appointments?", answer: "Doctors", choice01: "Dentists", choice02: "Optomistrists", choice03: "Doctors", choice04: "Phsycologists")

let q4 = Question(question: "What animal is illegal to transport in a taxi cab without a chaperone in Montana?", answer: "Sheep", choice01: "Leopard", choice02: "Sheep", choice03: "Bobcat", choice04: "Goat")

let q5 = Question(question: "What was the original ice cream cone meant to carry?", answer: "Flowers", choice01: "Flowers", choice02: "Candies", choice03: "Popcorn" , choice04: "Ice Cream")

let q6 = Question(question: "How old was the youngest Pope ever to hold the position?", answer: "11", choice01: "9", choice02: "26", choice03: "11", choice04: "43")

let q7 = Question(question: "How many times to humans laugh per day on average?", answer: "15", choice01: "15", choice02: "7", choice03: "22", choice04: "31")

let q8 = Question(question: "What is the official name for a person that loves dogs with incredible enthusiasm?", answer: "Cynophile", choice01: "Arctophile", choice02: "Ailurophile", choice03: "Cynophile", choice04: "Pluviophile")

let q9 = Question(question: "When hippos are upset, their sweat turns what color?", answer: "Red", choice01: "Brown", choice02: "Greenish", choice03: "Purple", choice04: "Red")

let q10 = Question(question: "What is the official name for the fear of being tickled by feathers?", answer: "Pteronophobia", choice01: "Pteronophobia", choice02: "Botanophobia", choice03: "Chorophobia", choice04: "Kynophobia")

let questionsArray = [q1, q2, q3, q4, q5, q6, q7, q8, q9, q10]