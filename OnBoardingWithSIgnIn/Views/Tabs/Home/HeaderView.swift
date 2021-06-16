//
//  HeaderView.swift
//  OnBoardingWithSIgnIn
//
//  Created by Darrien Huntley on 6/15/21.
//

import SwiftUI

struct HeaderView: View {
    @Binding var isShowingSideMenu : Bool
    @State var text = ""

    var body: some View {
        HStack {
            Button(action: {
                withAnimation(.spring()) {
                    isShowingSideMenu.toggle()
                }
            }, label: {
                
                Text("D.")
                    .font(.system(size: 39))
                    .fontWeight(.heavy)
                    .foregroundColor(Color(.blue))
            })
            
            Spacer()
            
            
            CustomTextField(text: $text, placeholder: Text("Search for anything"), imageName: "magnifyingglass", textColor: .gray) //                 .foregroundColor(Color(.init(white: 1, alpha: 0.1)))

                .padding()
                .background(Color(.lightGray).opacity(0.10))
               .cornerRadius(10)
          //      .foregroundColor(.black)
//
            Spacer()
           
            NavigationLink( destination: ProfileView()) {
                    ZStack(alignment: .bottomLeading) {
                        
                        Image("profileBg")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 42, height: 42)
                            .cornerRadius(15)
                        
                        Text("5")
                            .font(.system(size: 14))
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .padding(3)
                            .padding(.horizontal, 3)
                            .background(Color.orange)
                            .cornerRadius(7)
                            .offset(x: -6 , y : 12 )
                    }
                }
            }
            .padding()
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(isShowingSideMenu: .constant(false))
    }
}
