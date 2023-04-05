//
//  HomeViewController.swift
//  leaf-journal
//
//  Created by Faiza Rahman on 4/4/23.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var MemoriesButton: UIButton!
    @IBOutlet weak var JournalButton: UIButton!

    @IBAction func JournalButton(_ sender: UIButton) {
    }
    @IBAction func MemoriesButton(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            // Connect the PressMemories button to the action method
            MemoriesButton.addTarget(self, action: #selector(pressMemoriesButtonClicked(_:)), for: .touchUpInside)
        
            JournalButton.addTarget(self, action: #selector(pressJournalButtonClicked(_:)), for: .touchUpInside)
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
        let journalVC = ViewController()
            
        // Present the Profile view controller modally
        self.present(journalVC, animated: true, completion: nil)
    }
}
