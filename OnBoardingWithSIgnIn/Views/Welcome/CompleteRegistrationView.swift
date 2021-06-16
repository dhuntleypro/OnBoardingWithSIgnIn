//
//  CompleteRegistrationView.swift
//  OnBoardingWithSIgnIn
//
//  Created by Darrien Huntley on 6/11/21.
//

import SwiftUI


struct CompleteRegistrationView: View {
    @StateObject var viewModel = AuthViewModel()
    
    
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
            
            CustomTextField(text: $username, placeholder: Text("user"), imageName: "lock", textColor: .gray)
            
            
            CustomTextField(text: $fullname, placeholder: Text("fullname"), imageName: "lock", textColor: .gray)
            
            
            CustomTextField(text: $phoneNumber, placeholder: Text("phoneNumber"), imageName: "lock", textColor: .gray)
                .keyboardType(.numberPad)
            
            
            CustomTextField(text: $fullAddress, placeholder: Text("fullAddress"), imageName: "lock", textColor: .gray)
            
            
            CustomTextField(text: $city, placeholder: Text("city"), imageName: "lock", textColor: .gray)
            
            
            CustomTextField(text: $state, placeholder: Text("state"), imageName: "lock", textColor: .gray)
            
            
            CustomTextField(text: $zip, placeholder: Text("zip"), imageName: "lock", textColor: .gray)
                .keyboardType(.numberPad)
            
            
            Spacer()
            
            Button(action: {
                viewModel.addAdditionUserInformation(username: username, fullname: fullname, profileImageURL: profileImageURL, address: fullAddress, state: state, city: city, zip: zip)
            }) {
                Text("Submit")
            }
        }
    }
}

struct CompleteRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteRegistrationView(username: .constant(""), fullname: .constant(""), phoneNumber: .constant(""), fullAddress: .constant(""), zip: .constant(""), city: .constant(""), state: .constant(""), profileImageURL: .constant(""))
    }
}
