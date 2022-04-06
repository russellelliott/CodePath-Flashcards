//
//  CreationViewController.swift
//  Flashcards
//
//  Created by Russell Elliott on 3/12/22.
//

import UIKit

class CreationViewController: UIViewController {
    
    var flashcardsController: ViewController!
    
    //Text field for the question
    @IBOutlet weak var questionTextField: UITextField!
    
    //Text fields for the answer options
    
    //Extra answer 1
    @IBOutlet weak var extraAnswerOneTextField: UITextField!
    
    //Correct answer
    @IBOutlet weak var answerTextField: UITextField!
    
    //Extra answer 2

    @IBOutlet weak var extraAnswerTwoTextField: UITextField!
    
    //Variables for initial question and answer
    var initialQuestion: String?
    
    //Answer fields
    
    //Extra Answer 1
    var initialExtraAnswerOne: String?
    
    //Correct Answer
    var initialAnswer: String?
    
    //Extra Anser Two
    var initialExtraAnswerTwo: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        questionTextField.text = initialQuestion
        extraAnswerOneTextField.text = initialExtraAnswerOne
        answerTextField.text = initialAnswer
        extraAnswerTwoTextField.text = initialExtraAnswerTwo
        
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func done(_ sender: Any) {
        //Get the text from the quesiton text field
        let questionText = questionTextField.text
        
        //Get extra answer 1
        let extraAnswerOneText = extraAnswerOneTextField.text

        //Get the text from the answer text field
        let answerText = answerTextField.text
        
        //Get extra asnwer 2
        let extraAnswerTwoText = extraAnswerTwoTextField.text
        
        //Check if the user has entered a question and an answer on the card. If not, display an error.
        if(questionText=="" || extraAnswerOneText=="" || answerText=="" || extraAnswerTwoText==""){
            //If any of the fields are empty, display error
            // create the alert
            let alert = UIAlertController(title: "Error: Insufficent Data", message: "Your flashcard doesn't include text for the question and/or the three answer options. Make sure you enter a question and three answer options (including one correct answer) for your flashcard.", preferredStyle: UIAlertController.Style.alert)
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
        
        //Variable for whether or not the card exits
        var isExisting = false
        if initialQuestion != nil{
            isExisting = true
        }
        
        //Update the flashcard
        flashcardsController.updateFlashcard(question: questionText!, answer: answerText!, extraAnswerOne: extraAnswerOneText!, extraAnswerTwo: extraAnswerTwoText!, isExisting: isExisting)
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
