//
//  File.swift
//  leaf-journal
//
//  Created by Vibhuti Sharma on 3/25/23.
//


import UIKit
import Foundation
import RealmSwift


class PhotoViewController: UIViewController,  UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {
    
    let realm = try! Realm()
    
    let formatDate = DateFormatter()

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionBackground: UILabel!
    @IBOutlet weak var photoCaption: UITextView!
    @IBOutlet weak var submitButton: UIButton!
    
    
    
    @IBAction func submitPressed(_ sender: UIButton) {
        formatDate.dateFormat = "MM-dd-yy"
        let foundationDate = Foundation.Date()
        let dateString = formatDate.string(from: foundationDate)
 
        let entry = realm.objects(Entry.self).filter("dayCurrent = %@", dateString).first
    
        try! realm.write {
            entry?.photoCaption = photoCaption.text
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
        
        //Save the image to the documents of app
        
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        
        
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        formatDate.dateFormat = "MM-dd-yy"
        let foundationDate = Foundation.Date()
        let dateString = formatDate.string(from: foundationDate)

        let imgName = dateString + ".jpg"
        print(imgName)
        let fileURL = documentsDirectory.appendingPathComponent(imgName)
        guard let imageData = image.jpegData(compressionQuality: 1.0) else {
             return
        }
        try? imageData.write(to: fileURL)
        print("wrote to file")
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
        
        photoCaption.delegate = self
        
      
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           photoCaption.resignFirstResponder()
           return true
    }
       
   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       photoCaption.resignFirstResponder()
   }

    
    
}
