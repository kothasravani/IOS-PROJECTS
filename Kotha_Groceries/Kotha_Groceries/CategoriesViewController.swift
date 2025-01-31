//
//  ViewController.swift
//  Kotha_Groceries
//
//  Created by Sravani Kotha on 12/6/24.
//

import UIKit

class CategoriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var categoryTableViewOL: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Categories"
        categoryTableViewOL.delegate = self
        categoryTableViewOL.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        cell.textLabel?.text = categories[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                let selectedCategory = categories[indexPath.row]
                // Check if the GroceriesViewController is already on the navigation stack
                if let existingVC = navigationController?.viewControllers.first(where: { $0 is GroceriesViewController }) as? GroceriesViewController {
                    // If it exists, update its data and pop to it
                    existingVC.selectedCategory = selectedCategory
                    navigationController?.popToViewController(existingVC, animated: true)
                } else {
                    // Otherwise, perform the segue as usual
                    performSegue(withIdentifier: "groceriesSegue", sender: selectedCategory)
                }
            }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "groceriesSegue" {
            let destinationVC = segue.destination as! GroceriesViewController
            destinationVC.selectedCategory = sender as? String
        }
    }
}
