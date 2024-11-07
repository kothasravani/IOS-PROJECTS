//
//  ViewController.swift
//  Kotha_PracticeExam02
//
//  Created by Sravani Kotha on 11/5/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loanTypeOutlet: UITextField!
    
    @IBOutlet weak var loanAmountOutlet: UITextField!
    
    @IBOutlet weak var interestRateOutlet: UITextField!
    
    @IBOutlet weak var termOutlet: UITextField!
    
    @IBOutlet weak var calculateEMIButton: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    
    // Global variables for EMI calculation
    var totalMonths: Double = 0.0
    var monthlyInterestRate: Double = 0.0
    var monthlyEMIPayment: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initial state of buttons
        calculateEMIButton.isEnabled = false
        resetButton.isEnabled = false
        
        // Add target actions to text fields for monitoring input
        [loanTypeOutlet, loanAmountOutlet, interestRateOutlet, termOutlet].forEach { textField in
            textField?.addTarget(self, action: #selector(textFieldsUpdated), for: .editingChanged)
        }
    }
    
    @objc func textFieldsUpdated() {
        // Enable the Calculate and Reset buttons only when all fields have input
        if let loanType = loanTypeOutlet.text, !loanType.isEmpty,
           let loanAmount = loanAmountOutlet.text, !loanAmount.isEmpty,
           let interestRate = interestRateOutlet.text, !interestRate.isEmpty,
           let term = termOutlet.text, !term.isEmpty {
            calculateEMIButton.isEnabled = true
            resetButton.isEnabled = true
        } else {
            calculateEMIButton.isEnabled = false
        }
    }
    
    @IBAction func calculateEMIButton(_ sender: UIButton) {
        guard let loanAmount = Double(loanAmountOutlet.text ?? ""),
              let interestRate = Double(interestRateOutlet.text ?? ""),
              let term = Double(termOutlet.text ?? "")
        else {
            return
        }
        // EMI calculation logic
        totalMonths = term * 12
        monthlyInterestRate = (interestRate / 12) / 100
        monthlyEMIPayment = loanAmount * (monthlyInterestRate * pow(1 + monthlyInterestRate, totalMonths)) / (pow(1 + monthlyInterestRate, totalMonths) - 1)
    }
    @IBAction func resetButton(_ sender: UIButton) {
        // Clear all text fields and reset button states
        loanTypeOutlet.text = ""
        loanAmountOutlet.text = ""
        interestRateOutlet.text = ""
        termOutlet.text = ""
        calculateEMIButton.isEnabled = false
        resetButton.isEnabled = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultSegue",
           let destinationVC = segue.destination as? ResultViewController {
            destinationVC.loanType = loanTypeOutlet.text ?? ""
            destinationVC.loanAmount = loanAmountOutlet.text ?? ""
            destinationVC.interestRate = interestRateOutlet.text ?? ""
            destinationVC.emiAmount = String(format: "%.2f", monthlyEMIPayment)
        }
    }
}
    

