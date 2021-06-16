//
//  CustomerTipView.swift
//  OnBoardingWithSIgnIn
//
//  Created by Darrien Huntley on 6/10/21.
//

import SwiftUI

struct CustomerTipView: View {
    var body: some View {
        VStack(spacing: 20){
            
            Spacer().frame(height: 100)
            
            
            Text("Welcome new customer")
                .font(.title)
                .fontWeight(.heavy)
            
            VStack {
                Text("pkppokogpokf po kpokpkpokopkpok opkop kpokpo kpok pokpok pokp okop kpokpok")
                
                
                Text("pkppokogpokf po kpok opkp okop kpokpo kpok pokpo kpokpo pokok pokpo kpokpo kpok opkpo kpokpo kopkokpo kopkpokpo kpok opkpokopkpok opkop kpokpo kpok pokpok pokp okop kpokpok")
            }
            .frame(width: 300)
            
            
            
            Spacer()
            
           
            
            
            
            
            
        }
        .padding()
        
        
        
    }
}

struct CustomerTipView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerTipView()
    }
}
