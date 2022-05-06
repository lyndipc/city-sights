//
//  LaunchView.swift
//  City Sights
//
//  Created by Lyndi Castrejon on 5/3/22.
//

import SwiftUI

struct LaunchView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        // Detect the authorization status of geolocating the user
        
        
        if model.authorizationState == .notDetermined {
        
            // If undetermined, show onboarding
        }
        else if model.authorizationState == .authorizedWhenInUse || model.authorizationState == .authorizedAlways {
        
            // If approved, show home view
            HomeView()
        }
        else if model.authorizationState == .denied {
            
            // If denied, show Denied view
        }
        
        // If denied, show denied view
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
