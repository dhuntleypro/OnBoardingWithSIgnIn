//
//  AppNavigation.swift
//  OnBoardingWithSIgnIn
//
//  Created by Darrien Huntley on 6/10/21.
//

import SwiftUI


struct AppNavigation: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    @AppStorage("log_status") var log_Status = false
    @AppStorage("currentPage") var currentPage = 1
    
    
    var body: some View {
        NavigationView {
            ZStack {
                
                
                
                // Admin - Store owner (un-paid)
                if viewModel.userSession != nil && ADMIN_UIDS.contains(viewModel.user?.id ?? "abc") {
                    
                    if currentPage > totalPages {
                        AdminView()
                    } else {
                        WalkthroughScreen()
                    }
                    
                // Apple User
                } else if log_Status == true  {
                    
                    if currentPage > totalPages {
                        HomeView()
                    } else {
                        WalkthroughScreen()
                    }
                    
                    
                // Average customer
                } else if viewModel.userSession != nil  {
                    
                    if currentPage > totalPages {
                        HomeView()
                    } else {
                        WalkthroughScreen()
                    }
                    
                } else if viewModel.userSession == nil {
                    WelcomeView()
                  
                } else if log_Status == false {
                    WelcomeView()
                    
                } else {
                    Text("error with navigation")
                }
            }
        }
    }
}

struct AppNavigation_Previews: PreviewProvider {
    static var previews: some View {
        AppNavigation()
    }
}
