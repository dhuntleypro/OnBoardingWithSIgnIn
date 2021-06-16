//
//  CustomTabBar.swift
//  OnBoardingWithSIgnIn
//
//  Created by Darrien Huntley on 6/15/21.
//


import SwiftUI

struct CustomTabBar: View {
    
    @State var index = 0
    @State var  isShowingSideMenu : Bool = false
    
    var body: some View {
        ZStack {
            if isShowingSideMenu {
                SideMenuView(isShowing : $isShowingSideMenu)
            }
            // Home
            ZStack {
                TabViews(index: $index, isShowingSideMenu: $isShowingSideMenu)
                
                VStack {
                    Spacer()
                    CustomTabs(index: $index)
                    
                }
            }
            
            .cornerRadius(isShowingSideMenu ? 20 : 0)
            .offset(x: isShowingSideMenu ? 300 : 0, y: isShowingSideMenu ? 44 : 0)
            .scaleEffect(isShowingSideMenu ? 0.8 : 1)
            .shadow(radius: isShowingSideMenu ? 10 : 0)
        }
        .navigationBarHidden(true)
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
    }
}


struct CShape : Shape {
    func path(in rect: CGRect) -> Path {
        
        return Path{ path in
            path.move(to: CGPoint(x: 0 , y: 0))
            path.addLine(to: CGPoint(x: 0 , y: rect.height))
            path.addLine(to: CGPoint(x: rect.width , y: rect.height))
            path.addLine(to: CGPoint(x: rect.width , y: 0))
            
            path.addArc(center: CGPoint(x: rect.width / 2 , y: 0), radius: 35, startAngle: .zero , endAngle: .init(degrees: 180), clockwise: false)
            
        }
    }
}
