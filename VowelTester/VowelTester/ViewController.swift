//
//  ViewController.swift
//  VowelTester
//
//  Created by Sravani Kotha on 9/10/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var outletTester: UITextField!
    
    
    @IBOutlet weak var outletResponseTester: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func inputOlSubBtn(_ sender: UIButton) {
        let tester : String = outletTester.text!
        if tester.contains("a") || tester.contains("e") || tester.contains("i") || tester.contains("o") || tester.contains("u"){
            
            outletResponseTester.text = " The text in \(tester) has a vowel "
        }else{
            outletResponseTester.text = " The text in \(tester) is not a vowel "
        }
        
    }
    
}

