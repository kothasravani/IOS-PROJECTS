//
//  ViewController.swift
//  Kotha_CalculatorApp
//
//  Created by Sravani Kotha on 9/30/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultOutlet: UILabel!
    
    var currentNumber: Double = 0
    var previousNumber: Double = 0
    var operation: Int = 0
    var performingMath = false
    var decimalAdded = false
    var operatorSelected = false

    override func viewDidLoad() {
        super.viewDidLoad()
        resultOutlet.text = "0"
    }
    
    @IBAction func buttonZero(_ sender: Any) {
        addNumberToLabel("0")
    }
    
    @IBAction func buttonOne(_ sender: Any) {
        addNumberToLabel("1")
    }
    
    @IBAction func buttonTwo(_ sender: Any) {
        addNumberToLabel("2")
    }
    
    @IBAction func buttonThree(_ sender: Any) {
        addNumberToLabel("3")
    }
    
    @IBAction func buttonFour(_ sender: Any) {
        addNumberToLabel("4")
    }
    
    @IBAction func buttonFive(_ sender: Any) {
        addNumberToLabel("5")
    }
    
    @IBAction func buttonSix(_ sender: Any) {
        addNumberToLabel("6")
    }
    
    @IBAction func buttonSeven(_ sender: Any) {
        addNumberToLabel("7")
    }
    
    @IBAction func buttonEight(_ sender: Any) {
        addNumberToLabel("8")
    }
    
    @IBAction func buttonNine(_ sender: Any) {
        addNumberToLabel("9")
    }
    
    // Function for decimal point
    @IBAction func decimalPoint(_ sender: Any) {
        if !decimalAdded {
            resultOutlet.text = resultOutlet.text! + "."
            decimalAdded = true
        }
    }
    
    //handle number appending
    func addNumberToLabel(_ number: String) {
        if performingMath || resultOutlet.text == "0" || operatorSelected {
            resultOutlet.text = number
            performingMath = false
            operatorSelected = false
        } else {
            resultOutlet.text = resultOutlet.text! + number
        }
        currentNumber = Double(resultOutlet.text!) ?? 0
    }
    
    //operators
    @IBAction func addition(_ sender: Any) {
        performOperation(15)
    }
    
    @IBAction func subtraction(_ sender: Any) {
        performOperation(14)
    }
    
    @IBAction func multiplication(_ sender: Any) {
        performOperation(13)
    }
    
    @IBAction func division(_ sender: Any) {
        performOperation(12)
    }
    
    @IBAction func modulo(_ sender: Any) {
        performOperation(17)
    }
    
    //handle operator selection
    func performOperation(_ operationTag: Int) {
        if resultOutlet.text != "" {
            previousNumber = Double(resultOutlet.text!)!
            operation = operationTag
            performingMath = true
            operatorSelected = true
            decimalAdded = false
        }
    }
    
    //equal button
    @IBAction func equalButton(_ sender: Any) {
        var result: Double = 0
        
        if operation == 12 { // Division
            if currentNumber != 0 {
                result = previousNumber / currentNumber
            } else {
                resultOutlet.text = "Not a number"
                return
            }
        } else if operation == 13 { // Multiplication
            result = previousNumber * currentNumber
        } else if operation == 14 { // Subtraction
            result = previousNumber - currentNumber
        } else if operation == 15 { // Addition
            result = previousNumber + currentNumber
        } else if operation == 17 { // Modulo
            result = previousNumber.truncatingRemainder(dividingBy: currentNumber)
        }
        
        // Format result to two decimal places if necessary
        if result == floor(result) {
            resultOutlet.text = "\(Int(result))"
        } else {
            resultOutlet.text = String(format: "%.2f", result)
        }
        
        performingMath = true
        operatorSelected = false
    }
    
    // AC
    @IBAction func clearAll(_ sender: Any) {
        resultOutlet.text = "0"
        previousNumber = 0
        currentNumber = 0
        operation = 0
        performingMath = false
        decimalAdded = false
    }
    
    // C
    @IBAction func clearLastEntry(_ sender: Any) {
        let currentText = resultOutlet.text ?? "0"
           if currentText.count > 1 {
               resultOutlet.text = String(currentText.dropLast())
           } else {
               resultOutlet.text = "0"
           }
           currentNumber = Double(resultOutlet.text!) ?? 0
       }
    
    // Function for changing sign (+/-)
    @IBAction func changeSign(_ sender: Any) {
        if let value = Double(resultOutlet.text!) {
            resultOutlet.text = String(value * -1)
            currentNumber = Double(resultOutlet.text!)!
        }
    }
}
