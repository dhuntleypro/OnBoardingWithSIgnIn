//
//  SideMenuOptionListView.swift
//  OnBoardingWithSIgnIn
//
//  Created by Darrien Huntley on 6/15/21.
//


import SwiftUI
import Firebase

struct SideMenuOptionListView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    @AppStorage("log_status") var log_Status = false
    
    var body: some View {
        VStack {
            
            NavigationLink(destination: ProfileView()) {
                SideMenuOptionCell(imageName: "person", title: "Profile")
            }
            
            NavigationLink(destination: ProfileView()) {
                SideMenuOptionCell(imageName: "list.bullet", title: "List")
            }
            
            NavigationLink(destination: ProfileView()) {
                SideMenuOptionCell(imageName: "bookmark", title: "Bookmarks")
            }
            
            NavigationLink(destination: ProfileView()) {
                SideMenuOptionCell(imageName: "bubble.left", title: "Messages")
            }
            
            NavigationLink(destination: ProfileView()) {
                SideMenuOptionCell(imageName: "bell", title: "Notifications")
            }
            
            Spacer()
            
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
            }) {
               
                SideMenuOptionCell(imageName: "arrow.left.square", title: "Logout")
            }
        }
    }
}

struct SideMenuOptionListView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuOptionListView()
    }
}
