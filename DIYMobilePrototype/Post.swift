//
//  Post.swift
//  DIYMobilePrototype
//
//  Created by Alex Saberdine on 02/01/2017.
//  Copyright © 2017 Alex Saberdine. All rights reserved.
//

import UIKit
import Foundation

enum PostType{
    case small
    case medium
    case large
}

enum PostStatus{
    case unseen
    case seen
    case archived
}

struct Post:Equatable {
    
    var postID:Int
    var postType:PostType
    
    var postTitle:String?
    var postMessage:String?
    var postImage:UIImage?
    
    var postStatus:PostStatus = .unseen
    
    var postSender:String?
    var postDate:Date?
    
    
    //BREAK OUT TO SEPARATE METHODS
    //Max 3 params.
    
    init(id:Int,type:PostType,title:String?,message:String?,image:UIImage?,sender:String?,date:Date?){
        
        self.postID = id
        self.postType = type
        self.postTitle = title
        self.postMessage = message
        self.postImage = image
        self.postSender = sender
        self.postDate = date
    }
    
    static func == (left: Post, right: Post) -> Bool {
        return left.postID == right.postID && left.postID == right.postID
    }
    
}
