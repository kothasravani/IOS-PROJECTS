//
//  ViewController.swift
//  Kotha_PracticeExam01
//
//  Created by Sravani Kotha on 9/24/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var heightInchesTextField: UITextField!
    
    @IBOutlet weak var heightFeetTextField: UITextField!
    
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var categoryImageView: UIImageView!
    
    //image assets
    let underweightImage = UIImage(named: "underWeight")
    let normalImage = UIImage(named: "normal")
    let overweightImage = UIImage(named: "overWeight")
    let obeseImage = UIImage(named: "obese")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func calcButton(_ sender: UIButton) {
        //given input to be validated
        guard let feetText = heightFeetTextField.text, let feet = Double(feetText),
              let inchesText = heightInchesTextField.text, let inches = Double(inchesText),
              let weightText = weightTextField.text, let weight = Double(weightText) else {
            resultLabel.text = "Please enter valid numbers"
            return
        }
        
        // Convert height to inches
        let totalHeightInches = (feet * 12) + inches
        
        // BMI=703*  weight/〖height 〗^2
        let bmi = (703 * weight) / (totalHeightInches * totalHeightInches)
        
        // Round to decimal
        let roundedBMI = round(bmi * 10) / 10
        
        // Determine BMI and update the image
        var category = ""
        var image: UIImage?
        
        //Underweight<= 18.5, Normal 18.6–24.9, Overweight 25–29.9, Obesity BMI of 30 or greater
        if roundedBMI <= 18.5 {
            category = "UnderWeight"
            image = underweightImage
            print("UnderWeight category")
        } else if roundedBMI > 18.5 && roundedBMI <= 24.9 {
            category = "Normal"
            image = normalImage
            print("Normal category")
        } else if roundedBMI > 24.9 && roundedBMI <= 29.9 {
            category = "OverWeight"
            image = overweightImage
            print("OverWeight category")
        } else if roundedBMI >= 30 {
            category = "Obese"
            image = obeseImage
            print("Obese category")
        }
        
        // Debugging - check the category value before setting the label
        print("Category before setting label: \(category)")
        
        //result - update label separately
        resultLabel.text = "Your Body Mass Index is \(roundedBMI)."
        resultLabel.text! += "\nThis is considered \(category)."
        
        // Ensure the label can handle multiple lines
        resultLabel.numberOfLines = 0
        categoryImageView.image = image
    }
}
