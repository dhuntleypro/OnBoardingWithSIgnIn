//
//  CustomTabs.swift
//  OnBoardingWithSIgnIn
//
//  Created by Darrien Huntley on 6/16/21.
//

import SwiftUI

struct CustomTabs: View {
    
    @Binding var index : Int
    @State var showSheet = false
    
    var body: some View {
        
        VStack(spacing: 0) {
           // Spacer()
            
            HStack {
                Button(action: {
                    self.index = 0
                }) {
                    Image(systemName: "house")
                }
                .foregroundColor(Color.black.opacity(self.index == 0 ? 1 : 0.2))
                .font(.system(size: 25))
                
                Spacer(minLength: 0)
                
                
                Button(action: {
                    self.index = 1
                    
                }) {
                    Image(systemName: "app")
                }
                .foregroundColor(Color.black.opacity(self.index == 1 ? 1 : 0.2))
                .font(.system(size: 25))
                
                
                Spacer(minLength: 0)
                
                
                Button(action: {
                    showSheet.toggle()
                }) {
              
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.black)
                        .font(.system(size: 50, weight: .regular))
                        .background(Color(.blue)) // ("teal"))
                        .clipShape(Circle())
                }
                .offset(y: -25)
                //    .clipShape(CShape())
                .sheet(isPresented: $showSheet){
                    VStack {
                        Text("Add...")
                            .font(.title)
                            .fontWeight(.heavy)
                    }
                }
                
                
                Spacer(minLength: 0)
                
                Button(action: {
                    self.index = 2
                    
                }) {
                    Image(systemName: "heart")
                }
                .foregroundColor(Color.black.opacity(self.index == 2 ? 1 : 0.2))
                .font(.system(size: 25))
                
                
                
                Spacer(minLength: 0)
                
                
                Button(action: {
                    self.index = 3
                    
                }) {
                    Image(systemName: "person")
                }
                .foregroundColor(Color.black.opacity(self.index == 3 ? 1 : 0.2))
                .font(.system(size: 25))
                
            }
            
            .padding(.horizontal, 35)
          //  .padding(.bottom, 35)
            .background(Color.white)
            
            
            
        }
        .edgesIgnoringSafeArea(.bottom)
        
        
        //    .shadow(color: .red, radius: 5, x: 0, y: 2)
        //      .border(Color.red, width: 4)
        //   .foregroundColor(.black)
        //   .clipShape(CShape())
    }
}


struct CustomTabs_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabs(index: .constant(0))
    }
}
