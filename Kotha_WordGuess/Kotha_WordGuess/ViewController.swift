//
//  ViewController.swift
//  Kotha_WordGuess
//
//  Created by Sravani Kotha on 10/22/24.
//

import UIKit

class ViewController: UIViewController {

    // Outlets
    @IBOutlet weak var wordsGuessedLabel: UILabel!
    @IBOutlet weak var wordsRemainingLabel: UILabel!
    @IBOutlet weak var totalWordsLabel: UILabel!
    @IBOutlet weak var userGuessLabel: UILabel!
    @IBOutlet weak var guessLetterField: UITextField!
    @IBOutlet weak var guessLetterButtonPressed: UIButton!
    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var guessCountLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var playAgainButtonPressed: UIButton!
    @IBOutlet weak var displayImage: UIImageView!

    // Game variables
    let wordsArray = [
        ("kotha", "SRAVANI", "northwest_missouri_state.jpg"),
        ("dog", "ANIMAL", "Dog.jpg"),
        ("swift", "PROGRAMMING LANGUAGE", "Swift.jpg"),
        ("iphone", "IOS OPERATING SYSTEM", "Iphone.jpg"),
        ("rose", "FLOWER", "Flower.jpg")
    ]
    
    var currentWord: String = ""
    var currentHint: String = ""
    var currentImage: String = ""
    var maxNumOfWrongGuesses = 10
    var wrongGuesses = 0
    var guessCount = 0
    var wordsGuessed = 0
    var currentWordIndex = 0
    var guessedLetters: Set<Character> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        playAgainButtonPressed.isHidden = true
        guessLetterButtonPressed.isEnabled = false // Disable button initially
        newGame()

        // Add target to the text field
        guessLetterField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }

    @objc func textFieldDidChange() {
        // Enable button if there is text
        guessLetterButtonPressed.isEnabled = !(guessLetterField.text?.isEmpty ?? true)
    }

    func newGame() {
        currentWordIndex = 0
        wordsGuessed = 0
        wrongGuesses = 0
        guessCount = 0
        guessedLetters.removeAll()
        loadNewWord()
        updateLabels()
        statusLabel.text = ""
    }
    
    func loadNewWord() {
        let currentItem = wordsArray[currentWordIndex]
        currentWord = currentItem.0.uppercased()
        currentHint = currentItem.1
        currentImage = currentItem.2
        
        hintLabel.text = "Hint: \(currentHint)"
        userGuessLabel.text = String(repeating: "_ ", count: currentWord.count)
        guessCountLabel.text = "You have made \(wrongGuesses) guesses."
        displayImage.image = nil // Clear image
    }

    func updateLabels() {
        wordsGuessedLabel.text = "Total Number Of Words Guessed Successfully: \(wordsGuessed)"
        wordsRemainingLabel.text = "Total Number Of Words Remaining in Game: \(wordsArray.count - wordsGuessed)"
        totalWordsLabel.text = "Total Number Of Words in Game: \(wordsArray.count)"
    }

    @IBAction func guessLetterButtonPressed(_ sender: UIButton) {
        guard let letter = guessLetterField.text?.uppercased().last else { return }
        
        guessLetterField.text = ""
        textFieldDidChange()
        incrementGuessCount()

        if !guessedLetters.contains(letter) {
            guessedLetters.insert(letter)
            processGuess(letter: letter)
        }
    }

    func incrementGuessCount() {
        guessCount += 1
        guessCountLabel.text = "You have made \(guessCount) guesses."
    }

    func processGuess(letter: Character) {
        if currentWord.contains(letter) {
            updateGuessedWord(for: letter)
            verifyWinCondition()
        } else {
            handleWrongGuess()
        }
    }

    func handleWrongGuess() {
        wrongGuesses += 1
        guessCountLabel.text = "You have made \(wrongGuesses) wrong guesses."
        
        // Check if all guesses are used and the word has not been guessed
        if wrongGuesses >= maxNumOfWrongGuesses {
            guessCountLabel.text = "You have used all the available guesses. Please play again."
            playAgainButtonPressed.isHidden = false // Enable
            guessLetterButtonPressed.isEnabled = false // Disable
        }
    }

    func updateGuessedWord(for letter: Character) {
        userGuessLabel.text = currentWord.map { guessedLetters.contains($0) ? "\($0) " : "_ " }.joined()
    }

    func verifyWinCondition() {
        if !(userGuessLabel.text?.contains("_") ?? true) {
            wordsGuessed += 1
                        displayImage.image = UIImage(named: currentImage)

            // count reached the maximum allowed
            if guessCount == maxNumOfWrongGuesses {
                guessCountLabel.text = "You guessed the word! Click Play Again."
            } else {
                guessCountLabel.text = "Wow!, You have made \(wrongGuesses) guesses to guess the word."
            }

            playAgainButtonPressed.isHidden = false
            guessLetterButtonPressed.isHidden = true
            if wordsGuessed >= wordsArray.count {
                statusLabel.text = "Congratulations, You are done, Please start over again!"
                guessLetterButtonPressed.isHidden = true
            }
        }
    }

    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        // If used all guesses and did not guess the word, reset the current word
        if wrongGuesses >= maxNumOfWrongGuesses && userGuessLabel.text?.contains("_") ?? false {
            resetWordState()
            guessLetterButtonPressed.isEnabled = true
            playAgainButtonPressed.isHidden = true
            return
        }
        
        if currentWordIndex < wordsArray.count - 1 {
            currentWordIndex += 1
        } else {
            resetGame()
            return
        }

        loadNewWord()
        resetWordState()
        
        guessLetterButtonPressed.isHidden = false
        playAgainButtonPressed.isHidden = true
        updateLabels()
    }

    // Function to reset the game state for the next word
    func resetGame() {
        currentWordIndex = 0
        wordsGuessed = 0
        wrongGuesses = 0
        guessCount = 0
        guessedLetters.removeAll()
        loadNewWord()
        updateLabels()
        statusLabel.text = "Congratulations, You are done, Please start over again!"
        displayImage.image = nil
        playAgainButtonPressed.isHidden = true
        guessLetterButtonPressed.isHidden = false
    }

    // Function to reset
    func resetWordState() {
        wrongGuesses = 0
        guessCount = 0
        guessedLetters.removeAll()
        userGuessLabel.text = String(repeating: "_ ", count: currentWord.count)
        guessCountLabel.text = "You have made \(wrongGuesses) guesses."
        statusLabel.text = ""
        displayImage.image = nil
    }
}
