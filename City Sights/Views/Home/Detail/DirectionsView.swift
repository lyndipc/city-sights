//
//  DirectionsView.swift
//  City Sights
//
//  Created by Lyndi Castrejon on 5/8/22.
//

import SwiftUI

struct DirectionsView: View {
    
    var business: Business
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            // Business title
            HStack {
                BusinessTitle(business: business)
                    .padding([.top, .leading], 20)
                
                Spacer()
                
                if let lat = business.coordinates?.latitude, let long = business.coordinates?.longitude, let name = business.name {
                 
                    Link("Open in Maps", destination: URL(string: "http://maps.apple.com/?sll=\(lat),\(long)&q=\(name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")")!)
                        .padding(.trailing, 20)
                }
            }
            
            // Directions map
            DirectionsMap(business: business)
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}
