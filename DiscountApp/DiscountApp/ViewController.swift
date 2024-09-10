//
//  ViewController.swift
//  DiscountApp
//
//  Created by Sravani Kotha on 9/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputOl: UITextField!
    
    
    @IBOutlet weak var outputOl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func submitBtn(_ sender: UIButton) {
        //connections for discount (>50, <100, >100)
        let number  = Int(inputOl.text!)
        if number! <= 50 {
            let discount  = (10 * number!)/100
            outputOl.text! = " you received 10% of discount on \(String(describing :number)) is: \(discount)!😊"
        }else if number! >= 50 && number! <= 100{
            let discount = ((20 * number!)/100)
            outputOl.text! = " you received 20% of discount on \(String(describing :number)) is: \(discount)!🤩"
        }else if number! >= 100 && number! <= 150{
            let discount = ((30 * number!)/100)
            outputOl.text! = " you received 30% of discount on \(String(describing :number)) is: \(discount)!🥳"
        } else if number! > 150{
                // Case when the number exceeds 150
                outputOl.text = "Number should be between 0 and 150."
        } 
    }
}

