//
//  ViewController.swift
//  leaf-journal
//
//  Created by Leaf Journal Team on 2/21/23.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    
    //Journal Screen
    
    @IBOutlet weak var happyButton: UIButton!
    @IBOutlet weak var neutralButton: UIButton!
    @IBOutlet weak var sadButton: UIButton!
    @IBOutlet weak var journalInput: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dailyJournal: UILabel!
    @IBOutlet weak var journalBackground: UILabel!
    @IBOutlet weak var emotionsBackground: UILabel!
    @IBOutlet weak var questionPrompt: UILabel!
    
    
    
    var happyButtonPressed = false
    var sadButtonPressed = false
    var neutralButtonPressed = false
    var selectedButton: UIButton?
    let journalPrompts = [
         "What are you grateful for today?",
         "Describe something that was challening for you today.",
         "What is something you want to learn or improve?",
         // ... add more journal prompts
     ]
    
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if selectedButton != sender {
            // deselect the previously selected button
            selectedButton?.backgroundColor = nil
        }
        selectedButton = sender
        let customColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        sender.backgroundColor = customColor
        sender.layer.cornerRadius = 10
        sender.layer.masksToBounds = true
    }
    
    

    @IBAction func profilePressed(_ sender: UIButton) {
        if selectedButton != sender {
            // deselect the previously selected button
            selectedButton?.backgroundColor = nil
        }
        selectedButton = sender
        let customColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
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
        ddateLabel.text = dateFormatter.string(from: currentDate)
      
        let AppDelegate = UIApplication.shared.delegate as! AppDelegate
//        let ModelRef = AppDelegate.modelRef
        // Do any additional setup after loading the view.
        
        
        journalBackground.layer.cornerRadius = 10
        journalBackground.layer.masksToBounds = true
        
        
        emotionsBackground.layer.cornerRadius = 10
        emotionsBackground.layer.masksToBounds = true
    
        
        let randomIndex = Int.random(in: 0..<journalPrompts.count)
        questionPrompt.text = journalPrompts[randomIndex]
        
    }
//    let entry = Entry(journal: journalInput.text, ownerId: dateLabel.text)
//    try! realm.write {
//        realm.add(entry)
//    }
//    
    
    


}
