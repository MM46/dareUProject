//
//  daresVC.swift
//  dareUProject
//
//  Created by Mm on 7/31/18.
//  Copyright © 2018 Mm. All rights reserved.
//

import UIKit

class daresVC: UIViewController {
    
    @IBAction func StartDare(_ sender: AnyObject){
        let controller = storyboard?.instantiateViewController(withIdentifier: "makingDaresSB")
        self.present(controller!, animated: true, completion: nil)
    }
    
//    @IBAction func RetryDare(_ sender: AnyObject){
//        let controller = storyboard?.instantiateViewController(withIdentifier: "DarePosting")
//        self.present(controller!, animated: true, completion: nil)
//    }
//    
    @IBAction func ShowFeed(_ sender: AnyObject){
        let controller = storyboard?.instantiateViewController(withIdentifier: "FeedNC")
        self.present(controller!, animated: true, completion: nil)
    }
    
    
    
}
