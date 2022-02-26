//
//  ViewController.swift
//  Flashcards
//
//  Created by Russell Elliott on 2/26/22.
//

import UIKit

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
        frontLabel.isHidden = true;
    }
    
}

