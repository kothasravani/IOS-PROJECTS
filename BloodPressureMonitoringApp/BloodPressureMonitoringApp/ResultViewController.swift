//
//  ResultViewController.swift
//  BloodPressureMonitoringApp
//
//  Created by Sravani Kotha on 10/31/24.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var patientIDOL: UILabel!
    
    @IBOutlet weak var bloodPressureOL: UILabel!
    
    @IBOutlet weak var mbpOL: UILabel!
    
    @IBOutlet weak var resultOL: UILabel!
    
    @IBOutlet weak var healthTipOL: UILabel!
    
    @IBOutlet weak var imageOL: UIImageView!
    
    var image = ""
    var patientID = ""
    var bloodPressure = ""
    var mbp = 0
    var result = ""
    var healthTip = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageOL.image = UIImage(named: image)
        
        patientIDOL.text! += patientID
        bloodPressureOL.text! += bloodPressure
        mbpOL.text! += String(mbp)
        resultOL.text! += result
        healthTipOL.text! += healthTip
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
