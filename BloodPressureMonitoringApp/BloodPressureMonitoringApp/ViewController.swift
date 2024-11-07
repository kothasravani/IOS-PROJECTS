//
//  ViewController.swift
//  BloodPressureMonitoringApp
//
//  Created by Sravani Kotha on 10/31/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var patientIDOL: UITextField!
    
    @IBOutlet weak var systolicOL: UITextField!
    
    @IBOutlet weak var diastolicOL: UITextField!
    
    var image = ""
    var patientID = ""
    var systolicPressure = 0.0
    var diastolicPressure = 0.0
    var bloodPressure = ""
    var mbp = 0
    var result = ""
    var healthTip = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func computeMBPBTN(_ sender: UIButton) {
        systolicPressure = Double(systolicOL.text!)!
        diastolicPressure = Double(diastolicOL.text!)!
        bloodPressure = "\(systolicPressure)/\(diastolicPressure)"
        mbp = Int((0.667 * diastolicPressure) + (0.334 * systolicPressure))
        if mbp < 60{
            image = "stroke"
            result = "Stroke or Internal bleeding"
            healthTip = "Take immediate medical attention 👩🏻‍⚕️"
        } else if mbp <= 69{
            image = "hypotension"
            result = "Hypotension"
            healthTip = "Stay Hydrated💧"
        } else if mbp <= 99{
            image = "healthy"
            result = "Healthy"
            healthTip = "You Are Doing Great!👍🏻"
        } else if mbp <= 106{
            image = "elevated"
            result = "Elevated"
            healthTip = "Make Sure To Workout Regularly👟"
        } else{
            image = "hypertension"
            result = "Hypertension"
            healthTip = "Consult Docter For Medication💊"
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let transition = segue.identifier
        if transition == "resultSegue"{
            let destination = segue.destination as! ResultViewController
            
            destination.image = image
            destination.patientID = patientID
            destination.bloodPressure = bloodPressure
            destination.mbp = mbp
            destination.result = result
            destination.healthTip = healthTip
        }
    }
    
}

