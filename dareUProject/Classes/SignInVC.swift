//
//  SIgnInVC.swift
//  dareUProject
//
//  Created by Mm on 4/4/18.
//  Copyright © 2018 Mm. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignInVC: ViewController {
 
 
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func firebaseAuth(_ credential: AuthCredential){
        Auth.auth().signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("Unable to Authenticate with Firebase\(String(describing: error))")
            }else{
                if let user = user {
                    print("Succesfully Authenticated")
                    _ = ["provider": user.providerID]
                }
            }
        })
    }
    
    func ShowFeedVC(){
        performSegue(withIdentifier: "FeedVC", sender: nil)
    }
    
    @IBAction func okButtonPressed(_ sender: AnyObject) {
        if let email = emailField.text, let password = passwordField.text {
            Auth.auth().signIn(withEmail: email, password: password, completion: {(user, error) in
                if error == nil {
                    if let user = user {
                        _ = ["provider": user.providerID]
                            self.ShowFeedVC()
                        print("Email authenticated")
                        print("Showing Feed")
                    }
                }else if(email == "" || password == ""){
                    let alertFill = UIAlertController(title: "Error", message: "Please fill all the blanks", preferredStyle:UIAlertControllerStyle.alert)
                    alertFill.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    
                    self.present(alertFill, animated: true, completion: nil)
                    
                }else{
                    let alertUserNotFound = UIAlertController(title: "Error", message: "Email or Password not Found", preferredStyle:UIAlertControllerStyle.alert)
                    alertUserNotFound.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    
                    self.present(alertUserNotFound, animated: true, completion: nil)
                    
                    print("User not authenticated")
                }
            })
        }
    }


}
