//
//  SideMenuView.swift
//  OnBoardingWithSIgnIn
//
//  Created by Darrien Huntley on 6/15/21.
//


import SwiftUI

struct SideMenuView: View {
    @Binding var isShowing : Bool
        
    
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                SideMenuHeaderView(isShowingSideMenu: $isShowing)
                
                SideMenuOptionListView()
                
                Spacer()
            }
        }
        .navigationBarHidden(true)
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(isShowing: .constant(false))
    }
}
