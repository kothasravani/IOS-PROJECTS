//
//  ViewController.swift
//  ImageViewDemo
//
//  Created by Sravani Kotha on 9/12/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageOutlet: UIImageView!
    
    @IBOutlet weak var outPutOL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitBtn(_ sender: UIButton) {
        //    image must be displayed
        imageOutlet.image = UIImage(named: "Art")
        
        //description of image should be displayed
        outPutOL.text = "art🖌️, a visual object or experience consciously created through an expression of skill or imagination🎨"
    }
    
}

