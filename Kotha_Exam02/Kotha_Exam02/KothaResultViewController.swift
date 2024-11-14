//
//  KothaResultViewController.swift
//  Kotha_Exam02
//
//  Created by Sravani Kotha on 11/7/24.
//

import UIKit

class KothaResultViewController: UIViewController {
    
    // Outlets for labels and image view
    @IBOutlet weak var customerNameLabel: UILabel!
    @IBOutlet weak var paymentHistoryLabel: UILabel!
    @IBOutlet weak var creditUtilizationLabel: UILabel!
    @IBOutlet weak var creditScoreLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var recommendationLabel: UILabel!
    @IBOutlet weak var scoreImageView: UIImageView!
    @IBOutlet weak var errorMessageLabel: UILabel!  // Add an IBOutlet for the error message label
    
    var customerName: String = ""
    var paymentHistory: String = ""
    var creditUtilization: String = ""
    var creditScore: Int = 0
    var result: String = ""
    var recommendation: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Check if the recommendation is an error message
        if recommendation.contains("Please enter the values") {
            // Display only the error message and center it
            errorMessageLabel.text = recommendation
            errorMessageLabel.isHidden = false
            
            // Hide all other labels and image view
            customerNameLabel.isHidden = true
            paymentHistoryLabel.isHidden = true
            creditUtilizationLabel.isHidden = true
            creditScoreLabel.isHidden = true
            resultLabel.isHidden = true
            recommendationLabel.isHidden = true
            scoreImageView.isHidden = true
            
            // Center the error message label
            errorMessageLabel.textAlignment = .center
            errorMessageLabel.numberOfLines = 0
        } else {
            // Populate the result details as normal
            customerNameLabel.text = "Customer Name: \(customerName)"
            paymentHistoryLabel.text = "Payment History Rating: \(paymentHistory)"
            creditUtilizationLabel.text = "Credit Utilization Score: \(creditUtilization)"
            creditScoreLabel.text = "Credit Score: \(creditScore)"
            resultLabel.text = "Result: \(result)"
            recommendationLabel.text = recommendation
            scoreImageView.image = getImageForScoreRange(creditScore: creditScore)
            errorMessageLabel.isHidden = true
        }
    }

    func getImageForScoreRange(creditScore: Int) -> UIImage? {
        switch creditScore {
        case 800...850:
            return UIImage(named: "800-850")
        case 740..<800:
            return UIImage(named: "740-799")
        case 670..<740:
            return UIImage(named: "670-739")
        case 580..<670:
            return UIImage(named: "580-669")
        case 300..<580:
            return UIImage(named: "300-579")
        default:
            return nil
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
