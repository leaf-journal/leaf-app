//
//  ViewController.swift
//  leaf-journal
//
//  Created by Leaf Journal Team on 2/21/23.
//

import UIKit
import RealmSwift
import Foundation
import FSCalendar

class ViewController: UIViewController, UITextViewDelegate {
    
    // Open the local-only default realm
    let realm = try! Realm()

    //Journal Screen
    
    @IBOutlet weak var happyButton: UIButton!
    @IBOutlet weak var neutralButton: UIButton!
    @IBOutlet weak var sadButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var journalInput: UITextView!
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
    
    @IBAction func submitPressed(_ sender: UIButton) {
        let formatDate = DateFormatter()
        formatDate.dateFormat = "MM-dd-yy"

        let foundationDate = Foundation.Date()
        let dateString = formatDate.string(from: foundationDate)
        
        if let existingEntry = realm.objects(Date.self).filter("date = %@", dateString).first?.entry {
            
            // update alr existing entry
            try! realm.write {
                existingEntry.journal = journalInput.text
                print(existingEntry.journal)
             }
        } else {
    
            //Create Entry
            let entry = Entry(journal: journalInput.text ?? "No entry", dayCurrent: dateString ?? "No date", photoCaption: "No caption")
            try! realm.write {
                realm.add(entry)
            }
            
            //Create date
            let date = Date(entry: entry, date: dateString ?? "No date")
            try! realm.write {
                realm.add(date)
            }
        }
        
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
    
    @objc func dismissKeyboard() {
          view.endEditing(true)
    }
      
    func textViewDidEndEditing(_ textView: UITextView) {
      textView.resignFirstResponder()
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get the current date
        let currentDate = Foundation.Date()
        
        // create a date formatter
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE MMM dd"
        
        // set the formatted date as the text of the label
        dateLabel.text = dateFormatter.string(from: currentDate)
      
        let AppDelegate = UIApplication.shared.delegate as! AppDelegate
//        let ModelRef = AppDelegate.modelRef
        // Do any additional setup after loading the view.
        
        
        journalBackground.layer.cornerRadius = 10
        journalBackground.layer.masksToBounds = true
        
        
        emotionsBackground.layer.cornerRadius = 10
        emotionsBackground.layer.masksToBounds = true
    
        
        let randomIndex = Int.random(in: 0..<journalPrompts.count)
        questionPrompt.text = journalPrompts[randomIndex]
        
        // Add tap gesture recognizer to dismiss keyboard
         let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
         view.addGestureRecognizer(tapGesture)
         
         // Set text view delegate to handle keyboard events
         journalInput.delegate = self
    
        
    }

  
    
    


}
