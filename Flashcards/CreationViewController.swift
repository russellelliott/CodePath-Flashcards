//
//  CreationViewController.swift
//  Flashcards
//
//  Created by Russell Elliott on 3/12/22.
//

import UIKit

class CreationViewController: UIViewController {
    
    var flashcardsController: ViewController!
    
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var answerTextField: UITextField!
    
    //Variables for initial question and answer
    var initialQuestion: String?
    var initialAnswer: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        questionTextField.text = initialQuestion
        answerTextField.text = initialAnswer
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func done(_ sender: Any) {
        //Get the text from the quesiton text field
        let questionText = questionTextField.text
        
        //Get the text from the answer text field
        let answerText = answerTextField.text
        
        //Check if the user has entered a question and an answer on the card. If not, display an error.
        if(questionText=="" || answerText==""){
            //If any of the fields are empty, display error
            // create the alert
            let alert = UIAlertController(title: "Error: Insufficent Data", message: "Your flashcard doesn't include text for the question and/or the answer. Make sure you enter a question and answer for your flashcard.", preferredStyle: UIAlertController.Style.alert)
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
        
        flashcardsController.updateFlashcard(question: questionText!, answer: answerText!)
        dismiss(animated: true)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
