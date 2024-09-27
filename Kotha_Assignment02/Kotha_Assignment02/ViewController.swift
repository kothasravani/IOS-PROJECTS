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

        if let name = nameOutlet?.text, !name.isEmpty {
if let billAmount = billAmountOutlet?.text, !billAmount.isEmpty, let billAmt = Double(`billAmount`) {
                let billAmt = billAmt >= 500 ? billAmt - 50 : billAmt
                if let tip = tipPercentageOutlet?.text, !tip.isEmpty, let tipPercent = Double(tip) {
                    let tipAmt = (billAmt * tipPercent) / 100
                    //date formatter with current time zone
                    let date = dateOutlet?.date
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MM-dd-yyyy hh:mm"
                    dateFormatter.timeZone = TimeZone(identifier: "America/Missouri")
                    //by using ? checking for values if avail printing them in result display for name, bill, percentage and tot amount and current date with time zone
                    nameLabel?.text = "Name: " + name
                    billAmountLabel?.text = "Bill Amount: $" + billAmount
                    tipAmountLabel?.text = "Tip Amount: $\(tipAmt)"
                    //compute the tip amount in dollars and calculate the total bill amount(which is the sum of the bill amount and the calculated tip amount
                    totalAmountLabel?.text = "Total Amount: $\(billAmt + tipAmt)"
                    dateLabel?.text = "\(dateFormatter.string(from: date!))"
                }
            }
        }
    }
    
    
    @IBAction func ResetBTN(_ sender: UIButton) {
        //once click on reset btn fields should be empty
        nameLabel?.text = ""
        billAmountLabel?.text = ""
        tipAmountLabel?.text = ""
        totalAmountLabel?.text = ""
        dateLabel?.text = ""
        nameOutlet?.text = ""
        billAmountOutlet?.text = ""
        tipPercentageOutlet?.text = ""
        // Set focus on the name text field
        nameOutlet?.becomeFirstResponder()
    }
}

