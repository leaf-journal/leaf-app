//
//  ViewController.swift
//  leaf-journal
//
//  Created by Leaf Journal Team on 2/21/23.
//

import UIKit
import RealmSwift
import Foundation


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
        "Describe something that was challenging for you today.",
        "What is something you want to learn or improve on?",
        "What are you looking forward to right now?",
        "What are 10 things that bring you joy?",
        "Write about an act of kindness that someone did for you that took you by surprise.",
        "What are some of your favorite ways to show the people in your life that you love them?",
        "Write about the most fun you had recently. What were you doing and who were you with?",
        "In what ways have you felt supported by friends, family, or your community recently?",
        "In this moment, what are three things in your life that you feel the most grateful for?",
        "What is the one thing you would tell your teenage self if you could?",
        "If you could master one skill, what would it be?",
        "How do you show compassion to others? How do you like compassion shown to you?",
        "What is standing in your way of reaching your goals?",
        "How can you step out of your comfort zone more this year?",
        "What do you want to invite more of into your life this year?",
        "What does friendship mean to you?",
        "Write about something that always makes you smile, no matter what.",
        "What do you most want to accomplish in life?",
        "How do you make time for yourself each day?",
        "How do you show yourself kindness and compassion each day?",
        "What has surprised you, in a good way?",
        "What aspects of your life are you most grateful for?",
        "What three things would you most like others to know about you?",
        "If you were granted one wish, what would you wish for and why?",
        "What would you rather be doing if money and time were no object?",
        "What kind of person do you want to be?",
        "Who or what in your life are you happy to have let go?",
        "What was your best day ever?",
        "Where is your “happy place”? Describe it.",
        "What could you do this week to express gratitude to others?",
        "What adversity are you grateful for?",
        "What do you deeply enjoy doing alone?",
        "Who or what helps you achieve your goals?",
        "What about your upbringing are you most grateful for?",
        "Who made you feel good this week?",
        "What could you not live without and why?",
        "What’s your passion, and how did you discover it?",
        "What have you learned that has changed your values?",
        "What do you wish you were doing more of?",
        "What’s the most important thing to focus on this week?",
        "What is your favorite way to start the day?",
        "Write about a mistake that turned out to be a blessing.",
        "What is something you have always wanted to try, but never have?",
        "What is your favorite thing about your current living space?",
        "What is your personal definition of success, stripped of others’ expectations?",
        "What place do you want to visit, but haven’t been to yet?",
        "What do you not give yourself enough credit for?",
        "What kind of self-care would be most useful right now?",
        "How can I be kinder to myself?",
        "Where did you notice beauty today?",
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
    

         // Set text view delegate to handle keyboard events
         journalInput.delegate = self
    
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           journalInput.resignFirstResponder()
           return true
       }
       
   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       journalInput.resignFirstResponder()
   }

    


  
    
    


}
