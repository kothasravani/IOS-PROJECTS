//
//  ViewController.swift
//  ImageDemo
//
//  Created by Sravani Kotha on 9/12/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageOl: UIImageView!
    
    
    @IBOutlet weak var outputOl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func submitBtn(_ sender: UIButton) {
        //image should be displayed
        imageOl.image = UIImage(named: "pichachu")
        
        //context should be displayed
        outputOl.text = "Pikachu is a large yellow mouse with a lightning bolt-shaped tail, and red sacs on its cheek which can generate large amounts of electricity⚡️⚡️"
    }
    
}

