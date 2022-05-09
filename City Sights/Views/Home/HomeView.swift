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
    @State var selectedBusiness: Business?
    
    var body: some View {
        
        if model.restaurants.count != 0 || model.sights.count != 0 {
            
            NavigationView {
                // Determine if list or map should be displayed
                if !isMapShowing {
                    
                    // Show list
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "location")
                            Text(model.placemark?.locality ?? "")
                            Spacer()
                            Button("Map View") {
                                self.isMapShowing = true
                            }
                        }
                        Divider()
                        
                        ZStack(alignment: .top) {
                            
                            BusinessList()
                            
                            HStack {
                                Spacer()
                                YelpAttribution(link: "https://yelp.com")
                            }
                            .padding(.trailing, -20)
                        }
                        
                    }
                    .padding([.horizontal, .top])
                    .navigationBarHidden(true)
                }
                else {
                    
                    ZStack(alignment: .top) {
                     
                        // Show map
                        BusinessMap(selectedBusiness: $selectedBusiness)
                            .ignoresSafeArea()
                            .sheet(item: $selectedBusiness) { business in
                                
                                // Create a BusinessDetail instance
                                // Pass in selected business
                                BusinessDetail(business: business)
                            }
                        
                        // Rectangle overlay
                        ZStack {
                            
                            Rectangle()
                                .foregroundColor(.white)
                                .cornerRadius(5)
                                .frame(height: 48)
                            
                            HStack {
                                Image(systemName: "location")
                                Text(model.placemark?.locality ?? "")
                                Spacer()
                                Button("List View") {
                                    self.isMapShowing = false
                                }
                            }
                            .padding()
                        }
                        .padding()
                    }
                    .navigationBarHidden(true)
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
