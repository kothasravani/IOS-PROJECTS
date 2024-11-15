//
//  KothaResultViewController.swift
//  Kotha_TravelBooking
//
//  Created by Sravani Kotha on 11/13/24.
//

import UIKit

class KothaResultViewController: UIViewController {

    @IBOutlet weak var imageOL: UIImageView!
    @IBOutlet weak var resultOL: UILabel!
    @IBOutlet weak var travellerNameOL: UILabel!
    @IBOutlet weak var noOfTravellersOL: UILabel!
    @IBOutlet weak var cabinTypeOL: UILabel!
    @IBOutlet weak var totalCostOL: UILabel!
    
    var travellerName: String?
    var noOfTravellers: Int?
    var cabinType: String?
    var totalCost: Double?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        guard let travellerName = travellerName,
              let noOfTravellers = noOfTravellers,
              let cabinType = cabinType else { return }
        
        if cabinType == "Invalid" {
            resultOL.text = "There is no selected class.\nPlease choose a valid class."
            imageOL.image = UIImage(named: "Invalid")
            
            travellerNameOL.isHidden = true
            noOfTravellersOL.isHidden = true
            cabinTypeOL.isHidden = true
            totalCostOL.isHidden = true
            
        } else {
            travellerNameOL.isHidden = false
            noOfTravellersOL.isHidden = false
            cabinTypeOL.isHidden = false
            totalCostOL.isHidden = false
            
            travellerNameOL.text = "Name: \(travellerName)"
            noOfTravellersOL.text = "Number of Travellers: \(noOfTravellers)"
            cabinTypeOL.text = "Cabin Class: \(cabinType)"
            
            if let totalCost = totalCost {
                totalCostOL.text = "Total: \(String(format: "%.1f", totalCost))$"
            }
            
            switch cabinType.lowercased() {
            case "economy":
                resultOL.text = "Hello \(travellerName), \nYour booking is confirmed."
                imageOL.image = UIImage(named: "Economy")
            case "luxury":
                resultOL.text = "Hello \(travellerName), \nYour booking is confirmed."
                imageOL.image = UIImage(named: "Luxury")
            default:
                break
            }
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
