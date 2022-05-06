//
//  HomeView.swift
//  City Sights
//
//  Created by Lyndi Castrejon on 5/4/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    
    @State var isMapShowing = false
    
    var body: some View {
        
        if model.restaurants.count != 0 || model.sights.count != 0 {
            
            // Determine if list or map should be displayed
            if !isMapShowing {
                
                // Show list
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "mappin")
                        Text("San Francisco")
                        Spacer()
                        Text("Switch to map view")
                    }
                    Divider()
                    
                    BusinessList()
                }
                .padding([.horizontal, .top])
            }
            else {
                // Show map
            }
        }
        else {
            ProgressView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
