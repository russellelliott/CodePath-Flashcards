//
//  ViewController.swift
//  Flashcards
//
//  Created by Russell Elliott on 2/26/22.
//

import UIKit

//Struct to store parameters of the flashcard
struct Flashcard{
    var question: String
    var answer: String
}

class ViewController: UIViewController {

    //Label for the answer
    @IBOutlet weak var backLabel: UILabel!
    
    //Label for the question
    @IBOutlet weak var frontLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //Function that shows the answer when the user taps on the flashcard
    @IBAction func didTapOnFlashcard(_ sender: Any) {
        //set the question label to be hidden so the answer is visible
        //if the user taps again, the question becomes visible again.
        frontLabel.isHidden = !frontLabel.isHidden;
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        let navigationController = segue.destination as! UINavigationController
        
        let creationController = navigationController.topViewController as! CreationViewController
        
        creationController.flashcardsController = self
    }
    
    func updateFlashcard(question: String, answer: String){
        let flashcard = Flashcard(question: question, answer: answer)
        frontLabel.text = flashcard.question;
        backLabel.text = flashcard.answer;
    }
    
}

