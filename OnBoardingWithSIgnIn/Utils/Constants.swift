//
//  Constants.swift
//  OnBoardingWithSIgnIn
//
//  Created by Darrien Huntley on 6/10/21.
//

import SwiftUI
import Firebase


// App Setting
/*
 
 1. Under Signin and Capability
 2. Add sign in with apple
 3. Add in-app purchase
 4. Add firebase...
     In xcode under info tab - paste in REVERSED_CLIENT_ID for GoogleSerices-info file
 

 */


let COLLECTION_USERS = Firestore.firestore().collection("users")


var ADMIN_UIDS = ["JaDWp8rFDfVSGy1A9gnw04DZDO33", "BjWta0QOK7QaujSV5iM5OktV0Vl1", "normal User"]
