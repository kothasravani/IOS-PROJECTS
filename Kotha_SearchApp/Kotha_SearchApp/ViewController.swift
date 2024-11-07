import UIKit
import AVFoundation

class ViewController: UIViewController, UITextFieldDelegate {
    
    // Arrays for topics with images, descriptions, and keywords
    var actors = [
        ["keyword": "actors", "image": "surya", "description": "Surya is a famous actor from Tamil cinema, known for his versatile roles in movies like 'Singam' and 'Ghajini. He is recognized for his philanthropic efforts as well."],
        ["keyword": "actors", "image": "dq", "description": "Dulquer Salmaan, often referred to as DQ, is an Indian actor known for his roles in Malayalam cinema. He is known for his good looks and impeccable acting skills."],
        ["keyword": "actors", "image": "ntr", "description": "NTR is a prominent Telugu actor and politician. He is known for his powerful performances in films like 'Temper' and 'Janatha Garage.'"]
    ]
    
    var cricketers = [
        ["keyword": "cricketers", "image": "sachin", "description": "Sachin Tendulkar is a cricket legend from India, widely regarded as one of the greatest batsmen in the history of cricket. He holds numerous records in international cricket."],
        ["keyword": "cricketers", "image": "virat", "description": "Virat Kohli is an Indian cricketer, widely regarded as one of the best batsmen in modern cricket. He has broken numerous records and led India to several victories."],
        ["keyword": "cricketers", "image": "dhoni", "description": "MS Dhoni is a former Indian cricketer and captain of the Indian national team. Known for his calm demeanor and finishing abilities, he led India to victory in the 2007 ICC World T20 and the 2011 ICC World Cup."]
    ]
    
    var places = [
        ["keyword": "places", "image": "paris", "description": "Paris is the capital city of France, known for its romantic ambiance, iconic landmarks like the Eiffel Tower, and its rich history in art, fashion, and culture."],
        ["keyword": "places", "image": "Kochi", "description": "Kochi, also known as Cochin, is a major port city in Kerala, India. It is famous for its natural harbor, colonial architecture, and vibrant arts and cultural scene."],
        ["keyword": "places", "image": "newYork", "description": "New York City is a bustling metropolis, famous for its skyscrapers, landmarks like Times Square and Central Park, and its vibrant culture and diverse communities."]
    ]
    
    var flowers = [
        ["keyword": "flowers", "image": "rose", "description": "The rose is a symbol of love and beauty. Its delicate petals come in various colors, each signifying different emotions. Roses are used in various ceremonies and celebrations."],
        ["keyword": "flowers", "image": "tulip", "description": "Tulips are vibrant flowers that bloom in the spring. Known for their unique shape and color variety, they symbolize perfect love."],
        ["keyword": "flowers", "image": "lotus", "description": "The lotus is a symbol of purity, enlightenment, and rebirth in various cultures. It grows in muddy water and rises above the surface, making it a symbol of resilience."]
    ]
    
    var books = [
        ["keyword": "books", "image": "ramayana", "description": "The Ramayana is an ancient Indian epic that narrates the story of Lord Rama, his wife Sita, and his battle to rescue her from the demon king Ravana."],
        ["keyword": "books", "image": "mahabharata", "description": "The Mahabharata is an ancient Indian epic that tells the story of the Kurukshetra War and the fates of the Kaurava and Pandava princes."],
        ["keyword": "books", "image": "bhagavadGita", "description": "The Bhagavad Gita is a 700-verse Hindu scripture that is part of the Mahabharata. It presents a conversation between Prince Arjuna and Lord Krishna, offering guidance on life, duty, and spirituality."]
    ]
    
    var currentTopic: [[String: String]] = [] // Will hold the current topic's data (images, descriptions, etc.)
    var currentImageIndex: Int = 0
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initial setup for UI
        resetUI()
    }
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        guard let keyword = searchTextField.text?.lowercased() else { return }
        
        // Check if the keyword matches any actor
        if let actor = actors.first(where: { $0["keyword"]?.lowercased() == keyword }) {
            currentTopic = actors
            updateContent(for: actor)
        }
        // Check if the keyword matches any cricketer
        else if let cricketer = cricketers.first(where: { $0["keyword"]?.lowercased() == keyword }) {
            currentTopic = cricketers
            updateContent(for: cricketer)
        }
        // Check if the keyword matches any place
        else if let place = places.first(where: { $0["keyword"]?.lowercased() == keyword }) {
            currentTopic = places
            updateContent(for: place)
        }
        // Check if the keyword matches any flower
        else if let flower = flowers.first(where: { $0["keyword"]?.lowercased() == keyword }) {
            currentTopic = flowers
            updateContent(for: flower)
        }
        // Check if the keyword matches any book
        else if let book = books.first(where: { $0["keyword"]?.lowercased() == keyword }) {
            currentTopic = books
            updateContent(for: book)
        }
        // If no match, display a 'not found' message but do not disable searchButton
        else {
            resultImageView.image = UIImage(named: "search_not_found")
            descriptionTextView.text = "Search for actors/cricketers/flowers/places/books...!\nNo match found for '\(keyword)'."
            resetButton.isEnabled = true
        }
    }
    
    // Update the UI based on the selected topic (actor/flower/place/cricketer/book)
    func updateContent(for item: [String: String]) {
        if let imageName = item["image"], let description = item["description"] {
            resultImageView.image = UIImage(named: imageName)
            descriptionTextView.text = description
        }
        updateNavigationButtons()
    }
    
    func updateNavigationButtons() {
        nextButton.isEnabled = currentImageIndex < currentTopic.count - 1
        prevButton.isEnabled = currentImageIndex > 0
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        if currentImageIndex < currentTopic.count - 1 {
            currentImageIndex += 1
            updateContent(for: currentTopic[currentImageIndex])
        }
        AudioServicesPlaySystemSound(1105) // Play a click sound
    }
    
    @IBAction func prevButtonTapped(_ sender: UIButton) {
        if currentImageIndex > 0 {
            currentImageIndex -= 1
            updateContent(for: currentTopic[currentImageIndex])
        }
        AudioServicesPlaySystemSound(1105) // Play a click sound
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        resetUI()
        AudioServicesPlaySystemSound(1111) // Play a reset sound
    }
    
    func resetUI() {
        searchTextField.text = ""
        descriptionTextView.text = "Hello, Sravani!!! "
        descriptionTextView.textAlignment = .center
        resultImageView.image = UIImage(named: "welcome")
        currentTopic = []
        currentImageIndex = 0
        nextButton.isEnabled = false
        prevButton.isEnabled = false
    }
}
