//
//  User.swift
//  OnBoardingWithSIgnIn
//
//  Created by Darrien Huntley on 6/10/21.
//

import Firebase

struct User: Identifiable {
    let id: String
    let username: String
    let profileImageURL: String
    let fullname: String
    let email: String
    var stats: UserStats
    var storeName : String
    var phoneNumber : String
    var fullAddress : String
    var zip : String
    var city : String
    var state : String
    
    
    var publishedProducts : [String]
    var publishedCollections : [String]
    var isFollowed = false
    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == self.id }
    
    init(dictionary : [String: Any]) {
        self.id = dictionary["uid"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.profileImageURL = dictionary["profileImageURL"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        
        self.storeName = dictionary["storeName"] as? String ?? ""
        self.phoneNumber = dictionary["phoneNumber"] as? String ?? ""
        self.fullAddress = dictionary["fullAddress"] as? String ?? ""
        self.zip = dictionary["zip"] as? String ?? ""
        self.city = dictionary["city"] as? String ?? ""
        self.state = dictionary["state"] as? String ?? ""
        self.publishedProducts = dictionary["publishedProducts"] as? [String] ?? [""]
        self.publishedCollections = dictionary["publishedCollections"] as? [String] ?? [""]

        self.stats = UserStats(followers: 0, following: 0)

    }
}

struct UserStats {
    let followers: Int
    let following: Int
}


