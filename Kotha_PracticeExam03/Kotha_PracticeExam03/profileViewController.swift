//
//  profileViewController.swift
//  Kotha_PracticeExam03
//
//  Created by Sravani Kotha on 12/2/24.
//

import UIKit

class profileViewController: UIViewController {

    @IBOutlet weak var initialsOL: UILabel!
    
    @IBOutlet weak var phoneNumberOL: UILabel!
    
    var contact: Contact?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let contact = contact {
                    // Format the initials as "Initials: XY" (where XY is the initials)
                    initialsOL.text = "Initials: \(contact.firstName.prefix(1))\(contact.lastName.prefix(1))"
                    
                    // Display the phone number as is
                    phoneNumberOL.text = "Phone Number: \(contact.phoneNumber)"
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
