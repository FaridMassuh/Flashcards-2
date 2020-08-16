//
//  ViewController.swift
//  Flashcards 2
//
//  Created by Farid on 3/13/20.
//  Copyright © 2020 Farid Massuh. All rights reserved.
//




import UIKit


struct Flashcard {
    var question: String
    var answer: String
    
}




//-------------------------------------------


// THIS IS SAYING THIS PAGE HAS ACCESS TO THIS PAGE
class ViewController: UIViewController {

//-------------------------------------------

    
    // OUTLETS ARE VARIABLES / OBJECTS
    
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var card: UIView!
    
    
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    
    
    @IBOutlet weak var plusSign: UIButton!
    
    // arrays to hold our flashcard
    var flashcards = [Flashcard]()
    
    
    
    // current flashcard index
    var currentIndex = 0
    
    
    
//---------------------------------------------

    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        // we know the destination of the segue is the Navigation Controller
        let navigationController = segue.destination as! UINavigationController
        
        // we know the Navigation Controller only contains a Creation View Controller
        let creationController = navigationController.topViewController as! CreationViewController
        
        // we set the flashcardsController property to self
        creationController.flashcardsController = self
    
        //creationController.questionTextField.text = frontLabel.text
        //creationController.answerTextField.text = backLabel.text
        
        
        
        
        //creationController.initialQuestion = frontLabel.text
        //creationController.initialAnswer = backLabel.text

        
        if segue.identifier == "EditSegue" {
            creationController.initialQuestion = frontLabel.text
            creationController.initialAnswer = backLabel.text
        }
        
    }
    

// Do any additional setup after loading the view.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateFlashcard(question: "What's your pokemon", answer: "Charmander")
        
        // card corners
        card.layer.cornerRadius = 40.0
        backLabel.layer.cornerRadius = 40.0
        frontLabel.layer.cornerRadius = 40.0
        buttonOne.layer.cornerRadius = 20.0
        buttonTwo.layer.cornerRadius = 20.0
        buttonThree.layer.cornerRadius = 20.0
        //plusSign.layer.cornerRadius = 20.0
        
        // unsure what clips to bound mean
        backLabel.clipsToBounds = true
        frontLabel.clipsToBounds = true
        
        // card shadows
        card.layer.shadowRadius = 15.0
        card.layer.shadowOpacity = 0.2
        
        // borders
        buttonOne.layer.borderWidth = 5.0
        buttonOne.layer.borderColor = #colorLiteral(red: 1, green: 0.7959558368, blue: 0, alpha: 1)
        // borders
        buttonTwo.layer.borderWidth = 5.0
        buttonTwo.layer.borderColor = #colorLiteral(red: 1, green: 0.7959558368, blue: 0, alpha: 1)
        // borders
        buttonThree.layer.borderWidth = 5.0
        buttonThree.layer.borderColor = #colorLiteral(red: 1, green: 0.7959558368, blue: 0, alpha: 1)
        // borders
        //plusSign.layer.borderWidth = 5.0
        //plusSign.layer.borderColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        
    }
    
    
    
//-------------------------------------------

// FUNCTIONS ARE ACTIONS
    
// this function is from the tap gesture recognizer
    
//A Tap Gesture Recognizer makes it easy to know when our users tap on a specific view, the container view in our case, and allows us to run some code when the tap happens. Just like when we connected buttons in the pre-work, we can connect the tap gesture to run some code by ctrl+dragging and naming the function didTapOnFlashcard.
    
    
    @IBAction func didTapOnFlashcard(_ sender: Any) {
        
        // IF THIS IS TRUE {DO THIS}
            
            // this is true
        if frontLabel.isHidden {
            
            //show this
            frontLabel.isHidden = false
           
            //hide this
            backLabel.isHidden = true
            
            
        }
            //else do this
        else{
            frontLabel.isHidden = true
            backLabel.isHidden = false
        }
        
    }
    
//-------------------------------------------
    
    // UPDATE FLASHCARD
    
    
    // func NAME (name: Type, name2: Type)
    
    func updateFlashcard(question: String, answer: String) {
        
        
        // do stuff here
        let flashcard = Flashcard(question: question, answer: answer)
        frontLabel.text = flashcard.question
        backLabel.text = flashcard.answer
        
        
        flashcards.append(flashcard)
        // Logging to the console
        print("Added new flashcard")
        print("We now have \(flashcards.count) flashcards)")
        
        
        currentIndex = flashcards.count - 1
        print("Our current index is \(currentIndex)")
        
        
        // update buttons
        updateNextPrevButtons()
        
        
        // update labels
        updateLabels()
        
    }
    
    
    
    
//-------------------------------------------

    // BUTTON 1 CLICKED
    
    @IBAction func buttonOneTap(_ sender: Any) {
        buttonOne.isHidden = true
    }
    
//-------------------------------------------

    // BUTTON 2 CLICKED
    
    @IBAction func buttonTapTwo(_ sender: Any) {
        if frontLabel.isHidden {
            frontLabel.isHidden = false
            backLabel.isHidden = true
        }
        else{
            frontLabel.isHidden = true
            backLabel.isHidden = false
        }
    }

//-------------------------------------------

    // BUTTON 3 CLICKED
    
    @IBAction func buttonTapThree(_ sender: Any) {
        buttonThree.isHidden = true
    }
    
    
//-------------------------------------------

    // NEXT BUTTON CLICKED
    
    @IBAction func nextButtonTap(_ sender: Any) {
        
        // increase current index
        currentIndex = currentIndex + 1
        
        // update labels
        updateLabels()
        
        // update buttons
        updateNextPrevButtons()
        
    }
    
//-------------------------------------------

    // PREVIOUS BUTTON CLICKED

    @IBAction func previousButtonTap(_ sender: Any) {
        // increase current index
        currentIndex = currentIndex + 1
        
        // update labels
        updateLabels()
        
        // update buttons
        updateNextPrevButtons()
    }
    
//-------------------------------------------

    // PREVIOUS + NEXT BUTTON
    
    func updateNextPrevButtons(){

        //disable next button if at the end
        if currentIndex == flashcards.count -  1 {
            nextButton.isEnabled = false
        }
        else{
            nextButton.isEnabled = true
        }
        // disabled prev button if at the beginning
    }
    
//-------------------------------------------

     // UPDATE LABELS
    
    func updateLabels(){
        
        // get current flashcard
        let currentFlashcard = flashcards[currentIndex]
        
        // update labels
        frontLabel.text = currentFlashcard.question
        backLabel.text = currentFlashcard.answer
        
        
    }
    
    
}

