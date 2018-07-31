//
//  PostCell.swift
//  dareUProject
//
//  Created by Mm on 7/30/18.
//  Copyright © 2018 Mm. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var numberOfLikes: UIButton!
    @IBOutlet weak var timeAgo: UILabel!
    @IBOutlet weak var postCaption: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    
    var post: Post! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI()
    {
        profileImg.image = post.createdBy.profileImg
        profileImg.layer.cornerRadius = profileImg.bounds.width / 2.0
        profileImg.layer.masksToBounds = true
        self.postImg.image = post.image
        postCaption.text = post.caption
        
        var likes = "\(post.numberOfLikes)"
        
        numberOfLikes.titleLabel?.text = likes
//        numberOfLikes.setTitle("Be the first one to share a comment", for: [])
        timeAgo.text = post.timeAgo
    }
}

