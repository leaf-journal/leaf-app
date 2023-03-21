//
//  ViewController.swift
//  leaf-journal
//
//  Created by Leaf Journal Team on 2/21/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var happyButton: UIButton!
    @IBOutlet weak var neutralButton: UIButton!
    @IBOutlet weak var sadButton: UIButton!
    @IBOutlet weak var journalInput: UITextField!
    @IBOutlet weak var helloButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var journalBackground: UILabel!
    
    var happyButtonPressed = false
    var sadButtonPressed = false
    var neutralButtonPressed = false
    var selectedButton: UIButton?
    
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if selectedButton != sender {
            // deselect the previously selected button
            selectedButton?.backgroundColor = nil
        }
        selectedButton = sender
        let customColor = UIColor(red: 0.9, green: 0.921, blue: 0.852, alpha: 1)
        sender.backgroundColor = customColor
        sender.layer.cornerRadius = 10
        sender.layer.masksToBounds = true
    }
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get the current date
        let currentDate = Date()
        
        // create a date formatter
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE MMM dd"
        
        // set the formatted date as the text of the label
        dateLabel.text = dateFormatter.string(from: currentDate)
      
        let AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let ModelRef = AppDelegate.modelRef
        // Do any additional setup after loading the view.
        
        
        journalBackground.layer.cornerRadius = 10
        journalBackground.layer.masksToBounds = true
    }
    
    


}

