//
//  ViewController.swift
//  Kotha_PracticeExam03
//
//  Created by Sravani Kotha on 12/2/24.
//

import UIKit

struct Contact {
    let firstName: String
    let lastName: String
    let phoneNumber: String
}

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var TableViewOL: UITableView!
    var contacts: [Contact] = [
        Contact(firstName: "Sravani", lastName: "Kotha", phoneNumber: "345-678-9012"),
        Contact(firstName: "Varsha", lastName: "Pusapati", phoneNumber: "987-123-6540"),
        Contact(firstName: "Pallavi", lastName: "Pokuri", phoneNumber: "567-890-1234"),
        Contact(firstName: "SoorajKhan", lastName: "Pattan", phoneNumber: "456-789-0123"),
        Contact(firstName: "Neeraja", lastName: "Gottimukkula", phoneNumber: "678-901-2345"),
        Contact(firstName: "Shreya", lastName: "Bantaram", phoneNumber: "789-012-3456"),
        Contact(firstName: "Shivani", lastName: "Avula", phoneNumber: "890-123-4567"),
        Contact(firstName: "Brunda", lastName: "Katragadda", phoneNumber: "901-234-5678"),
        Contact(firstName: "Rakesh", lastName: "Karadi", phoneNumber: "123-456-7890"),
        Contact(firstName: "Vasanth", lastName: "Aitha", phoneNumber: "555-444-1111")
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableViewOL.dataSource = self
                TableViewOL.delegate = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return contacts.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
            let contact = contacts[indexPath.row]
            cell.textLabel?.text = "\(contact.firstName) \(contact.lastName)" // Display full name in the cell
            return cell
        }

        // Prepare for segue to ProfileViewController
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "ContactSegue", let indexPath = TableViewOL.indexPathForSelectedRow {
                let selectedContact = contacts[indexPath.row]
                if let profileVC = segue.destination as? profileViewController {
                    profileVC.contact = selectedContact
                }
            }
        }

    

}
