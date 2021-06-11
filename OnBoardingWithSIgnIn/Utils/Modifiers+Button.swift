//
//  Modifiers+Button.swift
//  OnBoardingWithSIgnIn
//
//  Created by Darrien Huntley on 6/10/21.
//

import SwiftUI


struct myFillButton200BY35: ViewModifier {
    var bgColor: Color
    var txtColor: Color
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(txtColor)
            .font(.system(size: 14, weight: .regular, design: .default))
            .frame(width: 200, height: 35, alignment: .center)
            .background(bgColor)
            .clipShape(Capsule())
    }
}
