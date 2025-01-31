//
//  ViewController.swift
//  Kotha_Exam03
//
//  Created by Sravani Kotha on 12/3/24.
//

import UIKit
 
class KothaHomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var KothaTVOL: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Games"
                
        KothaTVOL.delegate = self
        KothaTVOL.dataSource = self
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return games.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "kothaCell", for: indexPath)
            cell.textLabel?.text = games[indexPath.row].name
            return cell
        }
        
        // MARK: - TableView Delegate
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            performSegue(withIdentifier: "kothaDescriptionSegue", sender: indexPath.row)
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "kothaDescriptionSegue",
               let destinationVC = segue.destination as? KothaGameController,
               let index = sender as? Int {
                destinationVC.game = games[index]
            }
        }
 
}
