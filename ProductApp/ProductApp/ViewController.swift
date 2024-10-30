//
//  ViewController.swift
//  ProductApp
//
//  Created by Sravani Kotha on 9/5/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var number1Outlet: UITextField!
    
    
    @IBOutlet weak var number2Outlet: UITextField!
    
    
    @IBOutlet weak var resultLabelOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func submitBtnInput(_ sender: UIButton) {
        //read first num convert to int
        var number1 = Int ( number1Outlet.text!)
        
        //read sec num convert to int
        var number2 = Int ( number2Outlet.text!)
        
        //cal prod and assign it to display var
        var product = number1! * number2!
        resultLabelOutlet.text = "Prod of Num1 and Num2 is:\(product)"
    }
    
}

