//
//  TabViews.swift
//  OnBoardingWithSIgnIn
//
//  Created by Darrien Huntley on 6/16/21.
//

import SwiftUI

struct TabViews: View {
    
    @Binding  var index : Int
    @Binding var isShowingSideMenu : Bool

    var body: some View {
        ZStack {
            
            if self.index == 0 {
                VStack(spacing: 0) {
                    HomeView(isShowingSideMenu : $isShowingSideMenu)
                        
                }
            } else
            
            if self.index == 1 {
                VStack(spacing: 0) {
                    ProfileView()
                }
                
            } else
            
            if self.index == 2 {
                VStack(spacing: 0) {
                    HomeView(isShowingSideMenu : $isShowingSideMenu)
                }
            } else
            
            if self.index == 3 {
                VStack(spacing: 0) {
                    HomeView(isShowingSideMenu : $isShowingSideMenu)
                }
            }
            
            
            
            
        }
       
        
        
    }
}

struct TabViews_Previews: PreviewProvider {
    static var previews: some View {
        TabViews(index: .constant(0), isShowingSideMenu: .constant(false))
    }
}
