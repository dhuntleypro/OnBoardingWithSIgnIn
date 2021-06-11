//
//  DashboardTipsView.swift
//  OnBoardingWithSIgnIn
//
//  Created by Darrien Huntley on 6/10/21.
//


import SwiftUI

struct AdminTipView: View {
    
    @Binding var editMode : Bool
    @Binding var showDashboard : Bool
    
    @Binding var tipOne : Bool
    @Binding var tipTwo : Bool
    
    
    var body: some View {
        Group {
            VStack(spacing: 30) {
                Text("Welcome To Your Dashboard")
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                    .padding(.top, 100)
                    .foregroundColor(.white)
                
                Text("Add | Edit | Remove Items from your App ")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                
                
                
                Text("We want you to have the best exercises without worrying about as time frame. When your ready to go live, we're ready to")
                
                Text("Test Each Button")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundColor(.blue)
                
                
                
                
                VStack {
                    if tipOne == true {
                        
                        TipWindowView(comment: "change between edit mode (dashboard) and preview")
                        
                    }
                    
                    
                    if tipTwo == true {
                        TipWindowView(comment: "Preview your app (See what your customers see)")
                    }
                    
                    Spacer()
                }
            }
            .foregroundColor(.white)
            .padding()
        }
    }
}

struct AdminTipView_Previews: PreviewProvider {
    static var previews: some View {
        AdminTipView(editMode: .constant(false), showDashboard: .constant(false), tipOne: .constant(false), tipTwo: .constant(false))
    }
}
