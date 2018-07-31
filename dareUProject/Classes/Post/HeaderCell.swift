//
//  Head.swift
//  dareUProject
//
//  Created by Mm on 7/30/18.
//  Copyright © 2018 Mm. All rights reserved.
//

//
//  PostHeaderCell.swift
//  InstagramUI
//
//  Created by Duc Tran on 3/25/17.
//  Copyright © 2017 Developers Academy. All rights reserved.
//

import UIKit



class HeaderCell: UITableViewCell {
    @IBOutlet weak var followButton: UIButton!
    @IBOutlet weak var username: UILabel!
    
    var post: Post! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI()
    {
        
        username.text = post.createdBy.username
        
        followButton.layer.borderWidth = 1.0
        followButton.layer.cornerRadius = 2.0
        followButton.layer.borderColor = followButton.tintColor.cgColor
        followButton.layer.masksToBounds = true
    }
    
}












