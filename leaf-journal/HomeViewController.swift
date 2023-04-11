//
//  HomeViewController.swift
//  leaf-journal
//
//  Created by Faiza Rahman on 4/4/23.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController {
    
    let realm = try! Realm()
    
    @IBOutlet weak var MemoriesButton: UIButton!
    @IBOutlet weak var JournalButton: UIButton!
    
    
    
    @IBOutlet weak var Image1: UIImageView!
    @IBOutlet weak var Image2: UIImageView!
    @IBOutlet weak var Image3: UIImageView!
    @IBOutlet weak var Date1: UIButton!
    @IBOutlet weak var Date2: UIButton!
    @IBOutlet weak var Date3: UIButton!
    
    
    @IBAction func JournalButton(_ sender: UIButton) {
    }
    @IBAction func MemoriesButton(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
            let formatDate = DateFormatter()
            formatDate.dateFormat = "MM-dd-yy"
        
            //Set the dates
            let today = Foundation.Date()
            let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: today)!
            let dayBefore = Calendar.current.date(byAdding: .day, value: -2, to: today)!
            let daydayBefore = Calendar.current.date(byAdding: .day, value: -3, to: today)!
        
            //Convert to strings
            let specificDate1 = formatDate.string(from: yesterday)
            let specificDate2 = formatDate.string(from: dayBefore)
            let specificDate3 = formatDate.string(from: daydayBefore)
            
            //Set button texts to the past three dates
            Date1.setTitle(specificDate1, for: .normal)
            Date2.setTitle(specificDate2, for: .normal)
            Date3.setTitle(specificDate3, for: .normal)
        
            //Create entries based on each dates' information
//            let entry1 = realm.objects(Entry.self).filter("dayCurrent = %@", specificDate1).first
//            let entry2 = realm.objects(Entry.self).filter("dayCurrent = %@", specificDate2).first
//            let entry3 = realm.objects(Entry.self).filter("dayCurrent = %@", specificDate3).first
            
        
            //Entry 1's image
            let imagePath = specificDate1 + ".jpg"
            let fileManager = FileManager.default

            if let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
                let fileURL = documentDirectory.appendingPathComponent( imagePath)
                do {
                    let imageData = try Data(contentsOf: fileURL)
                    let image = UIImage(data: imageData)
                    Image1.image = image
                    print("uploaded iamge")
                } catch {
                    print("Error loading image: \(error.localizedDescription)")
                }
            }
        
            //Entry 2's image
            let imagePath2 = specificDate2 + ".jpg"

            if let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
                let fileURL = documentDirectory.appendingPathComponent( imagePath2)
                do {
                    let imageData = try Data(contentsOf: fileURL)
                    let image = UIImage(data: imageData)
                    Image2.image = image
                    print("uploaded iamge")
                } catch {
                    print("Error loading image: \(error.localizedDescription)")
                }
            }
        
            //Entry 3's image
            let imagePath3 = specificDate3 + ".jpg"

            if let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
                let fileURL = documentDirectory.appendingPathComponent( imagePath3)
                do {
                    let imageData = try Data(contentsOf: fileURL)
                    let image = UIImage(data: imageData)
                    Image3.image = image
                    print("uploaded iamge")
                } catch {
                    print("Error loading image: \(error.localizedDescription)")
                }
            }
        
        
        
            // Connect the PressMemories button to the action method
        if let memoriesButton = MemoriesButton {
            memoriesButton.addTarget(self, action: #selector(pressMemoriesButtonClicked(_:)), for: .touchUpInside)
        }

        if let journalButton = JournalButton {
            journalButton.addTarget(self, action: #selector(pressJournalButtonClicked(_:)), for: .touchUpInside)
        }

    }
        
    // Action method for PressMemories button click
    @IBAction func pressMemoriesButtonClicked(_ sender: UIButton) {
        // Instantiate the Profile view controller
        let profileVC = ProfileViewController()
            
        // Present the Profile view controller modally
        self.present(profileVC, animated: true, completion: nil)
    }
    
    @IBAction func pressJournalButtonClicked(_ sender: UIButton) {
        // Instantiate the Profile view controller
        let journalVC = Memories()
            
        // Present the Profile view controller modally
        self.present(journalVC, animated: true, completion: nil)
    }
    
    
   
    @IBAction func oneClicked(_ sender: UIButton) {
        let today = Foundation.Date()
        let date = Calendar.current.date(byAdding: .day, value: -1, to: today)!
        let formatDate = DateFormatter()
        formatDate.dateFormat = "MM-dd-yy"
        let selectedDate = formatDate.string(from: date)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Instantiate the view controller you want to present
        let viewController = storyboard.instantiateViewController(withIdentifier: "showDetail") as! DateViewController
        viewController.selectedDate = selectedDate
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func twoClicked(_ sender: UIButton) {
        let today = Foundation.Date()
        let date = Calendar.current.date(byAdding: .day, value: -2, to: today)!
        let formatDate = DateFormatter()
        formatDate.dateFormat = "MM-dd-yy"
        let selectedDate = formatDate.string(from: date)
        print("selected date" + selectedDate)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Instantiate the view controller you want to present
        let viewController = storyboard.instantiateViewController(withIdentifier: "showDetail") as! DateViewController
        viewController.selectedDate = selectedDate
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @IBAction func threeClicked(_ sender: UIButton) {
        let today = Foundation.Date()
        let date = Calendar.current.date(byAdding: .day, value: -3, to: today)!
        let formatDate = DateFormatter()
        formatDate.dateFormat = "MM-dd-yy"
        let selectedDate = formatDate.string(from: date)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Instantiate the view controller you want to present
        let viewController = storyboard.instantiateViewController(withIdentifier: "showDetail") as! DateViewController
        viewController.selectedDate = selectedDate
        
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail",
            let selectedDate = sender as? String,
            let destinationVC = segue.destination as? DateViewController {
                destinationVC.selectedDate = selectedDate
        }
    }

}


