//
//  ResultViewController.swift
//  Kotha_PracticeExam02
//
//  Created by Sravani Kotha on 11/5/24.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var loanTypeOutlet: UILabel!
    
    @IBOutlet weak var loanAmountOutlet: UILabel!
    
    @IBOutlet weak var interestRateOutlet: UILabel!
    
    @IBOutlet weak var emiAmountOutlet: UILabel!
    
    @IBOutlet weak var loanImageView: UIImageView!
    
    // Variables to hold data from the previous view
        var loanType = ""
        var loanAmount = ""
        var interestRate = ""
        var emiAmount = ""
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Update labels with passed data from fragment 1 to fragment 2
        loanTypeOutlet.text = "Loan Type: \(loanType)"
        loanAmountOutlet.text = "Entered Loan Amount: \(loanAmount)"
        interestRateOutlet.text = "Entered Interest Rate: \(interestRate)%"
        emiAmountOutlet.text = "Calculated Monthly EMI Amount: \(emiAmount)"
        
        // Set the relevant image based on the loan type
        switch loanType.lowercased() {
        case "car":
            loanImageView.image = UIImage(named: "Car")
        case "personal":
            loanImageView.image = UIImage(named: "Personal")
        case "home":
            loanImageView.image = UIImage(named: "Home")
        default:
            loanImageView.image = UIImage(named: "")
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
