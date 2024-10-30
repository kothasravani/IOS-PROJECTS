//
//  ViewController.swift
//  MVCDemo
//
//  Created by Sravani Kotha on 10/24/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var amountOutlet: UITextField!
    @IBOutlet weak var discountOutlet: UITextField!
    
    var amount = 0.0
    var discountRate = 0.0
    var priceAfterDiscount = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //read the amount and discount rates
    }

    @IBAction func computeBtn(_ sender: UIButton) {
        amount = Double(amountOutlet.text!)!
        discountRate = Double(discountOutlet.text!)!
        priceAfterDiscount = amount - amount * discountRate/100
    }
    
    //prepare method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //create transition
        let transition = segue.identifier
        if transition == "resultSegue"{
            //we need to create a destination
            let destination = segue.destination
            as! ResultViewController
            
            //assigning values to the destination
            destination.amount = amountOutlet.text!
            destination.discountRate = discountOutlet.text!
            destination.priceAfterDiscount = String(priceAfterDiscount)
        }
    }
    
}

