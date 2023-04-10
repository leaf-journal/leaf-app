//
//  Memories.swift
//  leaf-journal
//
//  Created by L V on 4/9/23.
//

import UIKit
import RealmSwift

class Memories: UITableViewController {
    
    
    @IBOutlet var table: UITableView!
    
    
    var entries: Results<Entry>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        entries = realm.objects(Entry.self)
        table.dataSource = self
        
        table.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let entry = entries[indexPath.row]
        cell.textLabel?.text = entry.dayCurrent
        
        //set image
        
        let documentsDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        
        let imageURL = "/" + entry.dayCurrent + ".jpg"
        
        let imagePath = documentsDirectory.appending(imageURL)
        
        if FileManager.default.fileExists(atPath: imagePath) {
            let image = UIImage(contentsOfFile: imagePath)
            
            cell.imageView?.image = image
        }
        
        
        return cell
    }
    
}
