//
//  SideMenuHeaderView.swift
//  OnBoardingWithSIgnIn
//
//  Created by Darrien Huntley on 6/15/21.
//

import SwiftUI

struct SideMenuHeaderView: View {
    @Binding var isShowingSideMenu : Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            
            Button(action: {
                withAnimation(.spring()) {
                    isShowingSideMenu.toggle()
                }
            }, label: {
                Image(systemName: "xmark")
                    .frame(width: 32, height: 32)
                    .foregroundColor(.white)
                    .padding()
            })
            VStack(alignment : .leading) {
                Image("deku-1")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
                    .padding(.bottom, 16)
                
                Text("Izuku Midoriya")
                    .font(.system(size: 24 , weight: .semibold))
                
                Text("@Deku")
                    .font(.system(size: 14 ))
                    .padding(.bottom, 24)
                
                HStack(spacing: 12) {
                    HStack(spacing: 4) {
                        
                        Text("1,275")
                            .bold()
                        Text("Following")
                    }
                    
                    HStack(spacing: 4) {
                        Text("1M")
                            .bold()
                        Text("Followers")
                    }
                    
                    Spacer()
                }
                
                Spacer()
            }
            .padding()
            .foregroundColor(.white)
            .frame(height: 240)
        }
    }
}

struct SideMenuHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuHeaderView(isShowingSideMenu: .constant(false))
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
    }
}
