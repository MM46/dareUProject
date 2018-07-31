
//
//  File.swift
//  dareUProject
//
//  Created by Mm on 7/30/18.
//  Copyright © 2018 Mm. All rights reserved.
//

import UIKit

struct Post
{
    var createdBy: User
    var timeAgo: String?
    var caption: String?
    var image: UIImage?
    var numberOfLikes: Int?
    var numberOfComments: Int?
    var numberOfShares: Int?
    
    static func fetchPosts() -> [Post]
    {
        var posts = [Post]()
        
        let marianmr = User(username: "Marian Muñoz", profileImg: UIImage(named: "marianmrimg"))
        let tonycastror = User(username: "Marco Castro", profileImg: UIImage(named: "tonycastrorimg"))
        let camilavalr = User(username: "Camila Valdivia", profileImg: UIImage(named: "camilavalrimg"))
        
        let post1 = Post(createdBy: camilavalr, timeAgo: "1 hr", caption: "Jumping the Chinese Wall", image: UIImage(named: "1"), numberOfLikes: 0, numberOfComments: 0, numberOfShares: 0)
        
        let post2 = Post(createdBy: marianmr, timeAgo: "3 hrs", caption: "Kiki Challenge at the OXXO", image: UIImage(named: "2"), numberOfLikes: 8, numberOfComments: 12, numberOfShares: 92)
        
        let post3 = Post(createdBy: tonycastror, timeAgo: "5 hrs", caption: "Working at the Office", image: UIImage(named: "3"), numberOfLikes: 8, numberOfComments: 92, numberOfShares: 89)
       
        
        posts.append(post1)
        posts.append(post2)
        posts.append(post3)

        
        return posts
    }
}

