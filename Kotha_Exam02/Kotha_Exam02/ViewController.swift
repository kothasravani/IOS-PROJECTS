import UIKit

class ViewController: UIViewController {

    // Outlets for UI components
    @IBOutlet weak var customerNameTextField: UITextField!
    @IBOutlet weak var paymentHistoryTextField: UITextField!
    @IBOutlet weak var creditUtilizationTextField: UITextField!
    @IBOutlet weak var calculateScoreButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    // Variables to store the calculated score and result
    var creditScore: Int = 0
    var result: String = ""
    var recommendation: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initially disable buttons until all fields have input
        calculateScoreButton.isEnabled = false
        resetButton.isEnabled = false
        
        // Add target for text field editing changes to enable buttons dynamically
        customerNameTextField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        paymentHistoryTextField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        creditUtilizationTextField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
    }
    
    // This function checks if all fields have input to enable buttons
    @objc func textFieldsDidChange() {
        // Enable buttons if all text fields have content
        let areAllFieldsFilled = !(customerNameTextField.text?.isEmpty ?? true) &&
                                 !(paymentHistoryTextField.text?.isEmpty ?? true) &&
                                 !(creditUtilizationTextField.text?.isEmpty ?? true)
        calculateScoreButton.isEnabled = areAllFieldsFilled
        resetButton.isEnabled = areAllFieldsFilled
    }
    
    @IBAction func calculateScoreTapped(_ sender: UIButton) {
        guard let paymentHistory = Int(paymentHistoryTextField.text ?? ""),
                  let creditUtilization = Int(creditUtilizationTextField.text ?? ""),
                  paymentHistory >= 0 && paymentHistory <= 550,
                  creditUtilization >= 0 && creditUtilization <= 458 else {
                // If inputs are out of range, display only the error message
                recommendation = "Please enter the values for Payment history and Credit utilization between 0-550 and 0-458 respectively."
                return
            }
            
            // Calculate the credit score
            creditScore = 300 + Int(0.583 * Double(paymentHistory)) + Int(0.5 * Double(creditUtilization))
            
        
        // Determine the result and recommendation based on the credit score
        switch creditScore {
        case 800...850:
            result = "Excellent"
            recommendation = "Credit Scope: Individuals in this range are considered to be at the lowest risk. They have a history of making payments on time and keeping credit utilization low. They’re eligible for the best interest rates and credit products 🏦 🏦✅."
        case 740..<800:
            result = "Very Good"
            recommendation = "Credit Scope: Still a very desirable range with minimal risk. Borrowers with scores in this category are likely to qualify for favorable rates and terms 💸."
        case 670..<740:
            result = "Good"
            recommendation = "Credit Scope: This is considered an acceptable credit score range. People with scores in this range are generally approved for credit but may not receive the lowest interest rates 💳."
        case 580..<670:
            result = "Fair"
            recommendation = "Credit Scope: This range indicates higher credit risk. People with scores in this range may have had missed payments or higher credit utilization. They may qualify for credit, but it usually comes with higher interest rates or less favorable terms ⤴️⤴️⚠️🟡."
        default:
            result = "Poor"
            recommendation = "Credit Scope: The lowest category, indicating significant credit risk. Borrowers in this range may have a history of missed payments, high utilization, or other negative factors. They often find it challenging to obtain credit and may be subject to very high interest rates if they do qualify ⤴️⤴️⤴️🛑⚠️⚠️."
        }
    }
    
    @IBAction func resetTapped(_ sender: UIButton) {
        customerNameTextField.text = ""
        paymentHistoryTextField.text = ""
        creditUtilizationTextField.text = ""
        calculateScoreButton.isEnabled = false
        resetButton.isEnabled = false
        customerNameTextField.becomeFirstResponder()
    }
    
    // Prepare data to pass to the ResultViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultSegue" {
            if let resultVC = segue.destination as? KothaResultViewController {
                resultVC.customerName = customerNameTextField.text ?? ""
                resultVC.paymentHistory = paymentHistoryTextField.text ?? ""
                resultVC.creditUtilization = creditUtilizationTextField.text ?? ""
                resultVC.creditScore = creditScore
                resultVC.result = result
                resultVC.recommendation = recommendation
            }
        }
    }
}
