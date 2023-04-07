//
//  DateViewController.swift
//  leaf-journal
//
//  Created by Vibhuti Sharma on 4/7/23.
//

import UIKit
import RealmSwift

class DateViewController: UIViewController {
    
    
    let realm = try! Realm()

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var journalEntry: UITextView!
    @IBOutlet weak var photoCaption: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let specificDate = "04/07/23"
        dateLabel.text = specificDate
        let entries = realm.objects(Entry.self).filter("dayCurrent = %@", specificDate)

        for entry in entries {
            journalEntry.text = entry.journal
            photoCaption.text = entry.photoCaption
        }
        
        
//        if let entry = realm.objects(Entry.self).filter("dayCurrent = %@", specificDate).first?{
//            journalEntry.text = entry.journal
//        }else{
//            journalEntry.text = "Could not find"
//        }
        

        
        
        // set the formatted date as the text of the label
//        dateLabel.text = dateFormatter.string(from: currentDate)
        
        
      
    }
}

