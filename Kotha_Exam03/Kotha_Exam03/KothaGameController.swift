//
//  KothaGameController.swift
//  Kotha_Exam03
//
//  Created by Sravani Kotha on 12/3/24.
//

import UIKit

class KothaGameController: UIViewController {
    
    @IBOutlet weak var imageViewOL: UIImageView!
    @IBOutlet weak var nameOL: UILabel!
    @IBOutlet weak var descriptionOL: UITextView!
    
    var game: Game?
        override func viewDidLoad() {
            super.viewDidLoad()
            if let selectedGame = game {
                        self.title = selectedGame.name
                        imageViewOL.image = selectedGame.imageName
                        nameOL.text = selectedGame.name
                        descriptionOL.text = selectedGame.information
                        
                        // Add animation
                        imageViewOL.alpha = 0
                        UIView.animate(withDuration: 1.0) {
                            self.imageViewOL.alpha = 1.0
                        }
                    }
     
            // Do any additional setup after loading the view.
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
