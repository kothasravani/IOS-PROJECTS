//
//  ViewController.swift
//  Kotha_Assignment02
//
//  Created by Sravani Kotha on 9/11/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel?
    
    @IBOutlet weak var billAmountLabel: UILabel?
    
    @IBOutlet weak var tipAmountLabel: UILabel?
    
    @IBOutlet weak var dateLabel: UILabel?
    
    @IBOutlet weak var totalAmountLabel: UILabel?
    
    @IBOutlet weak var nameOutlet: UITextField?
    
    @IBOutlet weak var billAmountOutlet: UITextField?
    
    @IBOutlet weak var tipPercentageOutlet: UITextField?
    
    @IBOutlet weak var dateOutlet: UIDatePicker?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func SubmitBTN(_ sender: UIButton) {
        //fi
        if let name = nameOutlet?.text, !name.isEmpty {
            if let billAmount = billAmountOutlet?.text, !billAmount.isEmpty, let billAmt = Double(billAmount) {
                if let tip = tipPercentageOutlet?.text, !tip.isEmpty, let tipPercent = Double(tip) {
                    var tipAmt = 0.0
                    //if the bill amount is $500 or higher, apply a $50 discount to the bill amount (not the totalbillamount).
                    if billAmt >= 500{
                        //Hint: Tip Amount in $ = (Bill Amount * Tip Percentage Value) / 100
                        tipAmt = ((billAmt - 50) * tipPercent) / 100
                    }else{
                        tipAmt = (billAmt * tipPercent) / 100
                    }
                    //printing the val
                    nameLabel?.text = "Name: " + name
                    billAmountLabel?.text = "Bill Amount: $" + billAmount
                    tipAmountLabel?.text = "Tip Amount: $\(tipAmt)"
                    //compute the tip amount in dollars and calculate the total bill amount(which is the sum of the bill amount and the calculated tip amount
                    totalAmountLabel?.text = "Total Amount: $\(billAmt + tipAmt)"
                    dateLabel?.text = "09-12-2024 13:24:00"
                }
            }
        }
    }
    
    
    @IBAction func ResetBTN(_ sender: UIButton) {
        //once click on reset btn fields should be empty""
        nameLabel?.text = ""
        billAmountLabel?.text = ""
        tipAmountLabel?.text = ""
        totalAmountLabel?.text = ""
        dateLabel?.text = ""
        nameOutlet?.text = ""
        billAmountOutlet?.text = ""
        tipPercentageOutlet?.text = ""
    }
    
}

