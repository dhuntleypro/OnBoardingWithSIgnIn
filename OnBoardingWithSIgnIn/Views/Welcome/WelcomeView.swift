//
//  WelcomeView.swift
//  OnBoardingWithSIgnIn
//
//  Created by Darrien Huntley on 6/10/21.
//

import SwiftUI
import AuthenticationServices


struct WelcomeView: View {
    
    @StateObject var authVM = AuthViewModel()
    
    @Environment(\.colorScheme) var colorScheme
    
    @State var buttonClicked = false
    @State var showSignUpWindow = false
    @State var showSignInWindow = false
    
    @State var email = ""
    @State var password = ""
    @State var confirmedPassword = ""
    
    
    
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width)
                .overlay(Color.black.opacity(0.65))
                .ignoresSafeArea()
            
            VStack(spacing: 25) {
                
                Text("Welcome")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .padding(.top, 50)
                
                Spacer()
                
                
                VStack(alignment: .leading , spacing: 30) {
                    Text("Most Popular\n App")
                        .font(.system(size: 45))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    Text("Internationally known and powered by Darrien Huntley")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 30)
                
                
                Spacer()
                
                // Login Button...
                
                //(FIX - MINIMIZE THIS AND ADD PERAMITOR FOR SYLES .WHITEOUTLINE )
                
                VStack {
                    SignInWithAppleButton { request in
                        
                        // requesting parameters from app login...
                        
                        // remove private from func in loginVM
                        authVM.nonce = randomNonceString()
                        request.requestedScopes = [.email , .fullName]
                        request.nonce = sha256(authVM.nonce)
                        
                    } onCompletion: { result in
                        // getting error or success..
                        
                        switch result{
                        
                        case .success(let user) :
                            print("success")
                            // do login with firebase....
                            guard let credential = user.credential as? ASAuthorizationAppleIDCredential else {
                                print("DEBUG: Error with firebase")
                                return
                            }
                            authVM.authenticate(credential: credential)
                            
                        case.failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                    .signInWithAppleButtonStyle(.white)
                    .frame(height: 55)
                    .clipShape(Capsule())
                    .padding(.horizontal , 40)
                    
                    HStack(spacing: 5) {
                        
                        Button(action: {
                            self.showSignUpWindow.toggle()
                        }) {
                            Text("Register with another account")
                                .foregroundColor(.white)
                                .frame(height: 55)
                        }
                        
                        Text("or")
                            .foregroundColor(.gray)
                        
                        
                        Button(action: {
                            self.showSignInWindow.toggle()
                        }) {
                            Text("Login")
                                .foregroundColor(.white)
                                .frame(height: 55)
                            
                        }
                    }
                    .padding(.bottom)
                }
            }
            
     
            // Firebase Sign Up or Sign In
                HalfModalView(isShown: $showSignUpWindow ,  bgColor: .black, bgOpacityLevel: 1.0, dismissableBackground: true,  modalHeight : 370 ) {
                
                
                SignInOrRegisterWindow(
                    email: $email,
                    password: $password,
                    confirmedPassword: $confirmedPassword,
                    showSignUpWindow: $showSignUpWindow,
                    showSignInWindow: $showSignInWindow
                )
            }
            
            
            
            // Firebase Sign Up or Sign In
            HalfModalView(isShown: $showSignInWindow, bgColor: .black, bgOpacityLevel: 1.0, dismissableBackground: true,  modalHeight : 370 ) {
                
                SignInOrRegisterWindow(
                    email: $email,
                    password: $password,
                    confirmedPassword: $confirmedPassword,
                    showSignUpWindow: $showSignUpWindow,
                    showSignInWindow: $showSignInWindow
                )
            }
        }
        .navigationBarHidden(true)
    }
}
struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WelcomeView()
            
        }
    }
}
