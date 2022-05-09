//
//  LocationDeniedView.swift
//  City Sights
//
//  Created by Lyndi Castrejon on 5/9/22.
//

import SwiftUI

struct LocationDeniedView: View {
    
    private let backgroundColor = Color(red: 34/255, green: 141/255, blue: 138/255)
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Spacer()
            
            Text("Whoops!")
                .foregroundColor(.white)
                .font(.title)
            
            Text("We need to access your location to provide you with the best sights and restaurants in your area!")
                .foregroundColor(.white)
                .padding(.horizontal)
            
            Spacer()
            
            Button {
                // Open settings
                if let url = URL(string: UIApplication.openSettingsURLString) {
                    
                    if UIApplication.shared.canOpenURL(url) {
                        // If we can open this settings url, then open it
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                }
            } label: {
                
                ZStack {
                    
                    Rectangle()
                        .frame(height: 48)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    
                    Text("Go to settings")
                        .bold()
                        .foregroundColor(backgroundColor)
                        .padding()
                }
                
            }
            .padding(.horizontal, 45)
            
            Spacer()

        }
        .multilineTextAlignment(.center)
        .background(backgroundColor)
    }
}

struct LocationDeniedView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDeniedView()
    }
}
