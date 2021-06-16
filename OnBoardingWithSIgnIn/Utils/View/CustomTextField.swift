//
//  CustomTextField.swift
//  OnBoardingWithSIgnIn
//
//  Created by Darrien Huntley on 6/10/21.
//

import SwiftUI

// (tip) allow for custom color in tect field
struct CustomTextField: View {
    @Binding var text: String
    let placeholder: Text
    let imageName : String
    
    @State var textColor : Color
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .foregroundColor(textColor) // .init(white: 1, alpha: 0.87)
                    .padding(.leading, 40)
            }
            
            HStack(spacing: 16) {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(textColor)
                
                TextField("", text: $text)
            }
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(text: .constant(""), placeholder:  Text("Search for anything"), imageName: "magnifyingglass", textColor: .red)
           
    //     .modifier(GrayBackgroundSmall())
   
            
    }
}
