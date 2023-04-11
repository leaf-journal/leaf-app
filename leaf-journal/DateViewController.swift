//
//  DateViewController.swift
//  leaf-journal
//
//  Created by Vibhuti Sharma on 4/7/23.
//

import UIKit
import RealmSwift

class DateViewController: UIViewController {
    
    var selectedDate: String?
    
    let realm = try! Realm()

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var journalEntry: UITextView!
    @IBOutlet weak var photoCaption: UITextView!
    @IBOutlet weak var imageJournal: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let formatDate = DateFormatter()
        formatDate.dateFormat = "MM-dd-yy"
        let foundationDate = Foundation.Date()
        var specificDate = formatDate.string(from: foundationDate)
        if let selectedDate = selectedDate {
                    specificDate = selectedDate
        }
        dateLabel.text = specificDate
        let entry = realm.objects(Entry.self).filter("dayCurrent = %@", specificDate).first
        journalEntry.text = entry?.journal
        photoCaption.text = entry?.photoCaption
        
        // Assuming entry is an instance of the Entry object
        let imagePath = specificDate + ".jpg"
        let fileManager = FileManager.default

        if let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = documentDirectory.appendingPathComponent( imagePath)
            do {
                let imageData = try Data(contentsOf: fileURL)
                let image = UIImage(data: imageData)
                imageJournal.image = image
                print("uploaded iamge")
            } catch {
                print("Error loading image: \(error.localizedDescription)")
            }
        }

      
    }
}

