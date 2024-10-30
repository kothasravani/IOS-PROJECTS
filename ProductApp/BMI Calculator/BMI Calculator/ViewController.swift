//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Sravani Kotha on 10/29/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var bmiHeightOutlet: UITextField!
    
    @IBOutlet weak var bmiWeightOutlet: UITextField!
    
    var bmiValue = 0.0
    var message = ""
    var image = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func calculateBtn(_ sender: UIButton) {
        
        if let heightText = bmiHeightOutlet.text, let heightInInches = Double(heightText),
           let weightText = bmiWeightOutlet.text, let weight = Double(weightText) {
            
            // Convert the height in inches to feet and inches
            let feet = Int(heightInInches) / 12
            let remainingInches = Int(heightInInches) % 12
            print("Height in feet and inches: \(feet) feet \(remainingInches) inches")
            
            // Calculate BMI using height in inches
            bmiValue = (703 * weight) / (heightInInches * heightInInches)
            
            // Determine the appropriate message and image based on BMI value
            if bmiValue < 18.5 {
                message = "Underweight"
                image = "underweight"
            } else if bmiValue < 25 {
                message = "Normal weight"
                image = "normalweight"
            } else if bmiValue < 30 {
                message = "Overweight"
                image = "overweight"
            } else {
                message = "Obese"
                image = "obesity"
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let transition = segue.identifier
        if transition == "resultSegue" 
        {
            let destination = segue.destination as! ResultViewController
            destination.bmiValue = bmiValue
            destination.message = message
            destination.image = image
        }
    }
}

