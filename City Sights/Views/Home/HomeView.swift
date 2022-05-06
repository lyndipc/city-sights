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
            
            NavigationView {
                // Determine if list or map should be displayed
                if !isMapShowing {
                    
                    // Show list
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "mappin")
                            Text("San Francisco")
                            Spacer()
                            Button("Map View") {
                                self.isMapShowing = true
                            }
                        }
                        Divider()
                        
                        BusinessList()
                    }
                    .padding([.horizontal, .top])
                    .navigationBarHidden(true)
                }
                else {
                    // Show map
                    BusinessMap()
                        .ignoresSafeArea()
                    
                }
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
