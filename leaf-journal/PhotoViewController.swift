//
//  File.swift
//  leaf-journal
//
//  Created by Vibhuti Sharma on 3/25/23.
//


import UIKit
import Foundation
import RealmSwift


class PhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let realm = try! Realm()
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionBackground: UILabel!
    @IBOutlet weak var photoCaption: UITextView!
    @IBOutlet weak var submitButton: UIButton!
    
    
    @IBAction func submitPressed(_ sender: UIButton) {
        let formatDate = DateFormatter()
        formatDate.dateFormat = "MM/dd/yy"

        let foundationDate = Foundation.Date()
        let dateString = formatDate.string(from: foundationDate)
        
        let entries = realm.objects(Entry.self).filter("dayCurrent = %@", dateString)

        for entry in entries {
            try! realm.write {
                entry.photoCaption = photoCaption.text
            }
        }
        
    }
    

    
    @IBAction func uploadButtonTapped(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.contentMode = .scaleAspectFit
            imageView.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // get the current date
        let currentDate  = Foundation.Date()
        
        // create a date formatter
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy"
        
        // set the formatted date as the text of the label
        dateLabel.text = dateFormatter.string(from: currentDate)
        
        addButton.layer.cornerRadius = 20
        addButton.layer.masksToBounds = true
        
        
        captionBackground.layer.cornerRadius = 10
        captionBackground.layer.masksToBounds = true
        
      
    }
}
