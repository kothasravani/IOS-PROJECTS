//
//  GroceriesViewController.swift
//  Kotha_Groceries
//
//  Created by Sravani Kotha on 12/6/24.
//

import UIKit

class GroceriesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var itemCollectionView: UICollectionView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var itemExpireLabel: UILabel!
    @IBOutlet weak var itemDescriptionLabel: UILabel!
    @IBOutlet weak var itemQuantityLabel: UILabel!
    @IBOutlet weak var itemOriginLabel: UILabel!

    var selectedCategory: String?
    var items: [Item] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = selectedCategory
        itemCollectionView.delegate = self
        itemCollectionView.dataSource = self

        if let category = selectedCategory {
            items = groceriesData[category] ?? []
        }

        // Show details of the first item by default
        if let firstItem = items.first {
            updateLabels(for: firstItem)
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath) as! ItemCollectionViewCell
        cell.imageView.image = items[indexPath.row].image
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedItem = items[indexPath.row]
        updateLabels(for: selectedItem)
    }

    func updateLabels(for item: Item) {
        itemNameLabel.text = "Name: \(item.itemName)"
        itemPriceLabel.text = "Price: $\(item.itemPrice)"
        itemExpireLabel.text = "Expiry: \(item.itemExpiry)"
        itemDescriptionLabel.text = "Description: \(item.itemDescription)"
        itemQuantityLabel.text = "Quantity: \(item.itemQuantity)"
        itemOriginLabel.text = "Origin: \(item.itemOrigin)"
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
