//
//  ViewController.swift
//  GuessTheNumber
//
//  Created by Cynthia Mo on 10/19/18.
//  Copyright © 2018 Cynthia Mo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //! in Swift means it won't be null. tells compilers to not give you errors/warnings
    //not the best coding practice
    
    //var is a value that will change
    var numberToGuess: Int!
    
    //make variable that will stay the same
    let lowerBound = 1
    let upperBound = 100
    
    var numberOfGuesses = 0
    
    @IBOutlet weak var guessTextField: UITextField!
    
    @IBOutlet weak var guessLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateRandomNumber()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func generateRandomNumber()
    {
        numberToGuess = Int(arc4random_uniform(100)) + lowerBound
    }
    
    @IBAction func submitButtonPressed(_ sender: Any)
    {
        //ensure you're not giving it invalid input
        //only runs code if you have valid input
        if let guess = guessTextField.text
        {
            //cast text from text field to integer, makes sure this can cast to integer
            if let guessInt = Int(guess)
            {
                //increment the guess counter
                numberOfGuesses += 1
                
                validateGuess(guess: guessInt)
            }
        }
    }
    
    func validateGuess(guess: Int)
    {
        if guess < lowerBound || guess > upperBound
        {
            showBoundsAlert()
        }
        else if guess < numberToGuess
        {
            //alert user guess is low
            guessLabel.text = "Guess higher"
        }
        else if guess > numberToGuess
        {
            //alert user
            guessLabel.text = "Guess lower"

        }
        else
        {
            //if all the conditions are false that means they guessed the right number
            showWinnerAlert()
            
            //reset the game
            numberOfGuesses = 0
            guessLabel.text = "Guess The Number"
            generateRandomNumber()

        }
    }
    
    func showBoundsAlert()
    {
        let alert = UIAlertController(title: "Hey! 🛑", message: "Stop, your guess is out of bounds, guess a number between 1 and 100", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
        
        //connects the alert and the action
        alert.addAction(action)
        
        //presents to user or else xcode just keeps it all to itself
        self.present(alert, animated: true)
    }
    
    func showWinnerAlert()
    {
        let alert = UIAlertController(title: "Congrats! 👊🏻", message: "You won with a total of \(numberOfGuesses) guesses", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Play Again", style: .default, handler: nil)
        
        //connects the alert and the action
        alert.addAction(action)
        
        //presents to user or else xcode just keeps it all to itself
        self.present(alert, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

