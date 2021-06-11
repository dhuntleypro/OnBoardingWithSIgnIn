//
//  TipWindowView.swift
//  OnBoardingWithSIgnIn
//
//  Created by Darrien Huntley on 6/10/21.
//

import SwiftUI

struct TipWindowView: View {
    var comment : String
    
    var body: some View {
        VStack {
            Text(comment)
                .foregroundColor(.black)

        }
        .frame(width : 300 , height : 200)
        .background(Color.white)
        .cornerRadius(10)
        .padding()
        .padding(.bottom, 200)
    }
}

struct TipWindowView_Previews: PreviewProvider {
    static var previews: some View {
        TipWindowView(comment: "yooooooo")
    }
}
