//
//  HomeView.swift
//  OnBoardingWithSIgnIn
//
//  Created by Darrien Huntley on 6/10/21.
//


import SwiftUI
import Firebase

struct HomeView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    @AppStorage("log_status") var log_Status = false
    
    @Binding var isShowingSideMenu : Bool
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.top)
            
            VStack(spacing: 20) {
                
                
                HeaderView(isShowingSideMenu: $isShowingSideMenu)
                
                
                Text("User Login Successful!")
                
                Button(action: {
                    // Logging Out User...
                    DispatchQueue.global(qos: .background).async {
                        try? Auth.auth().signOut()
                    }
                    
                    // Setting Back View to Login...
                    withAnimation(.easeInOut) {
                        log_Status = false
                        viewModel.signOut()
                    }
                
                }, label: {
                    Text("Log Out")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.vertical , 12)
                        .frame(width: UIScreen.main.bounds.width / 2)
                        .background(Color.pink)
                        .clipShape(Capsule())
                })
                
                Spacer()
            }
            
        }
        .navigationBarHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(isShowingSideMenu: .constant(false))
    }
}
