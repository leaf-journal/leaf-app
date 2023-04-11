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
    @IBOutlet weak var quoteInput: UILabel!
    
    let quotes = [
        "Shoot for the moon. Even if you miss, you'll land among the stars. - Norman Vincent Peale",
        "When you have a dream, you've got to grab it and never let go. - Carol Burnett",
        "Nothing is impossible. The word itself says 'I'm possible!' - Audrey Hepburn",
        "Keep your face always toward the sunshine, and shadows will fall behind you. - Walt Whitman",
        "Success is not final, failure is not fatal: it is the courage to continue that counts. - Winston Churchill",
        "You define your own life. Don't let other people write your script. - Oprah Winfrey",
        "You are never too old to set another goal or to dream a new dream. - Malala Yousafzai",
        "It is during our darkest moments that we must focus to see the light. - Aristotle",
        "Believe you can and you're halfway there. - Theodore Roosevelt",
        "Life is like riding a bicycle. To keep your balance, you must keep moving. - Albert Einstein",
        "Out of the mountain of despair, a stone of hope. - Martin Luther King, Jr.",
        "Each day comes bearing its gifts. Untie the ribbon. - Ann Ruth Schabacker",
        "Living is the art of getting used to what we didn’t expect. - Eleanor C. Wood",
        "Try to be a rainbow in someone else’s cloud. - Maya Angelou",
        "A problem is a chance for you to do your best. - Duke Ellington",
        "Time you enjoy wasting was not wasted. - John Lennon",
        "The world is extremely interesting to a joyful soul. - Alexandra Stoddard",
        "The sky isn’t the limit—the sky has no limit. - Sarah Barker",
        "The best thing about the future is that it comes only one day at a time. - Dean Acheson",
        "Success is often the result of taking a misstep in the right direction. - Al Bernstein",
        "The only failure is not knowing how to be happy. - Celine Dion",
        "Be yourself. No one can ever tell you that you’re doing it wrong. - James Leo Herlihy",
        "Without darkness, there are no dreams. - Karla Kuban",
        "I’ve learned that people will forget what you’ve said, people will forget what you did, but people will never forget how you made them feel. - Maya Angelou",
        "If you can’t reach your destination by one road, try another. - Elsa Schiaparelli",
        "Be like the sun and the meadow, which are not in the least concerned about the coming winter. - George Bernard Shaw",
        "Vitality shows not only in the ability to persist but in the ability to start over. - F. Scott Fitzgerald",
        "A dead end is just a good place to turn around. - Naomi Judd",
        "Success is how high you bounce when you hit bottom. - Gen. George S. Patton",
        "If your world doesn’t allow you to dream, move to one where you can. - Billy Idol",
        "Faith is taking the first step. Even when you don’t see the whole staircase. - Martin Luther King Jr.",
        "The real voyage of discovery consists not in seeking new lands, but in seeing with new eyes. - Marcel Proust",
        "It’s the rough side of the mountain that’s the easiest to climb; the smooth side doesn’t have anything for you",
        "Be yourself; everyone else is already taken. - Oscar Wilde",
          "It is never too late to be what you might have been. - George Eliot",
          "Everything you can imagine is real. - Pablo Picasso",
          "Life isn't about finding yourself. Life is about creating yourself. - George Bernard Shaw",
          "Do what you can, with what you have, where you are. - Theodore Roosevelt",
          "When one door of happiness closes, another opens; but often we look so long at the closed door that we do not see the one which has been opened for us. - Helen Keller",
          "It's the possibility of having a dream come true that makes life interesting. - Paulo Coelho",
          "Turn your wounds into wisdom. - Oprah Winfrey",
          "Don’t waste your time in anger, regrets, worries, and grudges. Life is too short to be unhappy. - Roy T. Bennett",
          "The future belongs to those who believe in the beauty of their dreams. - Eleanor Roosevelt",
          "None but ourselves can free our minds. - Bob Marley",
          "You never fail until you stop trying. - Albert Einstein",
          "The past has no power over the present moment. - Eckhart Tolle",
          "Life is a shipwreck, but we must not forget to sing in the lifeboats. - Voltaire",
          "The purpose of life is to live it, to taste experience to the utmost, to reach out eagerly and without fear for newer and richer experience. - Eleanor Roosevelt",
          "The important thing to you is not how many years in your life, but how much life in your years! - Edward J. Stieglitz",
          "Wanting to be someone else is a waste of the person you are. - Marilyn Monroe"
    ]
            
        
    @IBAction func JournalButton(_ sender: UIButton) {
    }
    @IBAction func MemoriesButton(_ sender: UIButton) {
    }
    

    
    override func viewDidLoad() {
            super.viewDidLoad()
        
            let randomIndex = Int.random(in:0..<quotes.count)
            quoteInput.text = quotes[randomIndex]
            
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


