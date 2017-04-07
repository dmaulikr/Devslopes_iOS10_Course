//
//  Post.swift
//  Social Network
//
//  Created by Jeffrey Eng on 3/29/17.
//  Copyright © 2017 Jeffrey Eng. All rights reserved.
//

import Foundation
import Firebase

class Post {
    
    private var _caption: String!
    private var _imageUrl: String!
    private var _likes: Int!
    private var _postKey: String!
    private var _postedDate: String!
    private var _postRef: FIRDatabaseReference!
    
    var caption: String {
        return _caption
    }
    
    var imageUrl: String {
        return _imageUrl
    }
    
    var likes: Int {
        return _likes
    }
    
    var postKey: String {
        return _postKey
    }
    
    var postedDate: String {
        return _postedDate
    }
    
    init(caption: String, imageUrl: String, likes: Int) {
        self._caption = caption
        self._imageUrl = imageUrl
        self._likes = likes
        self._postKey =  postKey
    }
    
    init(postKey: String, postData: Dictionary<String, Any>) {
        self._postKey = postKey
        
        if let caption = postData["caption"] as? String {
            self._caption = caption
        }
        
        if let imageUrl = postData["imageUrl"] as? String {
            self._imageUrl = imageUrl
        }
        
        if let likes = postData["likes"] as? Int {
            self._likes = likes
        }
        
        if let postedDate = postData["postedDate"] as? String {
            self._postedDate = postedDate
        }
        
        _postRef = DataService.ds.REF_POSTS.child(_postKey)
    }

    func adjustLikes(addLike: Bool) {
        
        switch addLike {
        case true:
            _likes = _likes + 1
        case false:
            _likes = _likes - 1
        }
        
        _postRef.child("likes").setValue(_likes)

    }
    
}

