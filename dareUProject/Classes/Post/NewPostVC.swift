//
//  NewPostVC.swift
//  dareUProject
//
//  Created by Mm on 7/31/18.
//  Copyright © 2018 Mm. All rights reserved.
//

import UIKit

class NewPostVC: UIViewController {
    
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var caption: UITextView!
    
    var textViewPlaceHolderText = "Enter your title here.."
    
    // introducing camera
    var imgPicker: UIImagePickerController!
    var takenImg: UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        caption.text = textViewPlaceHolderText
        caption.textColor = .lightGray
        caption.delegate = self
        
        //showing camera
        imgPicker = UIImagePickerController()
        imgPicker.delegate = self
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imgPicker.sourceType = .camera
            imgPicker.cameraCaptureMode = .photo
        }else{
            imgPicker.sourceType = .photoLibrary
        }
        self.present(imgPicker, animated: true, completion: nil)
        
    }
    
    
    
    @IBAction func shareDareTapped(){
        
    }
}

extension NewPostVC : UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == textViewPlaceHolderText {
            textView.text = ""
            textView.textColor = .white
        }
        textView.becomeFirstResponder()
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.text = textViewPlaceHolderText
            textView.textColor = .lightGray
            
        }
        textView.resignFirstResponder()
    }
}


extension NewPostVC : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        self.takenImg = image
        self.postImg.image = self.takenImg
        self.dismiss(animated: true, completion: nil)
    }
    
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        <#code#>
//    }
    
}









