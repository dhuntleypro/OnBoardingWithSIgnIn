//
//  SignInOrRegisterWindow.swift
//  OnBoardingWithSIgnIn
//
//  Created by Darrien Huntley on 6/10/21.
//


import SwiftUI

struct SignInOrRegisterWindow: View {
    
    @EnvironmentObject var viewModel: AuthViewModel

    @Binding var email : String
    @Binding var password : String
    @Binding var confirmedPassword : String
   
    
    @Binding var showSignUpWindow : Bool
    @Binding var showSignInWindow : Bool
    
    
    var body: some View {
        
        VStack {
            ZStack(alignment: .leading) {
                
                Button(action: {
                    
                    showSignUpWindow = false
                    showSignInWindow = false
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                    
                }
                
                Text(showSignUpWindow  ? "Sign Up" : "Sign In")
                    .font(.title2)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width)
        
            
            
        Text("Please Enter Your Information Below")
            .padding(.bottom, 10)
            .foregroundColor(.gray)
        
        
        VStack(spacing: 8) {
            
            CustomTextField(text: $email, placeholder: Text("Email") , imageName: "envelope")
                .padding()
                .background(Color(.init(white: 1, alpha: 0.15)))
                .cornerRadius(10)
                .foregroundColor(.white)
            
            CustomSecureField(text: $password, placeholder: Text("Password"))
                .padding()
                .background(Color(.init(white: 1, alpha: 0.15)))
                .cornerRadius(10)
                .foregroundColor(.white)
//
//                CustomSecureField(text: $confirmedPassword, placeholder: Text("Confirmed Password"))
//                    .padding()
//                    .background(Color(.init(white: 1, alpha: 0.15)))
//                    .cornerRadius(10)
//                    .foregroundColor(.white)
            
        }
        .padding(.horizontal, 32)
        
            
            VStack(spacing: 4){
            Button(action: {
                
                if showSignUpWindow == true {
                    
                    viewModel.register(email: email, password: password)
                    
                } else if showSignInWindow == true {
                    
                    viewModel.login(withEmail: email, password: password)
                }
                
            }, label: {
                Text(showSignUpWindow ? "Sign Up" : "Sign In")
                    .modifier(myFillButton200BY35(bgColor: .white, txtColor: .black))
            })
            .padding(.vertical)
            
            // URL LINK (fix)

            Text("By tapping sign up or continue with Apple, you agree to our Terms and Conditions and Privacy Policy")
                .foregroundColor(.gray)
              //  .padding(20)
                .font(.system(size: 10))
                .frame(width: 300)
                .padding(.bottom)
            }
           
            Spacer()
            
            
            
        }
        .foregroundColor(.white)
        
        
        
    }
}

struct SignInOrRegisterWindow_Previews: PreviewProvider {
    static var previews: some View {
        SignInOrRegisterWindow(email: .constant(""), password: .constant(""), confirmedPassword: .constant(""), showSignUpWindow: .constant(false), showSignInWindow: .constant(false))
            .background(Color.black)
    }
}
