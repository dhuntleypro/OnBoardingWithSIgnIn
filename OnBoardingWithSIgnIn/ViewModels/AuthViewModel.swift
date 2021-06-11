//
//  AuthViewModel.swift
//  OnBoardingWithSIgnIn
//
//  Created by Darrien Huntley on 6/10/21.
//

import SwiftUI
import CryptoKit
import AuthenticationServices
import Firebase

class AuthViewModel: ObservableObject {
    
    @Published var nonce = ""
    
    // App can be minimuzed by only using user session and removing log_state (FIX)
    @AppStorage("log_status") var log_Status = false
    
    
    @Published var userSession : FirebaseAuth.User?  // keep track if user is logged in
    
    @Published var isAuthenticating = false // period during the log in process loading
    @Published var error : Error? // if error show alert
    @Published var user: User? // keep track of the user - Help load user data
    @Published var appleUser : AppleUser?
    
    // static -- only one isntant of that property is created
    static let shared = AuthViewModel() // shared instant -- in order to have access user, auht, user session (User?)
    @Published var pushed = false
    
    
    init() {
        // SHOW THE CORRECT VIEW - IS THERE A USER ?
        userSession = Auth.auth().currentUser
        
        // GETS THE DATA
        fetchUser()
        
        
    }
    
    // FETCH USER INFORMATION
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        
        COLLECTION_USERS
            .document(uid)
            .getDocument { (snapshot, _) in
                guard let data = snapshot?.data() else { return }
                self.user = User(dictionary: data)
            }
    }
    
    // Firebase Signin
    func login(withEmail email: String , password: String)  {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if let error = error {
                print("DEBUG: Fail tp upload image \(error.localizedDescription)")
                return
                
            }
            
            // LOGIN USER
            self.userSession = result?.user
            self.fetchUser()
            print("DEBUG: Successfully logged in")
            
        }
        
    }
    
    
    // Firebase Simple Registering
    func register(email: String , password: String) {
        
        
        // CREATE AUTHENTICATE NEW USER
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("DEBUG: Error \(error.localizedDescription)")
                return // if error - print error and stop
            }
            
            print("DEBUG: Successfully signup user...")
            print("DEBUG: Email is \(email)")
            
            // CHECK IF USER EXIST
            guard let user = result?.user else { return }
            
            
            // send verification email
            Auth.auth().currentUser?.sendEmailVerification { (error) in
                
                // ADD TO COLLECTION IN CLOUD FIREBASE
                let data = ["email" : email,
                            "uid" : user.uid
                ]
                // FETCH THE USER
                COLLECTION_USERS
                    .document(user.uid)
                    .setData(data) { _ in
                        self.login(withEmail: email, password: password)
                        
                        self.userSession = user
                        self.fetchUser() // elimiates bug on need to close app to see changes
                        print("DEBUG: Successfully uploaded user data to cloud firebase")
                    }
                
                //            // send verification email
                //            Auth.auth().currentUser?.sendEmailVerification { (error) in
                //              // ...
            }
        }
    }
    
    
    
    // Firebase Registering with photo
    func register(email: String , password: String , username: String , fullname: String, profileImage: UIImage) {
        
        // UPLOAD THE IMAGE UOLOADED BY NEW USER
        guard let imageData = profileImage.jpegData(compressionQuality: 0.3) else { return }
        
        let filename = NSUUID().uuidString
        let storageRef = Storage.storage().reference().child(filename)
        
        storageRef.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("DEBUG: Fail tp upload image \(error.localizedDescription)")
            }
            
            
            storageRef.downloadURL { url, _ in
                guard let profileImageURL = url?.absoluteString else { return }
                
                
                // CREATE AUTHENTICATE NEW USER
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    if let error = error {
                        print("DEBUG: Error \(error.localizedDescription)")
                        return // if error - print error and stop
                    }
                    
                    print("DEBUG: Successfully signup user...")
                    print("DEBUG: Email is \(email)")
                    
                    // CHECK IF USER EXIST
                    guard let user = result?.user else { return }
                    
                    // ADD TO COLLECTION IN CLOUD FIREBASE
                    let data = ["email" : email,
                                "username" : username.lowercased(),
                                "fullname" : fullname,
                                "profileImageURL" : profileImageURL,
                                "publishedProducts" : "",
                                "publishedCollections" : "",
                                "uid" : user.uid
                    ]
                    // FETCH THE USER
                    COLLECTION_USERS
                        .document(user.uid)
                        .setData(data) { _ in
                            self.login(withEmail: email, password: password)
                            
                            self.userSession = user
                            self.fetchUser() // elimiates bug on need to close app to see changes
                            print("DEBUG: Successfully uploaded user data to cloud firebase")
                        }
                }
            }
        }
    }
    
    
    func addAdditionUserInformation(username : String , fullname: String , profileImageURL : String , address : String , state : String , city : String , zip : String) {
        
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        
        let currentUserRef = COLLECTION_USERS.document(currentUid)

        let data = ["username" : username.lowercased(),
                    "fullname" : fullname,
                    "profileImageURL" : profileImageURL,
                    
                    "address" : address,
                    "state" : state,
                    "city" : city,
                    "zip" : zip
        ]
        
        currentUserRef
            .setData(data, merge: true) { _ in
                self.fetchUser() // elimiates bug on need to close app to see changes
            }
            
           // .updateData([ "images": FieldValue.arrayUnion(["\(image)"])] ) { _ in
            
            
    }
    
    
    
    

    
    
    // MARK: - APPLE
    
    func authenticate(credential: ASAuthorizationAppleIDCredential) {
        
        // Get Token...
        guard let token = credential.identityToken else {
            print("DEBUG: Error with firebase")
            return
        }
        
        guard let tokenString = String(data: token, encoding: .utf8) else {
            print("DEBUG: Error with token")
            return
        }
        
        let firebaseCredential = OAuthProvider.credential(withProviderID: "apple.com", idToken: tokenString, rawNonce: nonce)
        
        Auth.auth().signIn(with: firebaseCredential) { (result, err) in
            if let error = err {
                print(error.localizedDescription)
                return
            }
            
            // Direct User to Home Page
            withAnimation(.easeInOut){
                self.log_Status = true
            }
            
            // CHECK IF USER EXIST
            guard let user = result?.user else { return }
            
            let data = [ "email" : user.email ?? "email error",
                         "uid" : user.uid
            ] as [String : Any]
            
            COLLECTION_USERS
                .document(user.uid)
                .setData(data)
            
            
            print("User Successfully Logged Into Firebase and saved data to database.. ")
            
        }
    }
    
    
    
    
    
    
    
    
    // MARK: - SIGN OUT
    func signOut() {
        userSession = nil
        user = nil
        try? Auth.auth().signOut()
        print("User has signed out")
    }
    
    
}





// MARK: - Apple .....


// Adapted from https://auth0.com/docs/api-auth/tutorials/nonce#generate-a-cryptographically-random-nonce
func randomNonceString(length: Int = 32) -> String {
    precondition(length > 0)
    let charset: Array<Character> =
        Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
    var result = ""
    var remainingLength = length
    
    while remainingLength > 0 {
        let randoms: [UInt8] = (0 ..< 16).map { _ in
            var random: UInt8 = 0
            let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
            if errorCode != errSecSuccess {
                fatalError("Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)")
            }
            return random
        }
        
        randoms.forEach { random in
            if length == 0 {
                return
            }
            
            if random < charset.count {
                result.append(charset[Int(random)])
                remainingLength -= 1
            }
        }
    }
    
    return result
}

func sha256(_ input: String) -> String {
    let inputData = Data(input.utf8)
    let hashedData = SHA256.hash(data: inputData)
    let hashString = hashedData.compactMap {
        return String(format: "%02x", $0)
    }.joined()
    
    return hashString
}







