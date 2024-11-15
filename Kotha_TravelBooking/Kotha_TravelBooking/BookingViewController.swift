//
//  ViewController.swift
//  Kotha_TravelBooking
//
//  Created by Sravani Kotha on 11/13/24.
//

import UIKit

class BookingViewController: UIViewController {

    @IBOutlet weak var travellerNameOL: UITextField!
    @IBOutlet weak var noOfTravellersOL: UITextField!
    @IBOutlet weak var cabinTypeOL: UITextField!
    
    var travellerName: String?
    var noOfTravellers: Int?
    var cabinType: String?
    var totalCost: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func bookNowButtonTapped(_ sender: UIButton) {
        guard let travellerName = travellerNameOL.text, !travellerName.isEmpty,
              let noOfTravellersText = noOfTravellersOL.text, let noOfTravellers = Int(noOfTravellersText),
              let cabinTypeInput = cabinTypeOL.text?.lowercased(), !cabinTypeInput.isEmpty else {
            return
        }
        
        self.travellerName = travellerName
        self.noOfTravellers = noOfTravellers
        
        switch cabinTypeInput {
        case "economy":
            cabinType = "Economy"
            totalCost = Double(noOfTravellers) * 150.0
        case "luxury":
            cabinType = "Luxury"
            totalCost = Double(noOfTravellers) * 250.0
        default:
            cabinType = "Invalid"
            totalCost = 0.0
        }
    }
    
    // Prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultSegue",
           let destinationVC = segue.destination as? KothaResultViewController {
            destinationVC.travellerName = travellerName
            destinationVC.noOfTravellers = noOfTravellers
            destinationVC.cabinType = cabinType
            destinationVC.totalCost = totalCost
        }
    }
}
