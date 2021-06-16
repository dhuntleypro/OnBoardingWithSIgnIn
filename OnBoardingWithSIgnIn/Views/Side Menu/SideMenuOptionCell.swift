//
//  SideMenuOptionCell.swift
//  OnBoardingWithSIgnIn
//
//  Created by Darrien Huntley on 6/15/21.
//


import SwiftUI

struct SideMenuOptionCell: View {
    
    var imageName : String
    var title : String
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: imageName)
                .frame(width: 24, height: 24)
            
            Text(title)
                .font(.system(size: 15, weight: .semibold))
            
            Spacer()
        }
        .foregroundColor(.white)
        .padding()
    }
}

struct SideMenuOptionCell_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuOptionCell(imageName: "person", title: "yoooo")
            .background(Color.black)
    }
}
