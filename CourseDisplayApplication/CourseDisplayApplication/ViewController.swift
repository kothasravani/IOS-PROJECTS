//
//  ViewController.swift
//  CourseDisplayApplication
//
//  Created by Sravani Kotha on 10/8/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageViewOL: UIImageView!
    
    @IBOutlet weak var crsNumOL: UILabel!
    
    @IBOutlet weak var crsTitleOL: UILabel!
    
    @IBOutlet weak var semesterOL: UILabel!
    
    @IBOutlet weak var prevBtnOL: UIButton!
    
    @IBOutlet weak var nxtBtnOL: UIButton!
    
    
    
    
    
    let courses = [
        ["img1", "44555", "Network Security", "Fall 2024"],
        ["img2", "44643", "Mobile Edge Computing", "Spring 2024"],
        ["img3", "44565", "Project Management", "Summer 2024"]]
    
    var imageNum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageViewOL.image =     UIImage(named:  courses[0][0])
        //display  course num, name, crn
        crsNumOL.text = courses[0][1]
        crsTitleOL.text = courses[0][2]
        semesterOL.text = courses[0][3]
        
    }
    
    @IBAction func prevBtnClicked(_ sender: Any) {
        //decrement the image number
        imageNum -= 1
        
        //display the course details (image, num, title, sem)
        imageViewOL.image = UIImage(named: courses[imageNum][0])
        crsNumOL.text = courses[imageNum][1]
        crsTitleOL.text = courses[imageNum][2]
        semesterOL.text = courses[imageNum][3]
        
        //if in the first image , the prev button is disabled
        if imageNum == 0 {
            prevBtnOL.isEnabled = false
        }
        
        //enable the next button
        if imageNum < courses.count - 1 {
            nxtBtnOL.isEnabled = true
        }
    }
    
    
    @IBAction func nxtBtnClicked(_ sender: Any) {
        //increment the image number
        imageNum += 1
        
        // display the details (image,num,title,sem)
        imageViewOL.image = UIImage(named: courses[imageNum][0])
        crsNumOL.text = courses[imageNum][1]
        crsTitleOL.text = courses[imageNum][2]
        semesterOL.text = courses[imageNum][3]
        
        //Previous button must be enabled to true
        if imageNum > 0 {
            prevBtnOL.isEnabled = true
        }
        
        //Once you reach the end of the array, next button should be disabled
        if imageNum == courses.count - 1 {
            nxtBtnOL.isEnabled = false
        }
    }
}

