//
//  ChooseQuizTypeViewController.swift
//  TrueFalseStarter
//
//  Created by Joanna Lingenfelter on 9/6/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit

class ChooseQuizTypeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch  segue.identifier! {
        case "TriviaQuestions" :
            print("Trivia")
        case "MathQuestions":
            print("MathQuiz")
        default:
            print("No segue")
            
        }
    }

}
