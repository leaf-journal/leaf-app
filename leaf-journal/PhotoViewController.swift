//
//  File.swift
//  leaf-journal
//
//  Created by Vibhuti Sharma on 3/25/23.
//


import UIKit



class PhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionBackground: UILabel!
    
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
        let currentDate = Date()
        
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
