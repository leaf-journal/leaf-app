//
//  Memories.swift
//  leaf-journal
//
//  Created by L V on 4/9/23.
//

import UIKit
import RealmSwift

class Memories: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var table: UITableView!
    
    
    var entries: Results<Entry>!
    struct Test {
        let title: String
        let imageName : String
    }
    
    let testData = [
        Test(title: "Today", imageName: "logo")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        entries = realm.objects(Entry.self)
        table.dataSource = self
        table.delegate = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell" as CustomTableViewCell)
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
        //return testData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let entry = entries[indexPath.row]
        //let data = testData[indexPath.row]
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        
        cell.lable.text = entry.dayCurrent
        cell.lable.font = UIFont(name: "Malayalam Sangam MN Bold", size: 17.0)
        
        //set image
        
        let documentsDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        
        let imageURL = "/" + entry.dayCurrent + ".jpg"
        
        let imagePath = documentsDirectory.appending(imageURL)
        
        if FileManager.default.fileExists(atPath: imagePath) {
            let image = UIImage(contentsOfFile: imagePath)
            
            cell.iconImageView.image = image
        }
        
        /*
        cell.lable.text = data.title
        cell.iconImageView.image = UIImage(named: data.imageName) */
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let entry = entries[indexPath.row]
        
        // Deselect the selected row
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Load the storyboard with the desired identifier
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Instantiate the view controller you want to present
        let viewController = storyboard.instantiateViewController(withIdentifier: "showDetail") as! DateViewController
        
        // Pass any necessary data to the view controller
        viewController.selectedDate = entry.dayCurrent

        
        // Present the view controller
        present(viewController, animated: true, completion: nil)

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail",
            let selectedDate = sender as? String,
            let destinationVC = segue.destination as? DateViewController {
                destinationVC.selectedDate = selectedDate
        }
    }
    

}
