//
//  ViewController.swift
//  Contact Details
//
//  Created by Sravani Kotha on 11/14/24.
//

import UIKit

class Contact
{
    var name:String
    var phone:String
    var Department:String
    var office:String
    
    init(name: String, phone: String, Department: String, office: String) {
        self.name = name
        self.phone = phone
        self.Department = Department
        self.office = office
    }
}
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //create cell
        var cell = tableView.dequeueReusableCell(withIdentifier: "reusableCell", for: indexPath)
        //populate cell
        cell.textLabel?.text = contacts[indexPath.row].name
        //return cell
        return cell
    }
    
    
    @IBOutlet weak var tableViewOL: UITableView!
    //create a contact array
    var contacts = [Contact]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableViewOL.delegate = self
        tableViewOL.dataSource = self
        // CFREATE CONTACTS
        
        let contact1 = Contact(name: "Sravani", phone: "9876543210", Department: "CS", office: "CH 3200")
        let contact2 = Contact(name: "Sooraj", phone: "9381540930", Department: "CS-IS", office: "GH 1210")
        let contact3 = Contact(name: "Vasanth", phone: "9897977000", Department: "CS", office: "CH 3000")
        let contact4 = Contact(name: "Shreya", phone: "9559876543", Department: "CS-DS", office: "GH 1100")
        
        contacts.append(contact1)
        contacts.append(contact2)
        contacts.append(contact3)
        contacts.append(contact4)
        
        //sorting
        contacts.sort { ($0.name) < ($1.name)}
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let transition = segue.identifier
        if transition == "resultSegue" {
            var destination = segue.destination
            as! ResultViewController
            destination.contact = contacts[tableViewOL.indexPathForSelectedRow!.row]
        }
    }
}

