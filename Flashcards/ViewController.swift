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
    
    //Array to store the flashcards
    var flashcards = [Flashcard]()
    
    //Current flashcard index
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Add the first flashcard
        updateFlashcard(question: "Sample Question", answer: "Sample Answer")
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
        //Append flashcard to the list of flashcards
        flashcards.append(flashcard)
        //Debug statements to ensure the code is working
        print("Added new flashcard")
        print("There are now \(flashcards.count) flashcards")
    }
    
    //User tapped the "prev" button to go back to the previous card
    @IBAction func prev(_ sender: Any) {
    }
    
    
    //User tapped the "next" button to go to the next card
    @IBAction func next(_ sender: Any) {
    }
    
}

