//
//  ViewController.swift
//  CoreDataSavePhoto
//
//  Created by HoangLuyen on 12/4/17.
//  Copyright © 2017 HoangLuyen. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameImageTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        // Set photoImageView to display the selected image.
        photoImageView.image = selectedImage
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    // MARK: - Action
    @IBAction func onSelectImage(sender: Any) {
        let imagePickerController = UIImagePickerController()
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func saveImage(sender: UIBarButtonItem) {
        let entity = Entity(context: AppDelegate.context)
        entity.photo = photoImageView.image
        entity.name = nameImageTextField.text
        AppDelegate.saveContext()
        DataService.shared.arrayData.append(entity)
        navigationController?.popToRootViewController(animated: true)
    }
    
}
