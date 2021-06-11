//
//  ScreenView.swift
//  OnBoardingWithSIgnIn
//
//  Created by Darrien Huntley on 6/10/21.
//

import SwiftUI

struct ScreenView: View {
    
    var image : String
    var title: String
    var detail: String
    var bgColor : Color
    
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        ZStack {
            
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .overlay(Color.black.opacity(0.7))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Spacer(minLength: 0)
                
                
                Text(title)
                    .font(.system(size: 50, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.top)
                
                
                // Customize ...
                Text(detail)
                    .fontWeight(.semibold)
                    .kerning(1.3)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(width: 300, height: 200)
                
                Spacer(minLength: 120)
                //  Spacer()
            }
            
            
            
        }
        .onAppear() {
            print("DEBUG : currentPage - \(currentPage)")
        }
        
    }
}

struct ScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenView(image: "onBoardingImage1", title: "Step 1", detail: "", bgColor: Color("onBoardingColor1"))
    }
}

