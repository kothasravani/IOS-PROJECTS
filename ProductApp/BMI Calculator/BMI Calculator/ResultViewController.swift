//
//  resultViewController.swift
//  BMI Calculator
//
//  Created by Sravani Kotha on 10/29/24.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet weak var bmiOutlet: UILabel!
    
    @IBOutlet weak var messageOutlet: UILabel!
    
    @IBOutlet weak var imageOutlet: UIImageView!
    
    var bmiValue = 0.0
    var message = ""
    var image = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //values outlet
        bmiOutlet.text! += String(bmiValue)
        messageOutlet.text! += message
        //image outlet
        imageOutlet.image = UIImage(named: image)
        
        // Do any additional setup after loading the view.
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
