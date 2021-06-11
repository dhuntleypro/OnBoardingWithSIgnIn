//
//  WalkthroughScreen.swift
//  OnBoardingWithSIgnIn
//
//  Created by Darrien Huntley on 6/10/21.
//

import SwiftUI

var totalPages = 3

struct WalkthroughScreen: View {
    @EnvironmentObject var viewModel: AuthViewModel

    
    @AppStorage("currentPage") var currentPage = 1
    
    @State var editMode = false
    @State var showDashboard = false
    
    @State var tipOne = false
    @State var tipTwo = false
    
    
    var body: some View {
        
        // For Slide Animation.....
        
        ZStack {
            
            // Changing Between Views.....
            
            if currentPage == 1 {
                ScreenView(image: "onBoardingImage1", title: "Want an App?😏", detail: "Want an online store? Apps for the nation is a place you can have your own store to sell or provide any service for your business", bgColor: Color("onBoardingColor1"))
                    .transition(.scale)
            }
            
            if currentPage == 2 {
                ScreenView(image: "onBoardingImage2", title: "We can help!", detail: "Want an online store? Apps for the nation is a place you can build your own store to sell or provide any service for your business", bgColor: Color("onBoardingColor2"))
                    .transition(.scale)
            }
            
            if currentPage == 3 {
                ZStack {
                    ScreenView(image: "dashboard-screenshot", title: "", detail: "", bgColor: Color("onBoardingColor3"))
                        .transition(.scale)
                    
                    Color.black.opacity(0.7).edgesIgnoringSafeArea(.all)
                
                    if viewModel.userSession != nil && ADMIN_UIDS.contains(viewModel.user?.id ?? "abc") {

                    AdminTipView(editMode: $editMode, showDashboard: $showDashboard, tipOne: $tipOne, tipTwo: $tipTwo)
                        
                    } else {
                        
                        CustomerTipView()
                    }
                
                }
            }
        }
        .navigationBarHidden(true)
        .overlay(
            
            Button(action: {
                
                // changing views.....
                withAnimation(.easeInOut) {
                    
                    // checking...
                    if currentPage <= totalPages {
                        currentPage += 1
                    }
                }
                
            }) {
                Image(systemName: "chevron.right")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black)
                    .frame(width: 60, height: 60)
                    .background(Color.white)
                    .clipShape(Circle())
                    
                    // Circlular Slider...
                    .overlay(
                        ZStack {
                            
                            Circle()
                                .stroke(Color.black.opacity(0.04), lineWidth: 4)
                            
                            Circle()
                                .trim(from: 0, to: CGFloat(currentPage
                                ) / CGFloat(totalPages))
                                .stroke(Color.white , lineWidth : 4)
                                .rotationEffect(.init(degrees: -90))
                            //  .animation(.spring())
                        }
                        .padding(-15)
                    )
            }
            .padding(.bottom , 40)
            
            ,alignment: .bottom
        )
        
        
        
        
        
        
        .overlay(
            HStack {
                
                if currentPage == 1 {
                    
                } else {
                    Button(action: {
                        
                        // changing views.....
                        withAnimation(.easeInOut) {
                            currentPage -= 1
                            
                        }
                        
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(Color.white.opacity(0.4))
                            .cornerRadius(10)
                        
                    }
                }
                Spacer().frame(width: UIScreen.main.bounds.width / 1.5)
                
                
                Button(action: {
                    // changing views.....
                    withAnimation(.easeInOut) {
                        currentPage = 4
                        
                    }
                    
                }) {
                    Text("Skip")
                        .fontWeight(.semibold)
                        .kerning(1.2)
                }
            }
            .padding(.top , 40)
            
            ,alignment: .top
        )
    }
}

struct WalkthroughScreen_Previews: PreviewProvider {
    static var previews: some View {
        WalkthroughScreen()
    }
}
