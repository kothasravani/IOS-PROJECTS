//
//  ViewController.swift
//  Kotha_Exam01
//
//  Created by Sravani Kotha on 9/26/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var electricityTextField: UITextField!
    
    @IBOutlet weak var resultLabel1: UILabel!
    @IBOutlet weak var resultLabel2: UILabel!
    @IBOutlet weak var resultLabel3: UILabel!
    @IBOutlet weak var resultLabel4: UILabel!
    @IBOutlet weak var resultLabel5: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    //The emission factor (n) for electricity consumed = 0.9 kg CO₂/kWh
    let emissionFactor = 0.9
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func calculateCarbonFootprint(electricity: Double) -> Double {
        //CO₂ Emissions (ton) per year = (E × n)/1000
        return (electricity * emissionFactor) / 1000
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        guard let electricityText = electricityTextField.text,
              let electricityConsumed = Double(electricityText),
              let countryText = countryTextField.text, !countryText.isEmpty
        else {
            resultLabel1.text = "Please enter valid data."
            return
        }
        
             let carbonFootprint = calculateCarbonFootprint(electricity: electricityConsumed)
             let roundedCarbonFootprint = round(carbonFootprint * 10000) / 10000.0
                resultLabel1.text = "Location: \(countryText)"
                resultLabel2.text = "Electricity Consumed: \(electricityConsumed) kWh"
                resultLabel3.text = "Carbon Footprint: \(roundedCarbonFootprint) tons CO₂ per year"
        if roundedCarbonFootprint < 2 {
            resultLabel4.text = "Result : Low Carbon Footprint"
            resultLabel5.text = " This is because of Small-scale farming: Manual labor or energy-efficient practices, limited machinery use and Organic farming🌳"
            imageView.image = UIImage(named: "LowCarbonFootprint")
        } else if roundedCarbonFootprint >= 2 && roundedCarbonFootprint < 5 {
            resultLabel4.text = "Result: Medium Carbon Footprint"
            resultLabel5.text = "This is because of Medium-scale farming: like some machinery use, moderate fertilizer application and livestock farming🐄"
            imageView.image = UIImage(named: "MediumCarbonFootprint")
        } else {
            resultLabel4.text = "Result: High Carbon Footprint"
            resultLabel5.text = "This is because of Large-scale industrial farming: Intensive use of machinery, fertilizers, and pesticides and High livestock concentration🐄🐄🐓"
            imageView.image = UIImage(named: "HighCarbonFootprint")
        }
        }
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        //replacing all fields with empty
        countryTextField.text = ""
        electricityTextField.text = ""
        resultLabel1.text = ""
        resultLabel2.text = ""
        resultLabel3.text = ""
        resultLabel4.text = ""
        resultLabel5.text = ""
        imageView.image = nil
        //making country field as a first responder after clicking reset
        countryTextField.becomeFirstResponder()
    }
}
