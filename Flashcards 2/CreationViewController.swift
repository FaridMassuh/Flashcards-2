//
//  CreationViewController.swift
//  Flashcards 2
//
//  Created by Farid on 3/13/20.
//  Copyright © 2020 Farid Massuh. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {

//-------------------------------------------
    
    // OUTLETS - PROPERTIES
    
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var answerTextField: UITextField!
   
    
    @IBOutlet weak var questionTextField2: UITextField!
    @IBOutlet weak var answerTextField2: UITextField!
    
    
    @IBOutlet weak var questionTextField3: UITextField!
    @IBOutlet weak var answerTextField3: UITextField!
    
    
    var initialQuestion: String?
    var initialAnswer: String?
    
    var initialQuestion2: String?
    var initialAnswer2: String?

    var initialQuestion3: String?
    var initialAnswer3: String?
    
//-------------------------------------------

    
    // this is calling to have this page have acess to another page
    var flashcardsController: ViewController!
    
//-------------------------------------------

    
    override func viewDidLoad() {
        super.viewDidLoad()

        questionTextField.text = initialQuestion
        answerTextField.text = initialAnswer
        
        questionTextField2.text = initialQuestion2
        answerTextField2.text = initialAnswer2
        
        questionTextField3.text = initialQuestion3
        answerTextField3.text = initialAnswer3
        
    }
    
//-------------------------------------------

    //  CANCEL  BUTTON
    
    @IBAction func cancelButtonTap(_ sender: Any) {
        // dismiss is a function to dismiss something like a screen
        dismiss(animated: true)
    }
    
//-------------------------------------------

    //  DONE  BUTTON
    
    @IBAction func doneButtonTap(_ sender: Any) {
        
        // get this string text from the whoever types in the field
        let questionText = questionTextField.text
        let answerText = answerTextField.text
        
        let questionText2 = questionTextField2.text
        let answerText2 = answerTextField2.text
        
        let questionText3 = questionTextField3.text
        let answerText3 = answerTextField3.text
        
        
        if questionText == nil || answerText == nil || questionText!.isEmpty || answerText!.isEmpty
 {
            let alert = UIAlertController(title: "Missing Text", message: "You need to enter both a question & answer", preferredStyle: UIAlertController.Style .alert)
            present(alert, animated: true)
    
            let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
    
    
        }
            
        if questionText2 == nil || answerText2 == nil || questionText2!.isEmpty || answerText2!.isEmpty
        {
            let alert = UIAlertController(title: "Missing Text", message: "You need to enter both a question & answer", preferredStyle: UIAlertController.Style .alert)
                   present(alert, animated: true)
           
            let okAction = UIAlertAction(title: "Ok", style: .default)
               alert.addAction(okAction)
               }

        if questionText3 == nil || answerText3 == nil || questionText3!.isEmpty || answerText3!.isEmpty
            {
            let alert = UIAlertController(title: "Missing Text", message: "You need to enter both a question & answer", preferredStyle: UIAlertController.Style .alert)
                       present(alert, animated: true)
               
            let okAction = UIAlertAction(title: "Ok", style: .default)
                   alert.addAction(okAction)
                   }

            
            
        else{
            // update to call the function to update the flashcard
            flashcardsController.updateFlashcard(question: questionText!, answer: answerText!)
            
            
            // DISMISS PAGE
            dismiss(animated: true)
            
            
        }
        
        
           
        
    }
    
   
    
//-------------------------------------------

    
    
    
    
    
    
    
    

}
