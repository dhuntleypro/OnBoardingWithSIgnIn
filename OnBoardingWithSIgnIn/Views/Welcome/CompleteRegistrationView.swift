//
//  CompleteRegistrationView.swift
//  OnBoardingWithSIgnIn
//
//  Created by Darrien Huntley on 6/11/21.
//

import SwiftUI


struct CompleteRegistrationView: View {
    
    @Binding var username: String
    @Binding var fullname : String
    @Binding var phoneNumber : String
    @Binding var fullAddress : String
    @Binding var zip : String
    @Binding var city : String
    @Binding var state : String
    @Binding var profileImageURL: String

        
//        var publishedProducts : [String]
//        var publishedCollections : [String]
//        var isFollowed = false
        
    var body: some View {
        VStack {
            CustomTextField(text: $username, placeholder: Text("user"), imageName: "lock")
        }
    }
}

struct CompleteRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteRegistrationView(username: .constant(""), fullname: .constant(""), phoneNumber: .constant(""), fullAddress: .constant(""), zip: .constant(""), city: .constant(""), state: .constant(""), profileImageURL: .constant(""))
    }
}
