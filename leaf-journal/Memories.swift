//
//  Memories.swift
//  leaf-journal
//
//  Created by L V on 4/9/23.
//

import Foundation
import UIKit

class Memories: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var table: UITableView!
    
    struct Pictures {
        let title: String
        let imageName: String
    }
    
    let pictures = [
        Pictures(title: "Cute cat", imageName: "image")
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let picture = pictures[indexPath.row]
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MemoriesTableViewCell
        cell.lable.text = picture.title
        cell.iconImageView.image = UIImage(named: picture.imageName)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
