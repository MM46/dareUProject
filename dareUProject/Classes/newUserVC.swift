//
//  newUserVC.swift
//  dareUProject
//
//  Created by Mm on 3/29/18.
//  Copyright © 2018 Mm. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage
import Firebase




 class newUserVC: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    

    var userEmail: String!
    var userPassword: String!
    var userFullname: String!
    var userUsername: String!
    var imagePicker: UIImagePickerController!
    var imageSelected = false

    
    var userId: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    func keyChain(){
//        KeychainWrapper.standard.set(userId, forKey: "userId")
//    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
//            userIconPicker.image = image

            imageSelected = true
        } else {
            let alertController = UIAlertController(title: "Error", message:
                "Image not found", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        }
        imagePicker.dismiss(animated: true, completion: nil)

    }



    @IBAction func selectedImagaPicker(_ sender: Any){
        present(imagePicker, animated: true, completion: nil)
    }



//    func UploadImage(){
//        guard let img = userIconPicker.image, imageSelected == true else {
//            print ("Must be selected")
//            return
//        }
//
//        func setUpUser(img: String){
//            let userData = [
//                "username" : userUsername!,
//                "userImg" : img
//            ]
//            let setLocation = Database.database().reference().child("users").child(userId)
//            setLocation.setValue(userData)
//        }
//
//        func uploadImg(){
//            if let imgData = UIImageJPEGRepresentation(img, 0.2) {
//                //            let imgUid = NSUUID().uuidString
//                let metaData = StorageMetadata()
//                metaData.contentType = "img/jpeg"
//
//                Storage.storage().reference().child("pic").putData(imgData, metadata: metaData) {
//                    (metaData, error) in
//                    if error != nil {
//                        print("Error updating Image")
//                    } else {
//                        print("Uploaded!")
//                        let download = metaData?.downloadURL()?.absoluteString
//                        if let url = download {
//                            setUpUser(img: url)
//                        }
//                    }
//                }
//
//            }
//        }
//    }


//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        if emailField.text != "" || passwordField.text != "" || usernameField.text != "" || fullnameField.text != "" {
//
//            let welcomeViewC: WelcomeVC = (segue.destination as? WelcomeVC)!
//            welcomeViewC.receivedFullname = fullnameField.text!
//        } else {
//
//        }
//    }



    func ShowFeedVC(){
        performSegue(withIdentifier: "SignUpFeedVC", sender: nil)
    }

    @IBAction func OkTapped(_ sender: Any) {
        let email = emailField.text
        let password = passwordField.text
        let username = usernameField.text


        if (email == "" || password == "" || username == "" ) {
            let alertController = UIAlertController(title: "Error", message:
                "Please fill all the blanks", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))

            self.present(alertController, animated: true, completion: nil)
        }else {
            Auth.auth().createUser(withEmail: email!, password: password!) { (user, error) in
                if error == nil {

                    self.userId = user?.uid
                    self.ShowFeedVC()

                }

                if error != nil {
                    let alertErrorController = UIAlertController(title: "Error", message:
                        "The E-mail is incorrect or has been registered already, try again!", preferredStyle: UIAlertControllerStyle.alert)
                    alertErrorController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))

                    self.present(alertErrorController, animated: true, completion: nil)
                }

            }
        }

    }



}



