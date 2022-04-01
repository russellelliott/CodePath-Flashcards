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
    
    //Label for option 1
    @IBOutlet weak var btnOptionOne: UIButton!
    
    //Function for when user taps on option 1
    @IBAction func didTapOptionOne(_ sender: Any) {
        btnOptionOne.isHidden = true;
    }
    
    //Label for option 2 (the correct answer)
    @IBOutlet weak var btnOptionTwo: UIButton!
    
    //Function for when user taps on option 2
    @IBAction func didTapOptionTwo(_ sender: Any) {
        //Show the back label
        frontLabel.isHidden = true;
        //Hide all the buttons
        btnOptionOne.isHidden = true;
        btnOptionTwo.isHidden = true;
        btnOptionThree.isHidden = true;
    }
    
    //Label for option 3
    @IBOutlet weak var btnOptionThree: UIButton!
    
    //Function for when user taps option 3
    @IBAction func didTapOptionThree(_ sender: Any) {
        btnOptionThree.isHidden = true;
        
    }
    
    
    //Array to store the flashcards
    var flashcards = [Flashcard]()
    
    //Current flashcard index
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Read saved flashcards from the disk
        readFromDisk()
        
        //Add the first flashcard if needed
        if(flashcards.count==0){
            updateFlashcard(question: "Sample Question", answer: "Sample Answer", isExisting: false)
        }else{
            //If there are already cards saved on the disk, make sure to update the labels and buttons
            updateLabels()
            updateButtons()
        }
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
        
        //Edit flashcard: display the current card's text
        if segue.identifier == "EditSegue" {
            creationController.initialQuestion = frontLabel.text
            creationController.initialAnswer = backLabel.text
        }
        
    }
    
    func updateFlashcard(question: String, answer: String, isExisting: Bool){
        let flashcard = Flashcard(question: question, answer: answer)
        frontLabel.text = flashcard.question;
        backLabel.text = flashcard.answer;
        
        if isExisting{
            //Replace existing flashcard
            flashcards[currentIndex] = flashcard
        }else{
            //Append flashcard to the list of flashcards
            flashcards.append(flashcard)
            //Debug statements to ensure the code is working
            print("Added new flashcard")
            print("There are now \(flashcards.count) flashcards")
            //Update current index
            //the current index is the number of flash cards minus one
            //for instance, the 3rd card is index 2
            currentIndex = flashcards.count-1
            print("Current index is \(currentIndex)")
        }
        
        //Update buttons
        updateButtons()
        
        //Update labels
        updateLabels()
        
        //Save cards to disk
        saveToDisk()
    }
    
    //User tapped on the "delete" button
    @IBAction func didTapOnDelete(_ sender: Any) {
        
        print("Tapped on delete")
        //Show confirmation
        let alert = UIAlertController(title: "Delete flashcard", message: "Are you sure you want to delete it?", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: { _ in
                    //Cancel Action
                }))
                alert.addAction(UIAlertAction(title: "Delete",
                                              style: UIAlertAction.Style.destructive,
                                              handler: {(_: UIAlertAction!) in
                                                //Delete action
                                                self.deleteCurrentFlashcard()
                                                print("Delete")
                }))
                self.present(alert, animated: true, completion: nil)
        
        
    }
    
    //Delete the current flashcard
    func deleteCurrentFlashcard(){
        //Delete the current flashcard
        flashcards.remove(at: currentIndex)
        
        //Special case: Check if last card was deleted
        if currentIndex > flashcards.count-1 {
            currentIndex = flashcards.count-1
        }
        //Special case 2: There is one flashcard left and the user deletes it
        //At this point, there are 0 flashcards.
        //If no preventive measures are made, the index will become -1. This is an invalid index, and will cause the app to crash.
        //To solve this issue, if there are 0 cards, the current index will be set to 0.
        if(flashcards.count==0){
            currentIndex = 0
        }
        
        //Update buttons
        updateButtons()
        //Update Labels
        updateLabels()
        //Save to disk
        saveToDisk()
    }
    
    //Buttons for the previous and next flashcards
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    //Function that shows the "prev" and "next" buttons depending on how many cards are there and where in the deck we are.
    func updateButtons(){
        //Logic for updating the "prev" button
        //If we are at the beginning of the card deck, disable the "prev" button
        if(currentIndex == 0){
            prevButton.isEnabled = false
        }else{
            prevButton.isEnabled = true
        }
        //Logic for updating the "next" button
        //If we are at the end of the card deck, disable the "next" button
        if(currentIndex == flashcards.count-1){
            nextButton.isEnabled = false
        }else{
            nextButton.isEnabled = true
        }
        
    }
    
    func updateLabels(){
        //Get the current flashcard
        let currentFlashcard = flashcards[currentIndex]
        
        //Update labels
        frontLabel.text = currentFlashcard.question
        backLabel.text = currentFlashcard.answer
    }
    
    //User tapped the "prev" button to go back to the previous card
    @IBAction func prev(_ sender: Any) {
        //Decrease current index
        //The index cannot be below 0. To prevent this, use the max() function to get the maximum of the decremented index and 0. This prevents it from being negative
        currentIndex = max(currentIndex-1, 0)
        
        //Update labels
        updateLabels()
        
        //Update buttons
        updateButtons()
        
    }
    
    
    //User tapped the "next" button to go to the next card
    @IBAction func next(_ sender: Any) {
        //Increase current index
        currentIndex = currentIndex+1
        
        //Update labels
        updateLabels()
        
        //Update buttons
        updateButtons()
    }
    
    //Function that saves the user flashcards to the disk. Called every time the card deck is updated.
    func saveToDisk(){
        //From flashcard array to dictionary array
        let dictionaryArray = flashcards.map{ (card) -> [String:String] in
            return ["question":card.question, "answer": card.answer]
        }
        
        //Save array on disk using UserDefaults
        UserDefaults.standard.set(dictionaryArray, forKey:"flashcards")
        
        //Debug print statement
        print("Flashcards saved to UserDefaults")
    }
    
    //Function that reads cards from disk (if any)
    func readFromDisk(){
        //Read dictionary array from disk (if any)
        //If statement checks if such an array exists
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String:String]] {
            //We know the user has data that has been previously saved to the disk
            let savedCards = dictionaryArray.map{ dictionary->Flashcard in
                return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!)}
            //Put all the cards in the flashcard array
            flashcards.append(contentsOf: savedCards)
        }
    }
    
}

