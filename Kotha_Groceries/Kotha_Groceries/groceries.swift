//
//  groceries.swift
//  Kotha_Groceries
//
//  Created by Sravani Kotha on 12/6/24.
//

import UIKit

// Define the Item struct
struct Item {
    let itemName: String
    let image: UIImage
    let itemPrice: Double
    let itemExpiry: String
    let itemDescription: String
    let itemQuantity: Int
    let itemOrigin: String
}

// Arrays for categories and items
let categories: [String] = ["Fruits", "Vegetables", "Dairy", "Snacks", "Beverages"]

let groceriesData: [String: [Item]] = [
    "Fruits": [
        Item(itemName: "Apple", image: UIImage(named: "apple")!, itemPrice: 1.5, itemExpiry: "1 week", itemDescription: "Fresh red apples", itemQuantity: 10, itemOrigin: "USA"),
        Item(itemName: "Banana", image: UIImage(named: "banana")!, itemPrice: 0.5, itemExpiry: "3 days", itemDescription: "Organic bananas", itemQuantity: 15, itemOrigin: "Ecuador"),
        Item(itemName: "Orange", image: UIImage(named: "orange")!, itemPrice: 1.0, itemExpiry: "2 weeks", itemDescription: "Juicy oranges", itemQuantity: 12, itemOrigin: "Spain"),
        Item(itemName: "Strawberry", image: UIImage(named: "strawberry")!, itemPrice: 2.5, itemExpiry: "3 days", itemDescription: "Fresh strawberries", itemQuantity: 20, itemOrigin: "USA"),
        Item(itemName: "Blueberry", image: UIImage(named: "blueberry")!, itemPrice: 3.0, itemExpiry: "5 days", itemDescription: "Organic blueberries", itemQuantity: 8, itemOrigin: "Canada"),
        Item(itemName: "Mango", image: UIImage(named: "mango")!, itemPrice: 1.8, itemExpiry: "1 week", itemDescription: "Tropical mangoes", itemQuantity: 10, itemOrigin: "India"),
        Item(itemName: "Pineapple", image: UIImage(named: "pineapple")!, itemPrice: 2.0, itemExpiry: "1 week", itemDescription: "Sweet pineapples", itemQuantity: 5, itemOrigin: "Philippines"),
        Item(itemName: "Peach", image: UIImage(named: "peach")!, itemPrice: 1.5, itemExpiry: "4 days", itemDescription: "Juicy peaches", itemQuantity: 15, itemOrigin: "Italy"),
        Item(itemName: "Grapes", image: UIImage(named: "grapes")!, itemPrice: 2.0, itemExpiry: "5 days", itemDescription: "Seedless grapes", itemQuantity: 18, itemOrigin: "Chile"),
        Item(itemName: "Papaya", image: UIImage(named: "papaya")!, itemPrice: 1.2, itemExpiry: "1 week", itemDescription: "Fresh papayas", itemQuantity: 6, itemOrigin: "Mexico")
    ],
    
    "Vegetables": [
        Item(itemName: "Carrot", image: UIImage(named: "carrot")!, itemPrice: 0.8, itemExpiry: "5 days", itemDescription: "Fresh carrots", itemQuantity: 12, itemOrigin: "Canada"),
        Item(itemName: "Broccoli", image: UIImage(named: "broccoli")!, itemPrice: 1.2, itemExpiry: "4 days", itemDescription: "Organic broccoli", itemQuantity: 8, itemOrigin: "Mexico"),
        Item(itemName: "Potato", image: UIImage(named: "potato")!, itemPrice: 0.6, itemExpiry: "2 weeks", itemDescription: "Fresh potatoes", itemQuantity: 20, itemOrigin: "USA"),
        Item(itemName: "Tomato", image: UIImage(named: "tomato")!, itemPrice: 0.7, itemExpiry: "1 week", itemDescription: "Ripe tomatoes", itemQuantity: 15, itemOrigin: "Italy"),
        Item(itemName: "Spinach", image: UIImage(named: "spinach")!, itemPrice: 1.0, itemExpiry: "3 days", itemDescription: "Fresh spinach", itemQuantity: 10, itemOrigin: "USA"),
        Item(itemName: "Onion", image: UIImage(named: "onion")!, itemPrice: 0.9, itemExpiry: "2 weeks", itemDescription: "Sweet onions", itemQuantity: 18, itemOrigin: "India"),
        Item(itemName: "Lettuce", image: UIImage(named: "lettuce")!, itemPrice: 1.2, itemExpiry: "5 days", itemDescription: "Crispy lettuce", itemQuantity: 8, itemOrigin: "USA"),
        Item(itemName: "Cucumber", image: UIImage(named: "cucumber")!, itemPrice: 0.8, itemExpiry: "1 week", itemDescription: "Fresh cucumbers", itemQuantity: 10, itemOrigin: "Mexico"),
        Item(itemName: "Zucchini", image: UIImage(named: "zucchini")!, itemPrice: 1.5, itemExpiry: "1 week", itemDescription: "Organic zucchini", itemQuantity: 7, itemOrigin: "France"),
        Item(itemName: "Bell Pepper", image: UIImage(named: "bell_peppers")!, itemPrice: 1.0, itemExpiry: "1 week", itemDescription: "Colorful bell peppers", itemQuantity: 12, itemOrigin: "Spain")
    ],
    "Dairy": [
        Item(itemName: "Milk", image: UIImage(named: "milk")!, itemPrice: 1.2, itemExpiry: "7 days", itemDescription: "Whole milk", itemQuantity: 20, itemOrigin: "Local Farm"),
        Item(itemName: "Cheese", image: UIImage(named: "cheese")!, itemPrice: 3.5, itemExpiry: "2 weeks", itemDescription: "Aged cheddar cheese", itemQuantity: 5, itemOrigin: "France"),
        Item(itemName: "Yogurt", image: UIImage(named: "yogurt")!, itemPrice: 1.0, itemExpiry: "1 week", itemDescription: "Greek yogurt", itemQuantity: 15, itemOrigin: "Greece"),
        Item(itemName: "Butter", image: UIImage(named: "butter")!, itemPrice: 2.0, itemExpiry: "3 weeks", itemDescription: "Salted butter", itemQuantity: 8, itemOrigin: "USA"),
        Item(itemName: "Cream", image: UIImage(named: "cream")!, itemPrice: 1.8, itemExpiry: "2 weeks", itemDescription: "Fresh cream", itemQuantity: 12, itemOrigin: "Canada"),
        Item(itemName: "Ice Cream", image: UIImage(named: "ice_cream")!, itemPrice: 3.0, itemExpiry: "2 months", itemDescription: "Vanilla ice cream", itemQuantity: 10, itemOrigin: "Italy"),
        Item(itemName: "Cottage Cheese", image: UIImage(named: "cottage_cheese")!, itemPrice: 1.5, itemExpiry: "2 weeks", itemDescription: "Organic cottage cheese", itemQuantity: 6, itemOrigin: "USA"),
        Item(itemName: "Sour Cream", image: UIImage(named: "sour_cream")!, itemPrice: 1.2, itemExpiry: "3 weeks", itemDescription: "Thick sour cream", itemQuantity: 8, itemOrigin: "Mexico"),
        Item(itemName: "Ghee", image: UIImage(named: "ghee")!, itemPrice: 4.0, itemExpiry: "6 months", itemDescription: "Clarified butter", itemQuantity: 3, itemOrigin: "India"),
        Item(itemName: "Parmesan", image: UIImage(named: "parmesan")!, itemPrice: 2.5, itemExpiry: "1 month", itemDescription: "Shredded parmesan cheese", itemQuantity: 7, itemOrigin: "France")
    ],
    
    "Snacks": [
        Item(itemName: "Pretzels", image: UIImage(named: "pretzels")!, itemPrice: 2.5, itemExpiry: "3 months", itemDescription: "Salty pretzels", itemQuantity: 15, itemOrigin: "Germany"),
        Item(itemName: "Popcorn", image: UIImage(named: "popcorn")!, itemPrice: 1.8, itemExpiry: "4 months", itemDescription: "Buttered popcorn", itemQuantity: 20, itemOrigin: "USA"),
        Item(itemName: "Trail Mix", image: UIImage(named: "trailmix")!, itemPrice: 3.5, itemExpiry: "6 months", itemDescription: "Healthy trail mix with nuts", itemQuantity: 10, itemOrigin: "Canada"),
        Item(itemName: "Granola Bars", image: UIImage(named: "granola")!, itemPrice: 4.0, itemExpiry: "2 months", itemDescription: "Oats and honey granola bars", itemQuantity: 8, itemOrigin: "USA"),
        Item(itemName: "Crackers", image: UIImage(named: "crackers")!, itemPrice: 2.2, itemExpiry: "5 months", itemDescription: "Cheese-flavored crackers", itemQuantity: 25, itemOrigin: "USA"),
        Item(itemName: "Candy", image: UIImage(named: "candy")!, itemPrice: 1.5, itemExpiry: "8 months", itemDescription: "Assorted candies", itemQuantity: 30, itemOrigin: "Switzerland"),
        Item(itemName: "Beef Jerky", image: UIImage(named: "jerky")!, itemPrice: 6.5, itemExpiry: "1 year", itemDescription: "Spicy beef jerky", itemQuantity: 12, itemOrigin: "USA"),
        Item(itemName: "Chocolate", image: UIImage(named: "chocolate")!, itemPrice: 3.2, itemExpiry: "8 months", itemDescription: "Dark chocolate bar", itemQuantity: 15, itemOrigin: "Belgium"),
        Item(itemName: "Energy Bars", image: UIImage(named: "energybar")!, itemPrice: 2.8, itemExpiry: "3 months", itemDescription: "High-protein energy bars", itemQuantity: 18, itemOrigin: "USA"),
        Item(itemName: "Peanuts", image: UIImage(named: "peanuts")!, itemPrice: 2.0, itemExpiry: "9 months", itemDescription: "Salted peanuts", itemQuantity: 20, itemOrigin: "India"),
    ],
    
    "Beverages": [
        Item(itemName: "Tea", image: UIImage(named: "tea")!, itemPrice: 4.5, itemExpiry: "1 year", itemDescription: "Green tea bags", itemQuantity: 15, itemOrigin: "China"),
        Item(itemName: "Energy Drink", image: UIImage(named: "energydrink")!, itemPrice: 3.0, itemExpiry: "6 months", itemDescription: "Caffeine energy drink", itemQuantity: 20, itemOrigin: "Austria"),
        Item(itemName: "Soda", image: UIImage(named: "soda")!, itemPrice: 1.5, itemExpiry: "4 months", itemDescription: "Cola soda can", itemQuantity: 50, itemOrigin: "USA"),
        Item(itemName: "Mineral Water", image: UIImage(named: "mineralwater")!, itemPrice: 1.2, itemExpiry: "2 years", itemDescription: "Pure mineral water", itemQuantity: 100, itemOrigin: "Iceland"),
        Item(itemName: "Wine", image: UIImage(named: "wine")!, itemPrice: 12.5, itemExpiry: "5 years", itemDescription: "Red wine bottle", itemQuantity: 10, itemOrigin: "France"),
        Item(itemName: "Beer", image: UIImage(named: "beer")!, itemPrice: 3.5, itemExpiry: "6 months", itemDescription: "Craft beer can", itemQuantity: 30, itemOrigin: "Germany"),
        Item(itemName: "Hot Chocolate", image: UIImage(named: "hotchocolate")!, itemPrice: 3.0, itemExpiry: "1 year", itemDescription: "Hot chocolate mix", itemQuantity: 15, itemOrigin: "Switzerland"),
        Item(itemName: "Smoothie", image: UIImage(named: "smoothie")!, itemPrice: 4.0, itemExpiry: "1 week", itemDescription: "Fruit smoothie bottle", itemQuantity: 12, itemOrigin: "USA"),
        Item(itemName: "Coconut Water", image: UIImage(named: "coconutwater")!, itemPrice: 2.8, itemExpiry: "2 weeks", itemDescription: "Natural coconut water", itemQuantity: 20, itemOrigin: "Thailand"),
        Item(itemName: "Sparkling Water", image: UIImage(named: "sparklingwater")!, itemPrice: 2.0, itemExpiry: "1 year", itemDescription: "Lemon-flavored sparkling water", itemQuantity: 25, itemOrigin: "Italy"),

    ]
]
